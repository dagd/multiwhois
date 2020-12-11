CWD = $(notdir $(shell pwd))
CC := clang -Wall

all: fetch patch build

.PHONY: all

fetch:
	curl -Lo whois.c "$(shell cat client.url)"

patch:
	patch --no-backup-if-mismatch < client.patch

build:
	$(CC) whois.c -o whois-$(CWD)

clean:
	rm -v whois-$(CWD) whois.c
