/* { dg-do run { target avx512fp16 } } */
/* { dg-options "-O2 -mavx512fp16 -mavx512vl -mavx512dq" } */

#define AVX512VL
#define AVX512F_LEN 256      
#define AVX512F_LEN_HALF 128 
#include "avx512fp16-vsqrtph-1b.c"
                             
#undef AVX512F_LEN           
#undef AVX512F_LEN_HALF      
                             
#define AVX512F_LEN 128      
#define AVX512F_LEN_HALF 128 
#include "avx512fp16-vsqrtph-1b.c"

