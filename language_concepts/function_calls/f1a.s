		.text
		.align	2
		.global	F1

/*	int64_t F1(int64_t v)
	This function multiples v by 2 and returns the result.

	x1 is treated purely as scratch.
	x0 is where v comes in and the return value goes out.
*/

F1:		mov		x1, 2
		mul		x0, x0, x1
		ret
