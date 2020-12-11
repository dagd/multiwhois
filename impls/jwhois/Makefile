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

# The default .com server for jwhois seems to block CI (Azure), so we test with
# a different TLD
check:
	@echo "Full output:"
	./whois-$(CWD) $(CHECK_FLAGS) getfedora.org
	@echo "Re-running to scan for keyword"
	./whois-$(CWD) $(CHECK_FLAGS) getfedora.org | grep -qi fedoraproject
