SUBDIRS := $(wildcard impls/*/.)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

clean:
	for dir in $(SUBDIRS); do \
		pushd "$$dir"; \
		$(MAKE) clean; \
		popd; \
	done


check: all
	for dir in $(SUBDIRS); do \
		pushd "$$dir"; \
		$(MAKE) check || exit 1; \
		popd; \
	done
