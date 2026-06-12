/* qpsk_tun -- bridge TUN/TAP interfaces to the QPSK byte DMA modem.
 *
 * Runs on the jupiter_sdr ARM. Forward path: packets read from the A-side
 * interface are framed (qpsk_frame) and pushed into the Tx byte DMA; the
 * modem carries them over RF; recovered packets from the Rx byte DMA are
 * validated and written to the B-side interface. The reverse direction is
 * expected to be routed over a veth pair by qpsk_net_setup.sh (single-board
 * topology); B-side reads are counted and dropped in DMA mode. On a future
 * two-radio link each board runs one daemon with a single interface.
 *
 * DMA register sequences follow ByteDmaRegisters.m (the proven recipes):
 * engine reset = CONTROL 0 then 1 before use; Tx one-shots use FLAGS=2
 * (TLAST only -- the in-FPGA word aligner needs per-transfer tlast); Rx
 * one-shots rely on the IP's SYNC_TRANSFER_START to align each 280-byte
 * transfer to a packet boundary. The modem register file at 0x9D000000
 * (soft reset, tx_data_source, selects) is owned by qpsk_net_setup.sh.
 *
 * Modes:
 *   default      DMA bridge between -i A and -i B (board only)
 *   -l           loopback: A<->B in-process through encode/decode (no DMA;
 *                host-testable plumbing check)
 *   -e           echo: no tun; generate/check frames over the DMA path and
 *                report CRC-drop/seq-gap rates (link baseline)
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <signal.h>
#include <poll.h>
#include <time.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <net/if.h>
#include <linux/if_tun.h>
#include "qpsk_frame.h"

#define TX_DMA_BASE  0x9D100000u
#define RX_DMA_BASE  0x9D200000u
#define TX_BUF_PHYS  0x7FF00000u
#define RX_BUF_PHYS  0x7FF40000u
#define SLOT_BYTES   512u
#define TX_SLOTS     8u
#define RX_SLOTS     8u
#define MAX_INFLIGHT 2

/* axi_dmac register map (byte offsets) */
#define DMAC_IRQ_MASK      0x080
#define DMAC_CONTROL       0x400
#define DMAC_TRANSFER_ID   0x404
#define DMAC_SUBMIT        0x408
#define DMAC_FLAGS         0x40C
#define DMAC_DEST_ADDRESS  0x410
#define DMAC_SRC_ADDRESS   0x414
#define DMAC_X_LENGTH      0x418
#define DMAC_TRANSFER_DONE 0x428

#define DMAC_FLAG_TLAST    0x2

struct dmac {
    volatile uint32_t *regs;
};

static struct {
    uint64_t tun_a_rx, tun_b_rx, tun_b_tx, tun_a_tx;
    uint64_t frames_tx, frames_rx_ok, crc_drops, seq_gaps;
    uint64_t oversize, tx_stalls, b_side_drops;
    uint64_t retx, dups, recovered;
} st;

static volatile sig_atomic_t running = 1;
static volatile sig_atomic_t dump_req = 0;

static void on_term(int s) { (void)s; running = 0; }
static void on_usr1(int s) { (void)s; dump_req = 1; }

static void stats_dump(void)
{
    fprintf(stderr,
        "qpsk_tun stats: tunA_rx=%llu tunA_tx=%llu tunB_rx=%llu tunB_tx=%llu "
        "dma_tx=%llu dma_rx_ok=%llu crc_drop=%llu seq_gap=%llu "
        "oversize=%llu tx_stall=%llu b_drop=%llu "
        "retx=%llu dups=%llu recovered=%llu\n",
        (unsigned long long)st.tun_a_rx, (unsigned long long)st.tun_a_tx,
        (unsigned long long)st.tun_b_rx, (unsigned long long)st.tun_b_tx,
        (unsigned long long)st.frames_tx, (unsigned long long)st.frames_rx_ok,
        (unsigned long long)st.crc_drops, (unsigned long long)st.seq_gaps,
        (unsigned long long)st.oversize, (unsigned long long)st.tx_stalls,
        (unsigned long long)st.b_side_drops, (unsigned long long)st.retx,
        (unsigned long long)st.dups, (unsigned long long)st.recovered);
}

