		.text
		.align	2
		.global	F3

/*	This function will dynamically allocate an S and fill it like so:
	a_long = 64;
	an_int = 32;
	a_short = 16;
	a_char = 8;
	That is, it has knowledge of what an S looks like including its size.
*/



F3:		str 	x30, [sp, -16]!

		mov		x0, 16
		bl		malloc
		mov		x1, 64
		str		x1, [x0]			// put 64 into a_long
		mov		w1, 32
		str 	w1, [x0, 8]			// put 32 into an_int
		mov		w1, 16
		strh 	w1, [x0, 12]		// put 16 into a_short
		mov		w1, 8
		strb	w1, [x0, 14]		// put 8 into a_char

		ldr		x30, [sp], 16
		ret
