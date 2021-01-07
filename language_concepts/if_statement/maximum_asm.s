		.global	maximum_asm
		.text

/*	This is an example of an if statement in AARCH64 assembly language.

	the C signature of this function is:
	int maximum_asm(int a, int b)

	'a' being the first listed parameter is passed in w0.
	'b' being the second listed parameter is passed in w1.

	w0 is a 32 bit cast of x0 (which is 64 bits wide).
	w1 is a 32 bit cast of x1 (which is 64 bits wide).

	Because 'a' is already in w0 (where return values are placed for
	the calling function to find), this assembly language reads a little
	differently than the equivalent c.

	Specifically, the code below looks more like:
	if (b > a)
		a = b
	return a

	The lines using str and ldr are not strictly necessary in this function
	because IT calls no other functions (i.e. it is self-contained). If this
	function had called another function, the str and ldr lines would be 
	quite necessary.

	Believe it or not, this implementation could have been made smaller still.

	The branch to label 1f is a use of a temporary label. Labels can
	temporary or more "permanent". A temporary label can be used over and
	over again in different places - assembly language uses a lot of labels
	because sets of braces become branch statements. A number by itself used
	as a label is a temporary lable. Since they can be reused, the use of the
	label contains a specification of f or b for forward or backward.
*/
maximum_asm:
	cmp		w0, w1
	bge		1f
	mov		w0, w1
1:	ret
