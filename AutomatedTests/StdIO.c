#include <stdio.h>

int main()
{
	FILE *f = fopen("out", "w");
	fprintf(f, "OK\n");
	fclose(f);
}
