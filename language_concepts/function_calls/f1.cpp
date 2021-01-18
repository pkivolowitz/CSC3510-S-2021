#include <iostream>
#include <cinttypes>

using namespace std;

/*	extern means find the code someplace else.
	"C" means do not name-mangle.
*/

extern "C" int64_t F1(int64_t v);

int main() {
	int64_t	v = 32;
	cout << "v: " << v << " F1(v): " << F1(v) << endl;
	return 0;
}