static uint32_t dmac_rd(struct dmac *d, uint32_t off)
{
    return d->regs[off / 4];
}

static void dmac_wr(struct dmac *d, uint32_t off, uint32_t val)
{
    d->regs[off / 4] = val;
}

static void *map_phys(int memfd, uint32_t phys, size_t len)
{
    void *p = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED,
                   memfd, (off_t)phys);
    if (p == MAP_FAILED) {
        fprintf(stderr, "mmap 0x%08x: %s\n", phys, strerror(errno));
        exit(1);
    }
    return p;
}

static void dmac_init(struct dmac *d)
{
    dmac_wr(d, DMAC_CONTROL, 0);   /* engine reset before reprogramming */
    dmac_wr(d, DMAC_CONTROL, 1);
    dmac_wr(d, DMAC_IRQ_MASK, 3);  /* polled operation */
}

/* ---- Tx side: per-frame one-shots, <= MAX_INFLIGHT outstanding ---- */
static struct dmac txd;
static unsigned char *txbuf;
static uint32_t tx_ids[MAX_INFLIGHT];
static int tx_inflight = 0;
static unsigned tx_slot = 0;

static void tx_reap(void)
{
    while (tx_inflight > 0 &&
           ((dmac_rd(&txd, DMAC_TRANSFER_DONE) >> tx_ids[0]) & 1)) {
        memmove(tx_ids, tx_ids + 1, sizeof(tx_ids[0]) * (size_t)(tx_inflight - 1));
        tx_inflight--;
    }
}

static int tx_capacity(void)
{
    tx_reap();
    return tx_inflight < MAX_INFLIGHT;
}

/* blocks (bounded) for a free submission slot; returns 0 on success */
static int tx_send(const unsigned char *pkt)
{
    int spins = 0;
    while (!tx_capacity()) {
        if (++spins > 20000) { st.tx_stalls++; return -1; } /* ~2 s */
        usleep(100);
    }
    unsigned char *slot = txbuf + (tx_slot % TX_SLOTS) * SLOT_BYTES;
    memcpy(slot, pkt, QPSK_PKT_BYTES);
    uint32_t id = dmac_rd(&txd, DMAC_TRANSFER_ID);
    dmac_wr(&txd, DMAC_SRC_ADDRESS, TX_BUF_PHYS + (tx_slot % TX_SLOTS) * SLOT_BYTES);
    dmac_wr(&txd, DMAC_X_LENGTH, QPSK_PKT_BYTES - 1);
    dmac_wr(&txd, DMAC_FLAGS, DMAC_FLAG_TLAST);
    dmac_wr(&txd, DMAC_SUBMIT, 1);
    tx_ids[tx_inflight++] = id;
    tx_slot++;
    st.frames_tx++;
    return 0;
}

/* ---- Rx side ----
 * Hardware-measured constraints (devmem probes, bitstream 6cb464e3): the
 * per-packet TLAST terminates every transfer at 280 bytes regardless of
 * X_LENGTH, and the engine never starts a second transfer without an
 * engine reset (matching ByteDmaRegisters.rxCapture's reset-per-capture).
 * So: one outstanding 280-byte transfer, and on completion copy out,
 * reset, resubmit immediately. The gap between a packet's last data beat
 * and the next packet's sync beat is ~18 us; mmap'd register turnaround
 * is ~1 us, so a spinning main loop captures every packet. */
static struct dmac rxd;
static unsigned char *rxbuf;
static int rx_active = 0;

