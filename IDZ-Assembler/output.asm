.include "macroslib.asm"
.global output
.text
output:
	push (ra)
	print_str ("Calculated pi = ")
	print_double (fa0)
	pop (ra)
     	ret
      	