		.global	main
		.text

/*	This program demonstrates break and continue. In the end, they're
	nothing but branches! The difference between break and continue is
	where they branch to... branching beyond the loop is a break while
	branching to the "top" of the loop is a continue.
*/

main:	stp		x21, x30, [sp, -16]!
		mov		x21, -1

1:		add		x21, x21, 1
		cmp		x21, 7
		bne		2f
		adr		x0, skip
		bl		puts
		b 		1b
2:		cmp		x21, 10
		blt		1b
		adr		x0, brkg
		bl		puts

		ldp		x21, x30, [sp], 16
		mov		x0, xzr
		ret

		.data
skip:	.asciz	"Skipping 7"
brkg:	.asciz	"Breaking at 10"

		.end
