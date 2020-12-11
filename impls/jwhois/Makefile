NV := jwhois-4.0
SOURCE := https://ftp.gnu.org/gnu/jwhois/$(NV).tar.gz
CHECK_FLAGS := -c fedora.conf

include ../def.mk

patch:
	true

build:
	tar -xvf "$(NV).tar.gz"
	cd "$(NV)" && ./configure && $(MAKE)
	curl -o fedora.conf https://src.fedoraproject.org/rpms/jwhois/raw/master/f/jwhois.conf
	mv "$(NV)/src/jwhois" ./whois-jwhois

clean:
	rm -rf "$(NV)" "$(NV).tar.gz" whois-jwhois fedora.conf
