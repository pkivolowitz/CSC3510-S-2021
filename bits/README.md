# Bit Operations

The bitwise operators in C++ are:

| Op | Meaning |
| -- | ------- |
| \| | Or  |
| &  | And |
| ^  | Xor |
| ~  | Not |
| << | Shift Left  |
| >> | Shift Right |

## Write the following functions

If you prefer, code these first using a fixed type. Then, however, I want you to write these using templated functions where doing so makes sense. Note you (as the library designer / author) can document a templated function as being only usable by the integers, etc.

Further, I want you to uses `assert` to do some basic sanity checks where appropriate.

```c++
template<class T>
bool IsBitSet(T v, int bitnum);

template<class T>
T ClearBit(T v, int bitnum);

template<class T>
T SetBitTo(T v, int bitnum, T b);

template<class T>
T FlipBit(T v, int bitnum);

bool IsLittleEndian();

template<class T>
bool IsPowerOfTwo(T v);

bool IsSameSign(int64_t a, int64_t b);

template<class T>
bool IsNegative(T v);
```

Here is a test harness you can start with:

```c++
int main() {
    cout << boolalpha;
    cout << dec << setw(5) << left << __LINE__ << " true:  " << IsBitSet<uint64_t>(1, 0) << endl;
    cout << dec << setw(5) << left << __LINE__ << " false: " << IsBitSet<uint64_t>(1, 1) << endl;
	cout << dec << setw(5) << left << __LINE__ << " fe:    " << hex << int(ClearBit<uint8_t>(0xFF, 0)) << endl;
	cout << dec << setw(5) << left << __LINE__ << " 7f:    " << hex << int(ClearBit<uint8_t>(0xFF, 7)) << endl;
	cout << dec << setw(5) << left << __LINE__ << " ff:    " << hex << int(SetBitTo<uint8_t>(0x7F, 7, 1)) << endl;
	cout << dec << setw(5) << left << __LINE__ << " ff:    " << hex << int(SetBitTo<uint8_t>(0xFF, 7, 0)) << endl;
	cout << dec << setw(5) << left << __LINE__ << " fe:    " << hex << int(FlipBit<uint8_t>(0xFF, 0)) << endl;
	cout << dec << setw(5) << left << __LINE__ << " true:  " << IsPowerOfTwo<uint32_t>(64) << endl;
	cout << dec << setw(5) << left << __LINE__ << " false: " << IsPowerOfTwo<uint32_t>(65) << endl;
	cout << dec << setw(5) << left << __LINE__ << " true:  " << IsSameSign(20, 30) << endl;
	cout << dec << setw(5) << left << __LINE__ << " false: " << IsSameSign(20, -3) << endl;
	cout << dec << setw(5) << left << __LINE__ << " true:  " << IsNegative<int32_t>(-1) << endl;
	cout << dec << setw(5) << left << __LINE__ << " false: " << IsNegative<int32_t>(20) << endl;
	cout << dec << setw(5) << left << __LINE__ << " true:  " << IsNegative<int8_t>(-1) << endl;
	cout << dec << setw(5) << left << __LINE__ << " false: " << IsNegative<int16_t>(20) << endl;

	cout << "Little Endian: " << IsLittleEndian() << endl;
    return 0;
}
```

## Why templates in Comp Org?

I include a lot in this course that you may not get too much practice with in other courses. Examples include `union` and bit fields.
