.include "macroslib.asm"
.global get_pi
.data
	two:	.double 2
	three:	.double 3
	four:	.double 4
.text
get_pi:
	push (ra)
	fld	fa0 three t0	# pi
	fmv.w.x	ft3 zero	# term
	fld	ft0 two t0	# first term in the denominator
	fld	ft1 three t0	# second term in the denominator
	fld	ft2 four t0	# third term in the denominator
	fld	ft4 four t0	# const 4
	fld	ft5 two t0	# const 2
	li	t0 1	# loop counter
	li	t1 1	# checker
	loop_nilakantha:	# loop where we calculate pi using Nilakantha series
		fmul.d	ft3 ft0 ft1
		fmul.d	ft3 ft3 ft2
		fdiv.d	ft3 ft4 ft3
		# check if we need to add or subtract term
		bnez	t1 add_term 
		j	sub_term
		add_term:
			fadd.d	fa0 fa0 ft3
			li	t1 0
			j	continue
		sub_term:
			fsub.d	fa0 fa0 ft3
			li	t1 1
			j	continue
		continue:
			fadd.d	ft0 ft0 ft5	# first term += 2
			fadd.d	ft1 ft1 ft5	# second term += 2
			fadd.d	ft2 ft2 ft5	# third term += 2
			addi	t0 t0 1
			blt	t0 a0 loop_nilakantha	# check if we already counted all required terms
        pop (ra)
      	ret
		        