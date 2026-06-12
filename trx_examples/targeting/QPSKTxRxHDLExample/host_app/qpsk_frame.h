/* qpsk_frame -- framing for one network frame per QPSK packet payload.
 *
 * Layout (little-endian multi-byte fields):
 *   [0..1]  magic 0x51 0x4B ("QK")
 *   [2..3]  payload length in bytes (1..QPSK_FRAME_MAX_PAYLOAD)
 *   [4..7]  sequence number
 *   [8..11] CRC32 (zlib polynomial) over the whole used frame with the
 *           CRC field zeroed -- detects the modem's episodic packet
 *           corruption so bad frames are dropped, not delivered
 *   [12..]  payload, zero-padded to QPSK_PKT_BYTES
 */
#ifndef QPSK_FRAME_H
#define QPSK_FRAME_H

#include <stdint.h>
#include <stddef.h>

#define QPSK_PKT_BYTES         280
#define QPSK_FRAME_HDR_BYTES   12
#define QPSK_FRAME_MAX_PAYLOAD (QPSK_PKT_BYTES - QPSK_FRAME_HDR_BYTES)

/* fills pkt[QPSK_PKT_BYTES]; returns QPSK_PKT_BYTES or -1 on bad length */
int qpsk_frame_encode(unsigned char *pkt, const unsigned char *payload,
                      int len, uint32_t seq);

/* validates magic/length/CRC; copies payload to out (must hold
 * QPSK_FRAME_MAX_PAYLOAD); returns payload length or -1 if invalid */
int qpsk_frame_decode(const unsigned char *pkt, unsigned char *out,
                      uint32_t *seq);

uint32_t qpsk_crc32(const unsigned char *buf, size_t len);

#endif
