		.global	main
		.text

main:	stp		x21, x30, [sp, -16]!
		mov		w21, wzr

1:		adr		x0, fmt					# address of fmt goes in x0
		mov		w1, w21					# value of i goes in w1
		bl		printf					# printf(fmt, i)

		add		w21, w21, 1
		cmp		w21, 10
		blt		1b

		ldp		x21, x30, [sp], 16
		mov		x0, xzr
		ret

		.data
fmt:	.asciz	"[%d]\n"

		.end