static void rx_start(void)
{
    memset(rxbuf, 0, QPSK_PKT_BYTES);
    dmac_wr(&rxd, DMAC_CONTROL, 0);
    dmac_wr(&rxd, DMAC_CONTROL, 1);
    dmac_wr(&rxd, DMAC_IRQ_MASK, 3);
    /* TRANSFER_ID is 0 after reset; completion is TRANSFER_DONE bit0 */
    dmac_wr(&rxd, DMAC_DEST_ADDRESS, RX_BUF_PHYS);
    dmac_wr(&rxd, DMAC_X_LENGTH, QPSK_PKT_BYTES - 1);
    dmac_wr(&rxd, DMAC_FLAGS, 0);
    dmac_wr(&rxd, DMAC_SUBMIT, 1);
    rx_active = 1;
}

/* copies a completed packet into out and rearms; returns 1 if a packet
 * was delivered */
static int rx_pump(unsigned char *out)
{
    if (!rx_active) {
        rx_start();
        return 0;
    }
    if (!(dmac_rd(&rxd, DMAC_TRANSFER_DONE) & 1))
        return 0;
    memcpy(out, rxbuf, QPSK_PKT_BYTES);
    rx_start();
    return 1;
}

/* ---- link-layer ARQ (DMA tun mode) ----
 * The parked in-FPGA-Tx artifact corrupts frames in bursts (~8 frames,
 * ~34 episodes/s -> ~17% loss), which collapses TCP cubic to ~0.2 Mbit/s.
 * Both RF endpoints terminate in this process, so recovery is local: keep
 * the last HIST_SZ transmitted frames; when a validated frame's seq jumps
 * past the expected value, resubmit the missing seqs from history (each
 * lands ~one RF round later, almost always outside the episode). Delivery
 * is deduplicated; IP tolerates the reordering this introduces. */
#define HIST_SZ    256u   /* power of two; > frames per episode + RTT */
#define RETX_MAX   3      /* per-seq resubmission cap */
#define RETXQ_SZ   512u
#define DEDUP_SZ   512u

struct hist_ent {
    uint32_t seq;
    unsigned char pkt[QPSK_PKT_BYTES];
    unsigned char retries;
    unsigned char valid;
};
static struct hist_ent tx_hist[HIST_SZ];
static uint32_t retxq[RETXQ_SZ];
static unsigned retxq_head = 0, retxq_tail = 0;
static uint32_t dedup_ring[DEDUP_SZ];
static unsigned dedup_pos = 0;
static int arq_on = 1;

/* second-copy scheduler: a retransmit lost inside another corruption
 * episode is invisible to gap detection, so every first retransmit gets a
 * second copy ~RETX2_DELAY rx-frames (~10 ms) later -- beyond an episode
 * length, decorrelating the two copies. rx_tick advances on every
 * validated rx frame (the link's natural clock). */
#define RETX2_DELAY 16
static struct { uint32_t seq; uint64_t due; } retx2q[RETXQ_SZ];
static unsigned retx2_head = 0, retx2_tail = 0;
static uint64_t rx_tick = 0;

static void hist_store(uint32_t seq, const unsigned char *pkt)
{
    struct hist_ent *h = &tx_hist[seq % HIST_SZ];
    h->seq = seq;
    memcpy(h->pkt, pkt, QPSK_PKT_BYTES);
    h->retries = 0;
    h->valid = 1;
}

static void retx_request(uint32_t seq)
{
    if (retxq_tail - retxq_head >= RETXQ_SZ)
        return; /* queue full: episode bigger than recovery capacity */
    retxq[retxq_tail++ % RETXQ_SZ] = seq;
}

static int dedup_seen(uint32_t seq);

