SUBDIRS := $(wildcard impls/*/.)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

clean:
	for dir in $(SUBDIRS); do \
		cd "$$dir"; \
		$(MAKE) clean; \
	done


check: all
	for dir in $(SUBDIRS); do \
		cd "$$dir"; \
		$(MAKE) check || exit 1; \
	done
