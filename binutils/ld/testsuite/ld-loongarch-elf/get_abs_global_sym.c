#include <stdio.h>

extern int get_sym();
int main() {
	printf("%x\n", get_sym());
	return 0;
}