/* resubmit queued seqs while the Tx DMA has capacity */
static void retx_pump(void)
{
    /* promote due second copies, skipping any already delivered (the
     * dedup ring is RX-side knowledge, but this is one process) */
    while (retx2_head != retx2_tail && rx_tick >= retx2q[retx2_head % RETXQ_SZ].due) {
        uint32_t s2 = retx2q[retx2_head % RETXQ_SZ].seq;
        if (!dedup_seen(s2))
            retx_request(s2);
        retx2_head++;
    }
    while (retxq_head != retxq_tail && tx_capacity()) {
        uint32_t seq = retxq[retxq_head++ % RETXQ_SZ];
        struct hist_ent *h = &tx_hist[seq % HIST_SZ];
        if (!h->valid || h->seq != seq || h->retries >= RETX_MAX)
            continue;
        h->retries++;
        if (tx_send(h->pkt) == 0) {
            st.retx++;
            if (h->retries == 1 && retx2_tail - retx2_head < RETXQ_SZ) {
                retx2q[retx2_tail % RETXQ_SZ].seq = seq;
                retx2q[retx2_tail % RETXQ_SZ].due = rx_tick + RETX2_DELAY;
                retx2_tail++;
            }
        }
    }
}

static int dedup_seen(uint32_t seq)
{
    for (unsigned i = 0; i < DEDUP_SZ; i++)
        if (dedup_ring[i] == seq)
            return 1;
    return 0;
}

static void dedup_mark(uint32_t seq)
{
    dedup_ring[dedup_pos++ % DEDUP_SZ] = seq;
}

/* ---- TUN/TAP ---- */
static int tun_alloc(const char *name, int tap)
{
    struct ifreq ifr;
    int fd = open("/dev/net/tun", O_RDWR | O_NONBLOCK);
    if (fd < 0) { perror("/dev/net/tun"); exit(1); }
    memset(&ifr, 0, sizeof ifr);
    ifr.ifr_flags = (short)((tap ? IFF_TAP : IFF_TUN) | IFF_NO_PI);
    strncpy(ifr.ifr_name, name, IFNAMSIZ - 1);
    if (ioctl(fd, TUNSETIFF, &ifr) < 0) {
        fprintf(stderr, "TUNSETIFF %s: %s\n", name, strerror(errno));
        exit(1);
    }
    return fd;
}

static void usage(const char *argv0)
{
    fprintf(stderr,
        "usage: %s -i ifA [-i ifB] [-t] [-l | -e] [-m mtu] [-s secs] [-d secs]\n"
        "  -i name   interface name (give twice: A-side then B-side)\n"
        "  -t        TAP instead of TUN (set iface MTU <= %d - 14)\n"
        "  -l        loopback mode: A<->B in-process, no DMA (host test)\n"
        "  -e        echo mode: no tun; frame generator/checker over DMA\n"
        "  -R        disable the link-layer ARQ (gap-driven retransmit)\n"
        "  -m mtu    max payload accepted (default %d)\n"
        "  -s secs   periodic stats dump interval (default off)\n"
        "  -d secs   echo-mode duration (default 60)\n",
        argv0, QPSK_FRAME_MAX_PAYLOAD, QPSK_FRAME_MAX_PAYLOAD);
    exit(2);
}

