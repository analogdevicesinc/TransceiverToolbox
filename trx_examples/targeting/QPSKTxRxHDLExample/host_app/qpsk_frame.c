#include "qpsk_frame.h"
#include <string.h>

uint32_t qpsk_crc32(const unsigned char *buf, size_t len)
{
    static uint32_t table[256];
    static int have_table = 0;
    uint32_t crc;
    size_t i;
    int j;

    if (!have_table) {
        for (i = 0; i < 256; i++) {
            crc = (uint32_t)i;
            for (j = 0; j < 8; j++)
                crc = (crc >> 1) ^ ((crc & 1) ? 0xEDB88320u : 0);
            table[i] = crc;
        }
        have_table = 1;
    }
    crc = 0xFFFFFFFFu;
    for (i = 0; i < len; i++)
        crc = (crc >> 8) ^ table[(crc ^ buf[i]) & 0xFF];
    return crc ^ 0xFFFFFFFFu;
}

int qpsk_frame_encode(unsigned char *pkt, int pkt_bytes,
                      const unsigned char *payload, int len, uint32_t seq)
{
    uint32_t crc;

    if (pkt_bytes < QPSK_FRAME_HDR_BYTES + 1 || pkt_bytes > QPSK_PKT_BYTES_MAX)
        return -1;
    if (len < 1 || len > QPSK_FRAME_MAX_PAYLOAD(pkt_bytes))
        return -1;
    pkt[0] = 0x51; pkt[1] = 0x4B;
    pkt[2] = (unsigned char)(len & 0xFF);
    pkt[3] = (unsigned char)((len >> 8) & 0xFF);
    pkt[4] = (unsigned char)(seq & 0xFF);
    pkt[5] = (unsigned char)((seq >> 8) & 0xFF);
    pkt[6] = (unsigned char)((seq >> 16) & 0xFF);
    pkt[7] = (unsigned char)((seq >> 24) & 0xFF);
    memset(pkt + 8, 0, 4);
    memcpy(pkt + QPSK_FRAME_HDR_BYTES, payload, (size_t)len);
    memset(pkt + QPSK_FRAME_HDR_BYTES + len, 0,
           (size_t)(pkt_bytes - QPSK_FRAME_HDR_BYTES - len));
    crc = qpsk_crc32(pkt, (size_t)(QPSK_FRAME_HDR_BYTES + len));
    pkt[8]  = (unsigned char)(crc & 0xFF);
    pkt[9]  = (unsigned char)((crc >> 8) & 0xFF);
    pkt[10] = (unsigned char)((crc >> 16) & 0xFF);
    pkt[11] = (unsigned char)((crc >> 24) & 0xFF);
    return pkt_bytes;
}

int qpsk_frame_decode(const unsigned char *pkt, int pkt_bytes,
                      unsigned char *out, uint32_t *seq)
{
    unsigned char tmp[QPSK_PKT_BYTES_MAX];
    uint32_t crc_rx, crc;
    int len;

    if (pkt[0] != 0x51 || pkt[1] != 0x4B)
        return -1;
    len = (int)pkt[2] | ((int)pkt[3] << 8);
    if (len < 1 || len > QPSK_FRAME_MAX_PAYLOAD(pkt_bytes))
        return -1;
    crc_rx = (uint32_t)pkt[8] | ((uint32_t)pkt[9] << 8) |
             ((uint32_t)pkt[10] << 16) | ((uint32_t)pkt[11] << 24);
    memcpy(tmp, pkt, (size_t)(QPSK_FRAME_HDR_BYTES + len));
    memset(tmp + 8, 0, 4);
    crc = qpsk_crc32(tmp, (size_t)(QPSK_FRAME_HDR_BYTES + len));
    if (crc != crc_rx)
        return -1;
    if (seq)
        *seq = (uint32_t)pkt[4] | ((uint32_t)pkt[5] << 8) |
               ((uint32_t)pkt[6] << 16) | ((uint32_t)pkt[7] << 24);
    memcpy(out, pkt + QPSK_FRAME_HDR_BYTES, (size_t)len);
    return len;
}
