#include <stdio.h>

int test_pass_through (FILE *stream)
{
  return ferror (stream);
}
