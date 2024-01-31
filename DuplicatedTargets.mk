# It can be useful to create targets that repeat on the Makefile. This can be
# handy when one of the targets depend on a setup step, so both recipes will be
# executed.  When such usage is required, all the targets that have the same name
# need to be specified used double colon (::), otherwise make returns one error.
target1::
	@echo first target, called by $@
target1 target2::
	@echo second target, called by $@

.PHONY: target1 target2
