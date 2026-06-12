/* test_frame.c -- contract tests for the QPSK packet framing library.
 * Written FIRST (TDD): defines the frame layout and the properties the
 * implementation must satisfy. Build/run on the dev host: make test
 *
 * Frame layout inside one QPSK packet payload (QPSK_PKT_BYTES = 280):
 *   magic(2) = 0xQ5,0x4B | len(2, LE, payload bytes) | seq(4, LE) |
 *   crc32(4, LE, over header-with-crc-zeroed + payload) | payload | pad-0
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "qpsk_frame.h"

static int tests = 0, fails = 0;
#define CHECK(cond, msg) do { tests++; if (!(cond)) { fails++; \
    fprintf(stderr, "FAIL %s:%d %s\n", __FILE__, __LINE__, msg); } } while (0)

int main(void)
{
    unsigned char pkt[QPSK_PKT_BYTES];
    unsigned char out[QPSK_FRAME_MAX_PAYLOAD];
    unsigned char payload[QPSK_FRAME_MAX_PAYLOAD];
    uint32_t seq;
    int n, i, b;

    /* sizes */
    CHECK(QPSK_PKT_BYTES == 280, "packet size");
    CHECK(QPSK_FRAME_HDR_BYTES == 12, "header size");
    CHECK(QPSK_FRAME_MAX_PAYLOAD == 268, "max payload");

    /* roundtrip at several sizes incl. min/max */
    for (i = 0; i < QPSK_FRAME_MAX_PAYLOAD; i++) payload[i] = (unsigned char)(i * 7 + 3);
    int sizes[] = {1, 2, 64, 100, 267, 268};
    for (i = 0; i < 6; i++) {
        n = qpsk_frame_encode(pkt, payload, sizes[i], 0xC0FFEE00u + i);
        CHECK(n == QPSK_PKT_BYTES, "encode fills one packet");
        n = qpsk_frame_decode(pkt, out, &seq);
        CHECK(n == sizes[i], "decode length");
        CHECK(seq == 0xC0FFEE00u + i, "decode seq");
        CHECK(memcmp(out, payload, sizes[i]) == 0, "decode payload");
    }

    /* oversize and zero rejected at encode */
    CHECK(qpsk_frame_encode(pkt, payload, QPSK_FRAME_MAX_PAYLOAD + 1, 1) < 0, "oversize");
    CHECK(qpsk_frame_encode(pkt, payload, 0, 1) < 0, "zero len");

    /* corruption: flipping ANY single bit of the used region must be caught */
    n = qpsk_frame_encode(pkt, payload, 200, 42);
    int used = QPSK_FRAME_HDR_BYTES + 200;
    int caught = 1;
    for (b = 0; b < used * 8; b++) {
        pkt[b / 8] ^= (unsigned char)(1u << (b % 8));
        if (qpsk_frame_decode(pkt, out, &seq) >= 0) caught = 0;
        pkt[b / 8] ^= (unsigned char)(1u << (b % 8));
    }
    CHECK(caught, "every single-bit corruption rejected");

    /* garbage packet (all 0x5A) rejected */
    memset(pkt, 0x5A, sizeof pkt);
    CHECK(qpsk_frame_decode(pkt, out, &seq) < 0, "garbage rejected");

    /* all-zeros packet (modem underflow output) rejected */
    memset(pkt, 0, sizeof pkt);
    CHECK(qpsk_frame_decode(pkt, out, &seq) < 0, "zeros rejected");

    printf("frame tests: %d run, %d failed\n", tests, fails);
    return fails ? 1 : 0;
}
