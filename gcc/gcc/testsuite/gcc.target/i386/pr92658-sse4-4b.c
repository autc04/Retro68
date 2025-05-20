/* PR target/92658 */
/* { dg-do compile } */
/* { dg-options "-O2 -mtune=icelake-server -ftree-vectorize -msse4.1" } */

typedef unsigned char v4qi __attribute__((vector_size (4)));
typedef unsigned short v2hi __attribute__((vector_size (4)));

void
foo_u8_u16 (v2hi * dst, v4qi * __restrict src)
{
  unsigned short tem[2];
  tem[0] = (*src)[0];
  tem[1] = (*src)[1];
  dst[0] = *(v2hi *) tem;
}

void
bar_u8_u16 (v2hi * dst, v4qi src)
{
  unsigned short tem[4];
  tem[0] = src[0];
  tem[1] = src[1];
  dst[0] = *(v2hi *) tem;
}

/* { dg-final { scan-assembler-times "pmovzxbw" 2 } } */
