#include <stdio.h>

int main() {
	int i = -1;
	// c does not have "true"
	while (1) {
		i++;
		if (i == 7) {
			puts("Skipping 7");
			continue;
		} else if (i >= 10) {
			puts("Breaking at 10");
			break;
		}
	}
	return 0;
}
