/* qpsk_hw.h -- board-specific physical addresses for the QPSK byte-DMA path.
 *
 * Defaults target the ZynqMP byte bitstream (Jupiter / ADRV9002-ZCU102): the
 * modem regfile + byte DMAs live in the 0x9D000000 master-interconnect space,
 * and the DMA ring buffers are carved from a reserved region near the top of
 * the 2 GB DDR map.
 *
 * Build for a different board at compile time:
 *   ZedBoard (Zynq-7000, xc7z020):   make CFLAGS+=-DQPSK_BOARD_ZED
 *     -> regs move to the Zynq-7000 GP0 window (0x40000000-0x7FFFFFFF) at
 *        0x43C..., and the DMA buffer carve moves into ZedBoard's 512 MB DDR
 *        (0x00000000-0x1FFFFFFF). These match the adrv9002/zed byte reference
 *        design (get_memory_axi_interface_info + matlab_processors.tcl zed case).
 *   Any single symbol can also be overridden directly, e.g.
 *     make CFLAGS+='-DQPSK_MODEM_BASE=0x60000000u'
 *
 * NOTE: the DMA buffer region must be reserved from Linux on the target (a
 * device-tree reserved-memory node at QPSK_DMA_BUF_BASE); this header only
 * fixes the address the userspace daemon mmaps.
 */
#ifndef QPSK_HW_H
#define QPSK_HW_H

#ifdef QPSK_BOARD_ZED
/* --- ZedBoard / Zynq-7000 (xc7z020) --- */
#  ifndef QPSK_MODEM_BASE
#    define QPSK_MODEM_BASE   0x43C00000u
#  endif
#  ifndef QPSK_TX_DMA_BASE
#    define QPSK_TX_DMA_BASE  0x43C10000u
#  endif
#  ifndef QPSK_RX_DMA_BASE
#    define QPSK_RX_DMA_BASE  0x43C20000u
#  endif
#  ifndef QPSK_GPIO_BASE
#    define QPSK_GPIO_BASE    0x43C30000u
#  endif
#  ifndef QPSK_DMA_BUF_BASE
#    define QPSK_DMA_BUF_BASE 0x1FF00000u   /* top 1 MB of ZedBoard 512 MB DDR */
#  endif
#else
/* --- ZynqMP default (Jupiter / ADRV9002-ZCU102) --- */
#  ifndef QPSK_MODEM_BASE
#    define QPSK_MODEM_BASE   0x9D000000u
#  endif
#  ifndef QPSK_TX_DMA_BASE
#    define QPSK_TX_DMA_BASE  0x9D100000u
#  endif
#  ifndef QPSK_RX_DMA_BASE
#    define QPSK_RX_DMA_BASE  0x9D200000u
#  endif
#  ifndef QPSK_GPIO_BASE
#    define QPSK_GPIO_BASE    0x9D300000u
#  endif
#  ifndef QPSK_DMA_BUF_BASE
#    define QPSK_DMA_BUF_BASE 0x7FF00000u   /* reserved carve near top of 2 GB */
#  endif
#endif

/* DMA ring sub-regions, derived from the buffer base. The Tx ring sits at the
 * base; the Rx ring offset differs per tool (kept as it was historically:
 * qpsk_capture uses +0x80000, qpsk_tun uses +0x40000). */
#ifndef QPSK_TX_BUF_PHYS
#  define QPSK_TX_BUF_PHYS         (QPSK_DMA_BUF_BASE + 0x00000u)
#endif
#ifndef QPSK_CAPTURE_RX_BUF_PHYS
#  define QPSK_CAPTURE_RX_BUF_PHYS (QPSK_DMA_BUF_BASE + 0x80000u)
#endif
#ifndef QPSK_TUN_RX_BUF_PHYS
#  define QPSK_TUN_RX_BUF_PHYS     (QPSK_DMA_BUF_BASE + 0x40000u)
#endif

#endif /* QPSK_HW_H */
