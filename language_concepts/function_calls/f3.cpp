#include <iostream>
#include <cstdlib>
#include <cinttypes>

using namespace std;

struct S {
	int64_t a_long;		// &s + 0
	int32_t an_int;		// &s + 8
	int16_t a_short;	// &s + 12
	char a_char;		// &s + 14

	void Print() {
		cout << "a_long: " << a_long << endl;
		cout << "an_int: " << an_int << endl;
		cout << "a_short: " << a_short << endl;
		cout << "a_char: " << int(a_char) << endl;
	}
};

/*	This function will dynamically allocate an S and fill it like so:
	a_long = 64;
	an_int = 32;
	a_short = 16;
	a_char = 8;
*/

extern "C" S * F3();

int main() {
	S * ptr = F3();
	ptr->Print();
	free(ptr);
	return 0;
}