static double now_s(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

static void dma_open(void)
{
    int memfd = open("/dev/mem", O_RDWR | O_SYNC);
    if (memfd < 0) { perror("/dev/mem"); exit(1); }
    txd.regs = map_phys(memfd, TX_DMA_BASE, 0x1000);
    rxd.regs = map_phys(memfd, RX_DMA_BASE, 0x1000);
    txbuf = map_phys(memfd, TX_BUF_PHYS, TX_SLOTS * SLOT_BYTES);
    rxbuf = map_phys(memfd, RX_BUF_PHYS, RX_SLOTS * SLOT_BYTES);
    dmac_init(&txd);
    rx_start();
}

static void echo_mode(int duration)
{
    unsigned char pkt[QPSK_PKT_BYTES];
    unsigned char payload[QPSK_FRAME_MAX_PAYLOAD];
    unsigned char out[QPSK_FRAME_MAX_PAYLOAD];
    uint32_t tx_seq = 0, last_rx_seq = 0;
    int have_rx = 0;
    double t0 = now_s(), tlast = t0;

    dma_open();
    while (running && now_s() - t0 < duration) {
        if (tx_capacity()) {
            for (int i = 0; i < QPSK_FRAME_MAX_PAYLOAD; i++)
                payload[i] = (unsigned char)(tx_seq + (uint32_t)i);
            qpsk_frame_encode(pkt, payload, QPSK_FRAME_MAX_PAYLOAD, tx_seq);
            if (tx_send(pkt) == 0)
                tx_seq++;
        }
        unsigned char rpkt[QPSK_PKT_BYTES];
        if (rx_pump(rpkt)) {
            uint32_t seq;
            int n = qpsk_frame_decode(rpkt, out, &seq);
            if (n < 0) {
                st.crc_drops++;
            } else {
                st.frames_rx_ok++;
                if (have_rx && seq != last_rx_seq + 1)
                    st.seq_gaps++;
                last_rx_seq = seq;
                have_rx = 1;
            }
        }
        if (now_s() - tlast >= 5.0) {
            tlast = now_s();
            fprintf(stderr, "echo: t=%.0fs tx=%llu rx_ok=%llu crc_drop=%llu gaps=%llu\n",
                now_s() - t0, (unsigned long long)st.frames_tx,
                (unsigned long long)st.frames_rx_ok,
                (unsigned long long)st.crc_drops,
                (unsigned long long)st.seq_gaps);
        }
        /* no sleep: spinning keeps the rx rearm gap ~1 us (<18 us budget) */
    }
    printf("ECHO: dur=%.1f tx=%llu rx_ok=%llu crc_drop=%llu gaps=%llu\n",
        now_s() - t0, (unsigned long long)st.frames_tx,
        (unsigned long long)st.frames_rx_ok,
        (unsigned long long)st.crc_drops, (unsigned long long)st.seq_gaps);
}

int main(int argc, char **argv)
{
    const char *ifnames[2] = {NULL, NULL};
    int nif = 0, tap = 0, loopback = 0, echo = 0;
    int mtu = QPSK_FRAME_MAX_PAYLOAD, stats_int = 0, duration = 60;
    int opt;

    while ((opt = getopt(argc, argv, "i:tleRm:s:d:h")) != -1) {
        switch (opt) {
        case 'i':
            if (nif < 2) ifnames[nif++] = optarg;
            break;
        case 't': tap = 1; break;
        case 'l': loopback = 1; break;
        case 'e': echo = 1; break;
        case 'R': arq_on = 0; break;
        case 'm': mtu = atoi(optarg); break;
        case 's': stats_int = atoi(optarg); break;
        case 'd': duration = atoi(optarg); break;
        default: usage(argv[0]);
        }
    }
    if (mtu < 1 || mtu > QPSK_FRAME_MAX_PAYLOAD) {
        fprintf(stderr, "mtu must be 1..%d\n", QPSK_FRAME_MAX_PAYLOAD);
        return 2;
    }

    signal(SIGINT, on_term);
    signal(SIGTERM, on_term);
    signal(SIGUSR1, on_usr1);
    signal(SIGPIPE, SIG_IGN);

    if (echo) {
        echo_mode(duration);
        return 0;
    }
    if (nif != 2)
        usage(argv[0]);

    memset(dedup_ring, 0xFF, sizeof dedup_ring); /* 0 is a valid seq */

    int fda = tun_alloc(ifnames[0], tap);
    int fdb = tun_alloc(ifnames[1], tap);
    if (!loopback)
        dma_open();
    /* setup scripts wait for this line before moving ifaces into netns */
    printf("READY %s %s\n", ifnames[0], ifnames[1]);
    fflush(stdout);

    /* TAP frames carry a 14-byte ethernet header on top of the payload MTU */
    int max_read = mtu + (tap ? 14 : 0);
    if (max_read > QPSK_FRAME_MAX_PAYLOAD)
        max_read = QPSK_FRAME_MAX_PAYLOAD;

    unsigned char buf[QPSK_FRAME_MAX_PAYLOAD + 64];
    unsigned char pkt[QPSK_PKT_BYTES];
    unsigned char out[QPSK_FRAME_MAX_PAYLOAD];
    uint32_t tx_seq = 0, last_rx_seq = 0;
    int have_rx = 0;
    double tlast = now_s();

    struct pollfd pfds[2] = {
        { .fd = fda, .events = POLLIN },
        { .fd = fdb, .events = POLLIN },
    };

    while (running) {
        if (dump_req) { dump_req = 0; stats_dump(); }

        /* only read the A side when the Tx DMA can take a frame; in DMA
         * mode spin (timeout 0) so the rx rearm gap stays in-budget */
        pfds[0].events = (short)((loopback || tx_capacity()) ? POLLIN : 0);
        int pr = poll(pfds, 2, loopback ? 50 : 0);
        if (pr < 0 && errno != EINTR)
            break;

        if (pfds[0].revents & POLLIN) {
            ssize_t n = read(fda, buf, sizeof buf);
            if (n > 0) {
                st.tun_a_rx++;
                if ((int)n > max_read) {
                    st.oversize++;
                } else {
                    qpsk_frame_encode(pkt, buf, (int)n, tx_seq);
                    if (loopback) {
                        uint32_t seq;
                        int m = qpsk_frame_decode(pkt, out, &seq);
                        if (m > 0 && write(fdb, out, (size_t)m) == m)
                            st.tun_b_tx++;
                        st.frames_tx++;
                        st.frames_rx_ok++;
                    } else {
                        if (arq_on)
                            hist_store(tx_seq, pkt);
                        tx_send(pkt);
                    }
                    tx_seq++;
                }
            }
        }

        if (pfds[1].revents & POLLIN) {
            ssize_t n = read(fdb, buf, sizeof buf);
            if (n > 0) {
                st.tun_b_rx++;
                if (loopback) {
                    if ((int)n <= max_read) {
                        qpsk_frame_encode(pkt, buf, (int)n, tx_seq++);
                        uint32_t seq;
                        int m = qpsk_frame_decode(pkt, out, &seq);
                        if (m > 0 && write(fda, out, (size_t)m) == m)
                            st.tun_a_tx++;
                    }
                } else {
                    /* reverse path is routed over veth; RF is one-way here */
                    st.b_side_drops++;
                }
            }
        }

        if (!loopback) {
            unsigned char rpkt[QPSK_PKT_BYTES];
            if (rx_pump(rpkt)) {
                uint32_t seq;
                int m = qpsk_frame_decode(rpkt, out, &seq);
                if (m < 0) {
                    st.crc_drops++;
                } else {
                    st.frames_rx_ok++;
                    rx_tick++;
                    if (arq_on) {
                        if (dedup_seen(seq)) {
                            st.dups++;
                        } else {
                            dedup_mark(seq);
                            if (have_rx && seq < last_rx_seq)
                                st.recovered++; /* a retransmit filled a gap */
                            if (have_rx && seq > last_rx_seq + 1) {
                                st.seq_gaps++;
                                uint32_t miss = seq - last_rx_seq - 1;
                                if (miss > HIST_SZ / 2)
                                    miss = HIST_SZ / 2;
                                for (uint32_t k = 1; k <= miss; k++)
                                    retx_request(seq - k);
                            }
                            if (!have_rx || seq > last_rx_seq)
                                last_rx_seq = seq;
                            have_rx = 1;
                            if (write(fdb, out, (size_t)m) == m)
                                st.tun_b_tx++;
                        }
                    } else {
                        if (have_rx && seq != last_rx_seq + 1)
                            st.seq_gaps++;
                        last_rx_seq = seq;
                        have_rx = 1;
                        if (write(fdb, out, (size_t)m) == m)
                            st.tun_b_tx++;
                    }
                }
            }
            if (arq_on)
                retx_pump();
        }

        if (stats_int > 0 && now_s() - tlast >= stats_int) {
            tlast = now_s();
            stats_dump();
        }
    }
    stats_dump();
    return 0;
}
