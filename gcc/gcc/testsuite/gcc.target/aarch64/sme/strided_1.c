// { dg-options "-O2 -fno-schedule-insns -fno-schedule-insns2" }
// { dg-final { check-function-bodies "**" "" } }

#include <arm_sme.h>

#pragma GCC target "+sme2"

// This file deliberately contains nonsense code.

/*
** test1:
**	ptrue	[^\n]+
**	ld1w	[^\n]+
**	ld1w	[^\n]+
**	ld1w	[^\n]+
**	ld1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	ret
*/
void test1(int32_t *dest, int32_t *src) __arm_streaming
{
  svcount_t pg = svptrue_c32();
  svint32x4_t l0 = svld1_vnum_x4(pg, src, 0);
  svint32x4_t l1 = svld1_vnum_x4(pg, src, 4);
  svint32x4_t l2 = svld1_vnum_x4(pg, src, 8);
  svint32x4_t l3 = svld1_vnum_x4(pg, src, 12);
  svst1_vnum(pg, dest, 0,
	     svcreate4(svget4(l0, 0), svget4(l1, 0),
		       svget4(l2, 0), svget4(l3, 0)));
  svst1_vnum(pg, dest, 4,
	     svcreate4(svget4(l0, 1), svget4(l1, 1),
		       svget4(l2, 1), svget4(l3, 1)));
  svst1_vnum(pg, dest, 8,
	     svcreate4(svget4(l0, 2), svget4(l1, 2),
		       svget4(l2, 2), svget4(l3, 2)));
  svst1_vnum(pg, dest, 12,
	     svcreate4(svget4(l0, 3), svget4(l1, 3),
		       svget4(l2, 3), svget4(l3, 3)));
}

/*
** test2:
**	ptrue	[^\n]+
**	ld1w	[^\n]+
**	ld1w	[^\n]+
**	ld1w	[^\n]+
**	ld1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	st1w	[^\n]+
**	ret
*/
void test2(int32_t *dest, int32_t *src) __arm_streaming
{
  svcount_t pg = svptrue_c32();
  svint32x4_t l0 = svld1_vnum_x4(pg, src, 0);
  svint32x4_t l1 = svld1_vnum_x4(pg, src, 4);
  svint32x4_t l2 = svld1_vnum_x4(pg, src, 8);
  svint32x4_t l3 = svld1_vnum_x4(pg, src, 12);
  svst1_vnum(pg, dest, 0,
	     svcreate4(svget4(l0, 0), svget4(l1, 0),
		       svget4(l2, 0), svget4(l3, 0)));
  svst1_vnum(pg, dest, 4,
	     svcreate4(svget4(l0, 1), svget4(l1, 1),
		       svget4(l2, 1), svget4(l3, 1)));
  svst1_vnum(pg, dest, 8,
	     svcreate4(svget4(l0, 2), svget4(l1, 2),
		       svget4(l2, 2), svget4(l3, 2)));
  svst1_vnum(pg, dest, 12,
	     svcreate4(svget4(l0, 3), svget4(l1, 3),
		       svget4(l2, 3), svget4(l3, 3)));
  svst1_vnum(pg, dest, 16,
	     svcreate4(svget4(l0, 0), svget4(l1, 0),
		       svget4(l2, 0), svget4(l3, 0)));
  svst1_vnum(pg, dest, 20,
	     svcreate4(svget4(l0, 1), svget4(l1, 1),
		       svget4(l2, 1), svget4(l3, 1)));
  svst1_vnum(pg, dest, 24,
	     svcreate4(svget4(l0, 2), svget4(l1, 2),
		       svget4(l2, 2), svget4(l3, 2)));
  svst1_vnum(pg, dest, 28,
	     svcreate4(svget4(l0, 3), svget4(l1, 3),
		       svget4(l2, 3), svget4(l3, 3)));
}

/*
** test3:
**	ptrue	([^\n]+)\.s
**	ld1w	{z16\.s - z19\.s}, \1/z, \[x1\]
**	ld1w	{z20\.s - z23\.s}, \1/z, \[x1, #4, mul vl\]
**	ld1w	{z24\.s - z27\.s}, \1/z, \[x1, #8, mul vl\]
**	ld1w	{z28\.s - z31\.s}, \1/z, \[x1, #12, mul vl\]
**	sclamp	[^\n]+
**	st1w	{z19\.s, z23\.s, z27\.s, z31\.s}, \1, \[x0, #12, mul vl\]
**	st1w	{z16\.s, z20\.s, z24\.s, z28\.s}, \1, \[x0\]
**	st1w	{z17\.s, z21\.s, z25\.s, z29\.s}, \1, \[x0, #4, mul vl\]
**	st1w	{z18\.s, z22\.s, z26\.s, z30\.s}, \1, \[x0, #8, mul vl\]
**	ret
*/
void test3(int32_t *dest, int32_t *src) __arm_streaming
{
  svcount_t pg = svptrue_c32();
  svint32x4_t al0 = svld1_vnum_x4(pg, src, 0);
  svint32x4_t l1 = svld1_vnum_x4(pg, src, 4);
  svint32x4_t l2 = svld1_vnum_x4(pg, src, 8);
  svint32x4_t l3 = svld1_vnum_x4(pg, src, 12);
  svint32x4_t l0 = svclamp(al0, svget4(l3, 0), svget4(l3, 1));
  svst1_vnum(pg, dest, 12,
	     svcreate4(svget4(l0, 3), svget4(l1, 3),
		       svget4(l2, 3), svget4(l3, 3)));
  svst1_vnum(pg, dest, 0,
	     svcreate4(svget4(l0, 0), svget4(l1, 0),
		       svget4(l2, 0), svget4(l3, 0)));
  svst1_vnum(pg, dest, 4,
	     svcreate4(svget4(l0, 1), svget4(l1, 1),
		       svget4(l2, 1), svget4(l3, 1)));
  svst1_vnum(pg, dest, 8,
	     svcreate4(svget4(l0, 2), svget4(l1, 2),
		       svget4(l2, 2), svget4(l3, 2)));
}

