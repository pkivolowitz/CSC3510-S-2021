#include <iostream>
#include <cinttypes>

using namespace std;

extern "C" void F2(int32_t l, int16_t * a);

int main() {
	const int32_t LENGTH = 16;
	int16_t array[LENGTH];

	F2(LENGTH, array);
	for (int i = 0; i < LENGTH; i++) {
		cout << "[" << i << "] " << array[i] << endl;
	}
}