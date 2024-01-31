# MAKEFILE_LIST will contain the list of all Makefiles processed. The last entry
# is the current one. The list will contain only the name of the file. To get
# the full path to it you should use abspath function
name1 := $(lastword $(MAKEFILE_LIST))

# This includes the contents of inc.mk Makefile to the current running makefile
include inc.mk

# At this point there will be two entries in MAKEFILE_LIST, since inc.mk was
# included and now is the last entry on it.
name2 := $(lastword $(MAKEFILE_LIST))

# Filter like a grep, where %.mk works like a regex. In this case it returns all
# entries on MAKEFILE_LIST that have the .mk suffix, which will be only inc.mk
mk_files := $(filter %.mk,$(MAKEFILE_LIST))

# Exported variables will be visible in all subsequent make calls. Here
# mk_files2 will contain inc.mk
export mk_files2 := $(mk_files)

# MAKEFLAGS will contain all flags passed by the make invocation. If the user
# passed -s, MAKEFLAGS will contain rRs
MAKEFLAGS += -rR

all:
	@# One can pass more than one target to be executed.
	@echo Goals: $(MAKECMDGOALS)
	@
	@# The default goal can be set to any of the available targets
	@echo Default Goal: $(.DEFAULT_GOAL)
	@
	@# CURDIR is set when a Makefile is processed.
	@echo Current directory: $(CURDIR)
	@
	@# dir function works like dirname shell, removed the last component from
	@# a path
	@echo Parent dir: $(dir $(CURDIR))
	@
	@echo Current basename: $(notdir $(CURDIR))
	@
	@# patsubst works like "replace" it expects a pattern to search for, what
	@# it will do when it finds, and where to search for it. '%' is the
	@# wildcard, so in the example below it will search for the ending slash,
	@# and remove it, from the current directory.
	@echo Parent dir without the backslash: $(patsubst %/,%,$(dir $(CURDIR)))
	@
	@# abspath returns the absolute path of a file, which in this case will
	@# show the full path for this very Makefile
	@echo Current Makefile: $(abspath $(name1))
	@
	@echo Current flags: $(MAKEFLAGS)
	@echo All makefiles parsed: $(MAKEFILE_LIST)
	@
	@# words returns the number of "words" in the variable, so in this case
	@# it will show 2, since we processed two Makefiles
	@echo This dir contains $(words $(mk_files)) files with .mk extension: $(mk_files)
	@
	@# realpath behaves the same as the realpath command, it returns the
	@# abspath, but following symlinks
	@echo First parsed makefile was $(name1) and it\'s placed on $(dir $(name1)), \
		fullpath on $(realpath $(dir $(name1)))
	@echo Second parsed makefile was $(name2) and it\'s placed on $(dir $(name2)), \
		fullpath on $(realpath $(dir $(name2)))
	@
	@# This make invocation will go inside the directory dir, and execute the
	@# Makefile inside there. We need the additional @echo to insert a blank line
	@echo
	@echo Now lets jump into dir and run make there
	make -C dir
	@echo
	@echo Shell commands are executed before parsing a Makefile:
	make -C dir var_from_shell FROM_SHELL=$(shell pwd)
	@echo
	@echo Now use -f to execute make on Helpers file:
	$(MAKE) -f Helpers
	@echo
	@echo Show now how to use variables from command line:
	$(MAKE) -f Helpers print_val
	$(MAKE) -f Helpers other_val VAR1=from_command_line


dep1:
	@echo Calling $@

# The name after the target name is the dependency target, and in this case it
# will be called before target1 is called.
target1: dep1
	@echo The target $@ was called after the dependency $<
	@echo $$^ shows all prerequisites

# Try calling "make test-check", so it will reach the check target no
# dir/Makefile dir
test-%:
	make -C dir $*

# Only dummy targets to be shown when printings MAKECMDGOALS
dummy1:
	@echo called dummy1

# @: tells make to do ignore the output of next command, and : in this case is
# the bash command set to do nothing, so this target does nothing.
dummy2:
	@:

.PHONY: all test dummy1 dummy2 dep1 target1
