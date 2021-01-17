		.text
		.global	main
		.align	2

/*	while loops are typically coded in the follow way. Interestingly, 
	the decision test is coded at the bottom of the loop NOT at the
	top. For completeness, here (in the comments) is the equivalent
	code with the test at the top of the loop like it appears in the
	equivalent C code:

		mov		w21, wzr

1:		cmp		w21, 10
		beq		2f
		adr		x0, fmt
		mov		w1, w21
		bl		printf
		add		w1, w1, 1
		b 		1b

2:

		Notice the above is ONE instruction longer INSIDE the loop.
		Since the difference is INSIDE the loop, this is important.
		Say the loop executes 1,000,000 times...
		
		Put another way, that one instruction represents 14 percent 
		of the code in the loop.
*/
main:	stp		x21, x30, [sp, -16]!
		
		mov		w21, wzr
		b 		2f

1:		adr		x0, fmt
		mov		w1, w21
		bl		printf
		add		w1, w1, 1
2:		cmp		w1, 10
		bgt		1b

		ldp		x21, x30, [sp], 16
		mov		x0, xzr
		ret

		.data
fmt:	.asciz	"[%d]\n"

		.end
