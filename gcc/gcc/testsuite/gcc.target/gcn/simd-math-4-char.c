#define TYPE v64qi
#include "simd-math-4.c"

/* { dg-final { scan-assembler-times {__divmodv64qi4@rel32@lo} 1 { xfail *-*-* } } } */
/* { dg-final { scan-assembler-times {__udivmodv64qi4@rel32@lo} 0 } } */
/* { dg-final { scan-assembler-times {__divv64qi3@rel32@lo} 1 } } */
/* { dg-final { scan-assembler-times {__udivv64qi3@rel32@lo} 0 } } */
/* { dg-final { scan-assembler-times {__modv64qi3@rel32@lo} 1 } } */
/* { dg-final { scan-assembler-times {__umodv64qi3@rel32@lo} 0 } } */
