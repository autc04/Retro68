/* Test C23 digit separators.  Test token pasting avoided for preprocessed
   output.  */
/* { dg-do compile } */
/* { dg-options "-std=c23 -save-temps" } */

#define ZERO 0

int
f (void)
{
  return ZERO'0'0; /* { dg-error "expected" } */
}