/*
** test4:
**	ptrue	([^\n]+)\.s
**	ld1w	{z16\.s - z19\.s}, \1/z, \[x1\]
**	ld1w	{z20\.s - z23\.s}, \1/z, \[x1, #4, mul vl\]
**	ld1w	{z24\.s - z27\.s}, \1/z, \[x1, #8, mul vl\]
**	ld1w	{z28\.s - z31\.s}, \1/z, \[x1, #12, mul vl\]
**	sclamp	[^\n]+
**	st1w	{z16\.s, z20\.s, z24\.s, z28\.s}, \1, \[x0\]
**	st1w	{z17\.s, z21\.s, z25\.s, z29\.s}, \1, \[x0, #4, mul vl\]
**	st1w	{z18\.s, z22\.s, z26\.s, z30\.s}, \1, \[x0, #8, mul vl\]
**	st1w	{z19\.s, z23\.s, z27\.s, z31\.s}, \1, \[x0, #12, mul vl\]
**	st1w	{z16\.s, z20\.s, z24\.s, z28\.s}, \1, \[x0, #16, mul vl\]
**	st1w	{z17\.s, z21\.s, z25\.s, z29\.s}, \1, \[x0, #20, mul vl\]
**	st1w	{z18\.s, z22\.s, z26\.s, z30\.s}, \1, \[x0, #24, mul vl\]
**	st1w	{z19\.s, z23\.s, z27\.s, z31\.s}, \1, \[x0, #28, mul vl\]
**	...
**	ret
*/
void test4(int32_t *dest, int32_t *src) __arm_streaming
{
  svcount_t pg = svptrue_c32();
  svint32x4_t l0 = svld1_vnum_x4(pg, src, 0);
  svint32x4_t l1 = svld1_vnum_x4(pg, src, 4);
  svint32x4_t l2 = svld1_vnum_x4(pg, src, 8);
  svint32x4_t l3 = svld1_vnum_x4(pg, src, 12);
  l0 = svclamp(l0, svget4(l3, 0), svget4(l3, 1));
  svst1_vnum(pg, dest, 0,
	     svcreate4(svget4(l0, 0), svget4(l1, 0),
		       svget4(l2, 0), svget4(l3, 0)));
  svst1_vnum(pg, dest, 4,
	     svcreate4(svget4(l0, 1), svget4(l1, 1),
		       svget4(l2, 1), svget4(l3, 1)));
  svst1_vnum(pg, dest, 8,
	     svcreate4(svget4(l0, 2), svget4(l1, 2),
		       svget4(l2, 2), svget4(l3, 2)));
  svst1_vnum(pg, dest, 12,
	     svcreate4(svget4(l0, 3), svget4(l1, 3),
		       svget4(l2, 3), svget4(l3, 3)));
  svst1_vnum(pg, dest, 16,
	     svcreate4(svget4(l0, 0), svget4(l1, 0),
		       svget4(l2, 0), svget4(l3, 0)));
  svst1_vnum(pg, dest, 20,
	     svcreate4(svget4(l0, 1), svget4(l1, 1),
		       svget4(l2, 1), svget4(l3, 1)));
  svst1_vnum(pg, dest, 24,
	     svcreate4(svget4(l0, 2), svget4(l1, 2),
		       svget4(l2, 2), svget4(l3, 2)));
  svst1_vnum(pg, dest, 28,
	     svcreate4(svget4(l0, 3), svget4(l1, 3),
		       svget4(l2, 3), svget4(l3, 3)));
}

/*
** test6:
**	ptrue	[^\n]+
**	ld1h	[^\n]+
**	sclamp	[^\n]+
**	st1h	[^\n]+
**	ret
*/
void test6(int16_t *ptr)
  __arm_streaming __arm_preserves("za") __arm_inout("zt0")
{
  svcount_t pg = svptrue_c16();
  svint16x4_t x0 = svld1_x4(pg, ptr);
  x0 = svclamp(x0, svget4(x0, 0), svget4(x0, 3));
  svst1(pg, ptr, x0);
}
