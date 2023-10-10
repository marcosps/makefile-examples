all:
	@echo Current directory: $(CURDIR)
	@echo Current Makefile: $(abspath $(lastword $(MAKEFILE_LIST)))
	@echo MAKEFLAGS are kept from previous Makefile: $(MAKEFLAGS)
	@echo The exported mk_files2 is kept: $(mk_files2), but mk_files is not: \
		$(mk_files)

check:
	@echo Check called

.PHONY: all check
