name1 := $(lastword $(MAKEFILE_LIST))

include inc.mk

name2 := $(lastword $(MAKEFILE_LIST))
mk_files := $(filter %.mk,$(MAKEFILE_LIST))

MAKEFLAGS += -rR

all:
	@echo Current directory: $(CURDIR)
	@echo Current flags: $(MAKEFLAGS)
	@echo All makefiles parsed: $(MAKEFILE_LIST)
	@echo This dir contains $(words $(mk_files)) files with .mk extension: $(mk_files)
	@echo First parsed makefile was $(name1) and it\'s placed on $(dir $(name1))
	@echo 		fullpath on $(realpath $(dir $(name1)))
	@echo Second parsed makefile was $(name2) and it\'s placed on $(dir $(name2))
	@echo 		fullpath on $(realpath $(dir $(name2)))

.PHONY: all
