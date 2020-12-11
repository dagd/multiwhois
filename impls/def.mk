CWD = $(notdir $(shell pwd))
CC := clang -Wall

# These can/should be set as needed:
# $SOURCE (url of the source artifact to download)
# $CHECK_FLAGS (flags to pass to the client when testing it)

all: fetch patch build

.PHONY: all

fetch-default:
	curl -LO "$(SOURCE)"

patch-default:
	patch --no-backup-if-mismatch < client.patch

build-default:
	$(CC) whois.c -o whois-$(CWD)

clean-default:
	rm -v whois-$(CWD) whois.c

check-default:
	./whois-$(CWD) $(CHECK_FLAGS) google.com 2>&1 | grep -q markmonitor

%: %-default
	@true
