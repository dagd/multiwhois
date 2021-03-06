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
	rm -fv whois-$(CWD) whois.c

check-default:
	@echo "Full output:"
	./whois-$(CWD) $(CHECK_FLAGS) google.com
	@echo "Re-running to scan for keyword"
	./whois-$(CWD) $(CHECK_FLAGS) google.com | grep -q markmonitor

%: %-default
	@true
