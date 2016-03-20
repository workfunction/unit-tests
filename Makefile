EXEC = bin-swap bin-bubble
.PHONY: all
all: $(EXEC)

CC ?= gcc
CFLAGS = -std=gnu99 -Wall -O2 -g
LDFLAGS =

OBJS := \
	swap.o \
	bubble.o \
	stub.o

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

bin-%: %.o stub.o
	$(CC) -o $@ $^ $(LDFLAGS)

check: $(EXEC)
	bash test-swap.sh data-swap.in result-swap
	bash test-bubble.sh data-bubble.in result-bubble

check_swap: bin-swap
	bash test-swap.sh data-swap.in result-swap

check_bubble: bin-bubble
	bash test-bubble.sh data-bubble.in result-bubble

clean:
	$(RM) $(EXEC) $(OBJS)
