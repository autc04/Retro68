#define TYPE v64di
#include "simd-math-4.c"

/* { dg-final { scan-assembler-times {__divmodv64di4@rel32@lo} 1 { xfail *-*-* } } } */
/* { dg-final { scan-assembler-times {__udivmodv64di4@rel32@lo} 0 } } */
/* { dg-final { scan-assembler-times {__divv64di3@rel32@lo} 1 } } */
/* { dg-final { scan-assembler-times {__udivv64di3@rel32@lo} 0 } } */
/* { dg-final { scan-assembler-times {__modv64di3@rel32@lo} 1 } } */
/* { dg-final { scan-assembler-times {__umodv64di3@rel32@lo} 0 } } */
