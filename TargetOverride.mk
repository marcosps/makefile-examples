# When we include a file that contains the same target name, the recipe from
# the target on the included file will be ignored, and a warning will be shown.
# Both dependencies will be evaluated, in the following order for the 'all'
# target:
# local_dep (this file)
# dep (override.mk)
#
# As you can see it doesn't run the recipe from the 'all' target on override.mk,
# and a warning is triggered. If the target doesn't contain a recipe, no warning
# is shown, but the dependencies are checked in the same order.

include override.mk

all: local_dep
	@echo "TargetOverride.mk: running all target"

local_dep:
	@echo "TargetOverride.mk: running local_dep target"
