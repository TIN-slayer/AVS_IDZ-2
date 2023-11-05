.include "macroslib.asm"
.text
	main:
		# input number of terms in series
		input (a0)	# out: a0 - term number
		# calculate Nilakantha series to get pi
		get_pi (a0, fa0)	# in: a0 - term number; out: fa0 - pi
		# print calculated pi
		output (fa0)	# in: fa0 - pi
		exit
