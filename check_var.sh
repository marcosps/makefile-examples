#!/bin/bash
echo "VAR1 is empty ('$VAR1') because it was local to the Makefile"
echo "VAR2 is has a value ('$VAR2') because the makefile exported it"

if [ -z "$VAR3" ]; then
	echo "VAR3 is empty. Please inform it as a make variable to see its value"
else
	echo "VAR3 has a value ('$VAR3'). It was passed through make invocation variable"
fi
