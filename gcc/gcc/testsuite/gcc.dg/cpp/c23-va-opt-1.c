/* Test __VA_OPT__ and no "..." arguments in a call to a variable-arguments
   macro accepted for C23.  */
/* { dg-do preprocess } */
/* { dg-options "-std=c23 -pedantic-errors" } */

#define CALL(F, ...) F (7 __VA_OPT__(,) __VA_ARGS__)
#define M(X, ...) X

CALL (a);
CALL (b, 1);
M (x);
