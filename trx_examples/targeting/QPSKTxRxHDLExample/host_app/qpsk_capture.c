/* qpsk_capture -- diagnostic: send one fixed payload cyclically over the
 * INTERNAL loopback (in-FPGA Tx -> MUX -> Rx) and capture N consecutive
 * recovered packets byte-exact via the rx byte DMA (TLAST gated off so one
 * transfer spans N packets). Dumps the raw N*pkt bytes to a file for
 * offline slip-structure analysis. Internal loopback needs no ADRV9002 RF.
 *
 *   qpsk_capture <N> <pkt_bytes> <out.bin> [seed]
 *
 * The Tx payload is a fixed pseudo-random pattern (seeded) written once and
 * sent cyclically, so every transmitted packet is identical -- a per-byte
 * majority vote across the N captures reconstructs the "correct" packet,
 * and each packet's first deviation marks its slip point. */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/mman.h>

#include "qpsk_hw.h"     /* board-configurable base addresses (-DQPSK_BOARD_ZED) */
#define MODEM_BASE QPSK_MODEM_BASE
#define TX_DMA     QPSK_TX_DMA_BASE
#define RX_DMA     QPSK_RX_DMA_BASE
#define GPIO_BASE  QPSK_GPIO_BASE
#define TX_BUF     QPSK_TX_BUF_PHYS
#define RX_BUF     QPSK_CAPTURE_RX_BUF_PHYS

/* modem regfile offsets */
#define R_SOFTRST  0x000
#define R_RXSEL    0x114
#define R_TXSEL    0x118
#define R_TXSRC    0x11C
/* axi_dmac offsets */
#define D_IRQMASK  0x080
#define D_CONTROL  0x400
#define D_SUBMIT   0x408
#define D_FLAGS    0x40C
#define D_DEST     0x410
#define D_SRC      0x414
#define D_XLEN     0x418
#define D_DONE     0x428

static volatile uint32_t *map32(int fd, uint32_t phys)
{
    void *p = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE, MAP_SHARED, fd, (off_t)phys);
    if (p == MAP_FAILED) { fprintf(stderr, "mmap %08x: %s\n", phys, strerror(errno)); exit(1); }
    return (volatile uint32_t *)p;
}
static void *mapbuf(int fd, uint32_t phys, size_t len)
{
    void *p = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, (off_t)phys);
    if (p == MAP_FAILED) { fprintf(stderr, "mmap buf %08x: %s\n", phys, strerror(errno)); exit(1); }
    return p;
}
#define WR(base,off,val) ((base)[(off)/4] = (val))
#define RD(base,off)     ((base)[(off)/4])

int main(int argc, char **argv)
{
    if (argc < 4) { fprintf(stderr, "usage: %s N pkt_bytes out.bin [seed]\n", argv[0]); return 2; }
    int N = atoi(argv[1]);
    int pkt = atoi(argv[2]);
    const char *out = argv[3];
    unsigned seed = argc > 4 ? (unsigned)atoi(argv[4]) : 1;
    int rxsel = argc > 5 ? atoi(argv[5]) : 0;  /* 0=internal, 1=cable (needs RF) */
    size_t total = (size_t)N * (size_t)pkt;

    int fd = open("/dev/mem", O_RDWR|O_SYNC);
    if (fd < 0) { perror("/dev/mem"); return 1; }
    volatile uint32_t *modem = map32(fd, MODEM_BASE);
    volatile uint32_t *txd = map32(fd, TX_DMA);
    volatile uint32_t *rxd = map32(fd, RX_DMA);
    volatile uint32_t *gpio = map32(fd, GPIO_BASE);
    unsigned char *txbuf = mapbuf(fd, TX_BUF, 4096);
    unsigned char *rxbuf = mapbuf(fd, RX_BUF, (total + 0xFFF) & ~0xFFFu);

    /* fixed pseudo-random payload, byte-0-first (little-endian word pack:
     * byte k of the packet sits at txbuf[k]) */
    srand(seed);
    for (int i = 0; i < pkt; i++) txbuf[i] = (unsigned char)(rand() & 0xFF);

    /* internal loopback, DMA-byte Tx source (e2e order: soft reset clears
     * the regfile, THEN write the selects) */
    WR(modem, R_SOFTRST, 1); usleep(100000);
    WR(modem, R_TXSRC, 1);    /* tx_data_source = DMA bytes */
    WR(modem, R_TXSEL, 0);    /* tx_source_select = in-FPGA Tx -> DAC */
    WR(modem, R_RXSEL, (uint32_t)rxsel);  /* 0=internal loopback, 1=ADC/cable */

    /* start cyclic Tx of one packet (FLAGS=3 CYCLIC|TLAST) */
    WR(txd, D_CONTROL, 0); usleep(100000);
    WR(txd, D_CONTROL, 1);
    WR(txd, D_IRQMASK, 3);
    WR(txd, D_FLAGS, 3);
    WR(txd, D_SRC, TX_BUF);
    WR(txd, D_XLEN, (uint32_t)pkt - 1);
    WR(txd, D_SUBMIT, 1);
    usleep(300000);           /* let the link settle */

    /* multi-packet Rx capture: TLAST off, one transfer of N*pkt bytes */
    gpio[0] = 0;
    memset(rxbuf, 0, total);
    WR(rxd, D_CONTROL, 0); usleep(1000);
    WR(rxd, D_CONTROL, 1);
    WR(rxd, D_IRQMASK, 3);
    WR(rxd, D_DEST, RX_BUF);
    WR(rxd, D_XLEN, (uint32_t)total - 1);
    WR(rxd, D_FLAGS, 0);
    WR(rxd, D_SUBMIT, 1);

    int spins = 0;
    while (!(RD(rxd, D_DONE) & 1)) {
        if (++spins > 100000) { fprintf(stderr, "capture timeout\n"); break; }
        usleep(100);
    }

    FILE *f = fopen(out, "wb");
    if (!f) { perror(out); return 1; }
    fwrite(rxbuf, 1, total, f);
    fclose(f);
    gpio[0] = 1;              /* restore legacy TLAST */
    fprintf(stderr, "captured %d packets x %d bytes -> %s (done=%d, spins=%d)\n",
            N, pkt, out, RD(rxd, D_DONE) & 1, spins);
    return 0;
}
