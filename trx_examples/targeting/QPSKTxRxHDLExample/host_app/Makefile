CC      ?= gcc
CFLAGS  ?= -O2 -Wall -Wextra -Werror

# Board profile: default ZynqMP (Jupiter / ADRV9002-ZCU102 byte bitstream).
# For the ZedBoard (Zynq-7000) byte design:   make BOARD=zed
BOARD   ?= zynqmp
ifeq ($(BOARD),zed)
CFLAGS  += -DQPSK_BOARD_ZED
endif

all: qpsk_tun qpsk_capture

qpsk_frame.o: qpsk_frame.c qpsk_frame.h
	$(CC) $(CFLAGS) -c qpsk_frame.c

qpsk_tun: qpsk_tun.c qpsk_frame.o qpsk_hw.h
	$(CC) $(CFLAGS) -o qpsk_tun qpsk_tun.c qpsk_frame.o

qpsk_capture: qpsk_capture.c qpsk_hw.h
	$(CC) $(CFLAGS) -o qpsk_capture qpsk_capture.c

test_frame: test_frame.c qpsk_frame.o
	$(CC) $(CFLAGS) -o test_frame test_frame.c qpsk_frame.o

test: test_frame
	./test_frame

clean:
	rm -f *.o qpsk_tun qpsk_capture test_frame
