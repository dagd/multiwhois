SUBDIRS := $(wildcard impls/*/.)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

clean:
	for dir in $(SUBDIRS); do \
		cd "$$dir"; \
		$(MAKE) clean; \
		cd ../..; \
	done


check: all
	for dir in $(SUBDIRS); do \
		cd "$$dir"; \
		$(MAKE) check || exit 1; \
		cd ../..; \
	done
