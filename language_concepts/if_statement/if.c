#include <stdio.h>

/*	"extern" means a lot of things. In this case it is explicitly informing
	the compiler that the implementation of a function with the following
	signature will be found outside this file.
*/

extern int maximum_asm(int a, int b);

/*	This is a canonical "if" statement. Of course, it could be made into
	a single statement using the tertiary operator.
*/

int maximum(int a, int b) {
	if (a > b)
		return a;
	else
		return b;
}

int main() {
	int m = maximum_asm(10, 20);
	printf("Maximum returns: %d\n", m);
	return 0;
}
