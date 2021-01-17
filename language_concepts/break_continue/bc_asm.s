		.global	main
		.text

/*	This program demonstrates break and continue. In the end, they're
	nothing but branches! The difference between break and continue is
	where they branch to... branching beyond the loop is a break while
	branching to the "top" of the loop is a continue.
*/

main:	stp		x21, x30, [sp, -16]!	// save registers for later
		mov		x21, -1

1:		add		x21, x21, 1
		cmp		x21, 7
		bne		2f
		adr		x0, skip
		bl		puts
		b 		1b				// by branching back to the "top" this is a continue
2:		cmp		x21, 10
		blt		1b				// this is the closing brace on line 15 of the C code
		adr		x0, brkg		// this path leads out of the loop so is the break
		bl		puts
		// The way the above was organized saved one or more instructions. Do you see it?

		ldp		x21, x30, [sp], 16	// restore registers in preparation of exiting
		mov		x0, xzr
		ret

		.data
skip:	.asciz	"Skipping 7"
brkg:	.asciz	"Breaking at 10"

		.end
