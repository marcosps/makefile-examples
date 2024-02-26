# One way to check if a directory exists is to list the contents of it.
# In this case, usually the /lib/modules/<kernel version>/build exists only if
# kernel-devel package was installed, so test it if listing the directory shows
# something
all:
ifeq ("$(wildcard /lib/modules/$(shell uname -r)/build)", "")
	@echo It seems that kernel-devel is not installed
else
	@echo It seems that kernel-devel is installed
endif
