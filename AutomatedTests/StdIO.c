#include <stdio.h>

int main(void)
{
    FILE *f = fopen("out", "w");
    fprintf(f, "OK\n");
    fclose(f);
}
