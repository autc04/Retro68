#include <stdio.h>

char *__array [] =
{
  "PASS",
  NULL
};

extern __typeof (__array) array __attribute__ ((weak, alias ("__array")));
