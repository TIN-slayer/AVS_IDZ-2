# print integer from register
.macro print_int (%x)
	push (a0)
	li a7, 1
	mv a0, %x
	ecall
	pop (a0)
.end_macro

# print double from register
.macro print_double (%x)
	push_double (fa0)
	li a7, 3
	fmv.d fa0, %x
	ecall
	pop_double (fa0)
.end_macro

# read integer in any register except for a0
.macro read_int(%x)
	push (a0)
	li a7, 5
	ecall
	mv %x, a0
	pop (a0)
.end_macro

# print string from register
.macro print_str (%x)
	.data
		str:	.asciz %x
	.text
		push (a0)
		li a7, 4
		la a0, str
		ecall
		pop (a0)
.end_macro

# print char from register
.macro print_char(%x)
	push (a0)
	li a7, 11
	li a0, %x
	ecall
	pop (a0)
.end_macro

.macro newline
	print_char('\n')
.end_macro

# exit programm
.macro exit
	push (a0)
	li a7, 10
	ecall
	pop (a0)
.end_macro

# Store register in stack
.macro push(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

# Pop element from top of stack to register
.macro pop(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro

# Store  f_register in stack
.macro push_double(%x)
	addi	sp, sp, -8
	fsd	%x, (sp)
.end_macro

# Pop element from top of stack to f_register
.macro pop_double(%x)
	fld	%x, (sp)
	addi	sp, sp, 8
.end_macro

# input number of terms in series
.macro input (%x)
	mv	a0 %x
	jal	input
	mv	%x a0
.end_macro

# calculate Nilakantha series to get pi
.macro get_pi (%x, %y)
	push (a0)
	mv	a0 %x
	jal	get_pi
	fmv.d	%y fa0
	pop (a0)
.end_macro

# print calculated pi
.macro output (%x)
	push_double(fa0)
	fmv.d	fa0 %x
	jal	output
	pop_double(fa0)
.end_macro
