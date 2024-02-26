Example of how to use some Make features
----------------------------------------

Use the following make invocations to see different behaviors from variables or
other make features:

```sh
$ make -f IncludeCheck.mk

$ make -f TargetOverride.mk

$ make -f DuplicatedTargets.mk target1

$ make -f TestVarExposure.mk VAR3=ble

$ make

$ make all

$ make test-check

$ make all dummy1 dummy2


# because of the '+' sign, the bla dir will be created
$ make --just-print
```

References for the commands
---------------------------
[call](https://www.gnu.org/software/make/manual/html_node/Call-Function.html)

[Canned Recipes, define](https://www.gnu.org/software/make/manual/html_node/Canned-Recipes.html)

[$(MAKE), '+'](https://www.gnu.org/software/make/manual/make.html#How-the-MAKE-Variable-Works)

['-'](https://www.gnu.org/software/make/manual/make.html#Errors-in-Recipes)

[MAKEFILE_LIST, .DEFAULT_GOAL](https://www.gnu.org/software/make/manual/html_node/Special-Variables.html)

[filter, lastword, patsubst, words](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html)

[include](https://www.gnu.org/software/make/manual/html_node/Include.html)

[echo, --just-print, @](https://www.gnu.org/software/make/manual/make.html#Recipe-Echoing)

[export](https://www.gnu.org/software/make/manual/html_node/Variables_002fRecursion.html#index-variables_002c-exporting)

[MAKECMDGOALS](https://www.gnu.org/software/make/manual/html_node/Goals.html)

[MAKEFLAGS](https://www.gnu.org/software/make/manual/html_node/Options_002fRecursion.html)

[abspath, dir, notdir, realpath](https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html)

[CURDIR](https://www.gnu.org/software/make/manual/make.html#Quick-Reference)

[Automatic variables, $*, $<, $^](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)

[Set variable from command-line](https://www.gnu.org/software/make/manual/html_node/Overriding.html#index-command-line-variables)

[Double-Colon Rules](https://www.gnu.org/software/make/manual/html_node/Double_002dColon.html)

[Substitution References](https://www.gnu.org/software/make/manual/make.html#Substitution-Refs)

[PHONY targets](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html)
