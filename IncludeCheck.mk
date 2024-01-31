# When the file to be included doesn't start with a /, it expects the file to be
# in the same directory of the interpreted Makefile being executed.
#
# This can be a problem is the make is invoked with -C to a directory, and runs
# the Makefile in the other directory, like:
#
# $ make -C /tmp -f ./IncludeCheck.mk
#
# This invocation will fails, because it will try to find the file on
# /tmp/IncludeCheck.mk, which doesn't exists.
include inc.mk

# Empty target, does nothing and prints nothing.
all:
	@:
