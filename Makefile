PORT ?= 4242
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -DPORT=$(PORT)

all: server client

server: server.o net.o game.o
	$(CC) $(CFLAGS) -o $@ $^

client: client.o net.o
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c net.h game.h
	$(CC) $(CFLAGS) -c $<

test_game: test_game.o game.o
	$(CC) $(CFLAGS) -o $@ $^

test: test_game
	./test_game

clean:
	rm -f *.o server client test_game

.PHONY: all clean test
