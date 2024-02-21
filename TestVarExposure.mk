VAR1 := 1
export VAR2 := 2

# If MY_VAR is passed when make is invoked, the script below will print
# it's value
#
all:
	./check_var.sh
