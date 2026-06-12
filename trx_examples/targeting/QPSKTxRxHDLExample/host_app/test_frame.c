/* test_frame.c -- contract tests for the QPSK packet framing library,
 * exercised at both deployed packet sizes (280 B / 2240-bit build and
 * 560 B / 4480-bit build). Build/run on the dev host: make test */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "qpsk_frame.h"

static int tests = 0, fails = 0;
#define CHECK(cond, msg) do { tests++; if (!(cond)) { fails++; \
    fprintf(stderr, "FAIL %s:%d %s\n", __FILE__, __LINE__, msg); } } while (0)

static void run_suite(int pkt_bytes)
{
    unsigned char pkt[QPSK_PKT_BYTES_MAX];
    unsigned char out[QPSK_PKT_BYTES_MAX];
    unsigned char payload[QPSK_PKT_BYTES_MAX];
    uint32_t seq;
    int maxp = QPSK_FRAME_MAX_PAYLOAD(pkt_bytes);
    int n, i, b;

    for (i = 0; i < maxp; i++) payload[i] = (unsigned char)(i * 7 + 3);
    int sizes[] = {1, 2, 64, 100, maxp - 1, maxp};
    for (i = 0; i < 6; i++) {
        n = qpsk_frame_encode(pkt, pkt_bytes, payload, sizes[i], 0xC0FFEE00u + (uint32_t)i);
        CHECK(n == pkt_bytes, "encode fills one packet");
        n = qpsk_frame_decode(pkt, pkt_bytes, out, &seq);
        CHECK(n == sizes[i], "decode length");
        CHECK(seq == 0xC0FFEE00u + (uint32_t)i, "decode seq");
        CHECK(memcmp(out, payload, (size_t)sizes[i]) == 0, "decode payload");
    }

    /* oversize and zero rejected at encode */
    CHECK(qpsk_frame_encode(pkt, pkt_bytes, payload, maxp + 1, 1) < 0, "oversize");
    CHECK(qpsk_frame_encode(pkt, pkt_bytes, payload, 0, 1) < 0, "zero len");

    /* corruption: flipping ANY single bit of the used region must be caught */
    n = qpsk_frame_encode(pkt, pkt_bytes, payload, maxp - 68, 42);
    int used = QPSK_FRAME_HDR_BYTES + maxp - 68;
    int caught = 1;
    for (b = 0; b < used * 8; b++) {
        pkt[b / 8] ^= (unsigned char)(1u << (b % 8));
        if (qpsk_frame_decode(pkt, pkt_bytes, out, &seq) >= 0) caught = 0;
        pkt[b / 8] ^= (unsigned char)(1u << (b % 8));
    }
    CHECK(caught, "every single-bit corruption rejected");

    /* garbage and all-zeros packets rejected */
    memset(pkt, 0x5A, sizeof pkt);
    CHECK(qpsk_frame_decode(pkt, pkt_bytes, out, &seq) < 0, "garbage rejected");
    memset(pkt, 0, sizeof pkt);
    CHECK(qpsk_frame_decode(pkt, pkt_bytes, out, &seq) < 0, "zeros rejected");

    printf("frame tests @%dB: done\n", pkt_bytes);
}

int main(void)
{
    CHECK(QPSK_FRAME_HDR_BYTES == 12, "header size");
    CHECK(QPSK_FRAME_MAX_PAYLOAD(280) == 268, "280B max payload");
    CHECK(QPSK_FRAME_MAX_PAYLOAD(560) == 548, "560B max payload");
    run_suite(280);
    run_suite(560);
    printf("frame tests: %d run, %d failed\n", tests, fails);
    return fails ? 1 : 0;
}
