#include <immintrin.h>

#define PASTER2(x,y)		x##y
#define PASTER3(x,y,z)		_mm##x##_##y##_##z
#define OP(vec, op, suffix)	PASTER3 (vec, op, suffix)
#define DUP(vec, suffix, val)	PASTER3 (vec, set1, suffix) (val)

type
foo (type x, SCALAR *f)
{
  return OP (vec, op, suffix) (x, OP (vec, xor, suffix) (DUP (vec, suffix, *f),
							 DUP (vec, suffix, ~0)));
}
