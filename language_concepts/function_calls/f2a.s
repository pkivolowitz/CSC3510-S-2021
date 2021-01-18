		.text
		.align	2
		.global	F2

/*	int64_t F1(int32_t length, int16_t * array)
	This function initializes the array of shorts pointed to by "array"
	with integers matching the index of each location (i.e. 0 in array[0]).

	w0 is where length comes in.
	x1 is where the address of "array" comes in.
	w2 is used as a counter

	This implementation of the for loop could be made one instruction 
	shorter by putting the test on the bottom of the loop.

	The strh instruction is this:
	*(ptr++) = i
	where ptr is a pointer to shorts (hence the increment by 2)
*/

F2:		mov		w2, wzr
1:		cmp		w2, w0
		bge		2f

		strh 	w2, [x1], 2
		add 	w2, w2, 1
		b 		1b

2:		ret
