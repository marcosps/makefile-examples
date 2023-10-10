name1 := $(lastword $(MAKEFILE_LIST))

include inc.mk

name2 := $(lastword $(MAKEFILE_LIST))
mk_files := $(filter %.mk,$(MAKEFILE_LIST))
export mk_files2 := $(mk_files)

MAKEFLAGS += -rR

all:
	@echo Current directory: $(CURDIR)
	@echo Current Makefile: $(abspath $(name1))
	@echo Current flags: $(MAKEFLAGS)
	@echo All makefiles parsed: $(MAKEFILE_LIST)
	@echo This dir contains $(words $(mk_files)) files with .mk extension: $(mk_files)
	@echo First parsed makefile was $(name1) and it\'s placed on $(dir $(name1)), \
		fullpath on $(realpath $(dir $(name1)))
	@echo Second parsed makefile was $(name2) and it\'s placed on $(dir $(name2)), \
		fullpath on $(realpath $(dir $(name2)))
	@echo Now lets jump into dir and run make there
	@echo
	make -C dir

# Try calling "make test-check", so it will reach the check target no
# dir/Makefile dir
test-%:
	make -C dir $*

.PHONY: all
