/* qpsk_frame -- framing for one network frame per QPSK packet payload.
 *
 * Layout (little-endian multi-byte fields):
 *   [0..1]  magic 0x51 0x4B ("QK")
 *   [2..3]  payload length in bytes (1..pkt_bytes-12)
 *   [4..7]  sequence number
 *   [8..11] CRC32 (zlib polynomial) over the whole used frame with the
 *           CRC field zeroed -- detects the modem's episodic packet
 *           corruption so bad frames are dropped, not delivered
 *   [12..]  payload, zero-padded to pkt_bytes
 *
 * pkt_bytes is the QPSK packet payload size: DataBitsPerPacket/8 of the
 * deployed bitstream (280 for the default 2240-bit build, 560 for 4480).
 */
#ifndef QPSK_FRAME_H
#define QPSK_FRAME_H

#include <stdint.h>
#include <stddef.h>

#define QPSK_PKT_BYTES_DEFAULT 280
#define QPSK_PKT_BYTES_MAX     1024
#define QPSK_FRAME_HDR_BYTES   12
#define QPSK_FRAME_MAX_PAYLOAD(pkt_bytes) ((pkt_bytes) - QPSK_FRAME_HDR_BYTES)

/* fills pkt[pkt_bytes]; returns pkt_bytes or -1 on bad length */
int qpsk_frame_encode(unsigned char *pkt, int pkt_bytes,
                      const unsigned char *payload, int len, uint32_t seq);

/* validates magic/length/CRC; copies payload to out (must hold
 * QPSK_FRAME_MAX_PAYLOAD(pkt_bytes)); returns payload length or -1 */
int qpsk_frame_decode(const unsigned char *pkt, int pkt_bytes,
                      unsigned char *out, uint32_t *seq);

uint32_t qpsk_crc32(const unsigned char *buf, size_t len);

#endif
