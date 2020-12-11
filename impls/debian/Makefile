include ../def.mk

fetch:
	git clone git://github.com/rfc1036/whois

patch:
	true

build:
	cd whois && $(MAKE) whois
	mv whois/whois ./whois-debian

clean:
	rm -rf whois whois-debian
