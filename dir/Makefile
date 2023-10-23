# Use of Substution references, where DOCS will contain "f1.doc f2.doc"
# This is a shortcut for using pathsubst
TXTS := f1.txt f2.txt
DOCS := $(TXTS:.txt=.doc)

all:
	@echo Current directory: $(CURDIR)
	@echo Current Makefile: $(abspath $(lastword $(MAKEFILE_LIST)))
	@echo MAKEFLAGS are kept from previous Makefile: $(MAKEFLAGS)
	@echo The exported mk_files2 is kept: $(mk_files2), but mk_files is not: \
		$(mk_files)
	@
	@echo Substution reference can be used to change the suffix of files, like \
		$(TXTS) for $(DOCS)

check:
	@echo Triggered check target inside dir

.PHONY: all check
