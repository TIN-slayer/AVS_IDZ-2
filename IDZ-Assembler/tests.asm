.include "macroslib.asm"
.text
	tests:
		print_str ("Test 1")
		newline
		li      a0 7	# term number
		print_str ("Number of terms in Nilakantha's series: ")
		print_int (a0)
		newline
		# calculate pi
		get_pi (a0, fa0)
		# print pi
		output (fa0)
		newline
		
		print_str ("Test 2")
		newline
		li      a0 458	# term number
		print_str ("Number of terms in Nilakantha's series: ")
		print_int (a0)
		newline
		# calculate pi
		get_pi (a0, fa0)
		# print pi
		output (fa0)
		newline
		
		print_str ("Test 3")
		newline
		li      a0 7894	# term number
		print_str ("Number of terms in Nilakantha's series: ")
		print_int (a0)
		newline
		# calculate pi
		get_pi (a0, fa0)
		# print pi
		output (fa0)
		exit
