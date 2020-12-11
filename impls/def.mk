CWD = $(notdir $(shell pwd))
CC := clang -Wall

all: fetch patch build

.PHONY: all

fetch-default:
	curl -Lo whois.c "$(shell cat client.url)"

patch-default:
	patch --no-backup-if-mismatch < client.patch

build-default:
	$(CC) whois.c -o whois-$(CWD)

clean-default:
	rm -v whois-$(CWD) whois.c

check-default:
	./whois-$(CWD) google.com 2>&1 | grep -q markmonitor

%: %-default
	@true
