.include "macroslib.asm"
.global input
.text
input:
	push (ra)
	li	t1 2
        li	t2 100000
	input_num:	# input number of terms in series
		# You have to use at least 2 terms because otherwise the accuracy of pi will be below 0.05
		print_str ("Choose a number of terms in Nilakantha series from 2 to 100000: ")
	        read_int (t0)	# t0 - term number
		blt	t0 t1 input_num	# term number < 2 => repeat input_num
		bgt	t0 t2 input_num	# term number > 100000 => repeat input_num
        mv	a0 t0	# a0 - term number
        pop (ra)	
        ret
        