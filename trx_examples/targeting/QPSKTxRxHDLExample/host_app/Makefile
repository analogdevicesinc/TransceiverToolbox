CC      ?= gcc
CFLAGS  ?= -O2 -Wall -Wextra -Werror

all: qpsk_tun

qpsk_frame.o: qpsk_frame.c qpsk_frame.h
	$(CC) $(CFLAGS) -c qpsk_frame.c

qpsk_tun: qpsk_tun.c qpsk_frame.o
	$(CC) $(CFLAGS) -o qpsk_tun qpsk_tun.c qpsk_frame.o

test_frame: test_frame.c qpsk_frame.o
	$(CC) $(CFLAGS) -o test_frame test_frame.c qpsk_frame.o

test: test_frame
	./test_frame

clean:
	rm -f *.o qpsk_tun test_frame
