/* findfre-flex-1.c -- Test for sframe_find_fre and access APIs for
   SFRAME_FDE_TYPE_FLEX in libsframe.

   Copyright (C) 2026 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#include "sframe-test.h"

static int
add_fde1 (sframe_encoder_ctx *encode, int64_t start_pc_vaddr,
	  int64_t sframe_vaddr, int idx, uint32_t *func_size)
{
  /* A contiguous block containing 6 FREs which look like:
       func idx [0]: pc = 0x0, size = 95 bytes, attr = "F"
       STARTPC         CFA       FP        RA
       0000000000000000  sp+8      u         f
       0000000000000009  r10+0     u         f
       0000000000000018  r10+0     (fp+0)    U
       000000000000001a  (fp-8)    (fp+0)    U
       0000000000000052  r10+0     (fp+0)    U
       000000000000005e  sp+8      (fp+0)    U  */
#define FDE1_NUM_FRES    6
  sframe_frame_row_entry fres[FDE1_NUM_FRES]
    = { {0x0, {0x39, 0x08}, 0x4},
	{0x9, {0x51, 0x0}, 0x4},
	{0x18, {0x51, 0x0, 0x0, 0x33, 0x0}, 0xa},
	{0x1a, {0x33, 0xf8, 0x0, 0x33, 0x0}, 0xa},
	{0x52, {0x51, 0x0, 0x0, 0x33, 0x0}, 0xa},
	{0x5e, {0x39, 0x08, 0x0, 0x33, 0x0}, 0xa}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0x5e).  */
  *func_size = 0x5f;

  uint32_t offsetof_fde_in_sec
    = sframe_encoder_get_offsetof_fde_start_addr (encode, idx, NULL);
  int64_t func1_start_addr = (start_pc_vaddr
			      - (sframe_vaddr + offsetof_fde_in_sec));
  unsigned char finfo = sframe_fde_create_func_info (SFRAME_FRE_TYPE_ADDR1,
						     SFRAME_V3_FDE_PCTYPE_INC);
  unsigned char finfo2 = 0;
  finfo2 = SFRAME_V3_SET_FDE_TYPE (finfo2, SFRAME_FDE_TYPE_FLEX);
  int err = sframe_encoder_add_funcdesc_v3 (encode, func1_start_addr,
					    *func_size, finfo, finfo2, 0,
					    FDE1_NUM_FRES);
  if (err == -1)
    return err;

  for (unsigned int i = 0; i < FDE1_NUM_FRES; i++)
    if (sframe_encoder_add_fre (encode, idx, fres + i) == SFRAME_ERR)
      return -1;

  return 0;
}

static int
add_fde2 (sframe_encoder_ctx *encode, int64_t start_pc_vaddr,
	  int64_t sframe_vaddr, int idx, uint32_t *func_size)
{
  /* A contiguous block containing 3 FREs which look like:
       func idx [0]: pc = 0x0, size = 7 bytes, attr = "F"
       STARTPC         CFA       FP        RA
       0000000000000000  sp+8      u         f
       0000000000000004  sp+40     u         f
       0000000000000005  sp+0      u         r2+0  */
#define FDE2_NUM_FRES    3
  sframe_frame_row_entry fres[FDE2_NUM_FRES]
    = { {0x0, {0x39, 0x8, 0}, 0x4},
	{0x4, {0x39, 0x28, 0}, 0x8},
	{0x5, {0x39, 0x0, 0x11, 0x0}, 0x8}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0x5).  */
  *func_size = 0x7;

  uint32_t offsetof_fde_in_sec
    = sframe_encoder_get_offsetof_fde_start_addr (encode, idx, NULL);
  int64_t func2_start_addr = (start_pc_vaddr
			      - (sframe_vaddr + offsetof_fde_in_sec));
  unsigned char finfo = sframe_fde_create_func_info (SFRAME_FRE_TYPE_ADDR1,
						     SFRAME_V3_FDE_PCTYPE_INC);
  unsigned char finfo2 = 0;
  finfo2 = SFRAME_V3_SET_FDE_TYPE (finfo2, SFRAME_FDE_TYPE_FLEX);
  int err = sframe_encoder_add_funcdesc_v3 (encode, func2_start_addr,
					    *func_size, finfo, finfo2, 0,
					    FDE2_NUM_FRES);
  if (err == -1)
    return err;

  for (unsigned int i = 0; i < FDE2_NUM_FRES; i++)
    if (sframe_encoder_add_fre (encode, idx, fres + i) == SFRAME_ERR)
      return -1;

  return 0;
}

static
void test_text_findfre (const char suffix, int64_t text_vaddr,
			int64_t sframe_vaddr)
{
  sframe_encoder_ctx *encode;
  sframe_decoder_ctx *dctx;
  sframe_frame_row_entry frep;
  int64_t func1_start_vaddr;
  int64_t func2_start_vaddr;
  uint32_t func1_size = 0;
  uint32_t func2_size = 0;
  uint32_t fde_cnt = 0;
  int64_t lookup_pc;
  char *sframe_buf;
  size_t sf_size;
  int err = 0;
  uint32_t dfde = SFRAME_FDE_TYPE_FLEX;

  encode = sframe_encode (SFRAME_VERSION,
			  SFRAME_F_FDE_FUNC_START_PCREL,
			  SFRAME_ABI_AMD64_ENDIAN_LITTLE,
			  SFRAME_CFA_FIXED_FP_INVALID,
			  -8, /* Fixed RA offset for AMD64.  */
			  &err);

  func1_start_vaddr = text_vaddr;
  err = add_fde1 (encode, func1_start_vaddr, sframe_vaddr, 0, &func1_size);
  TEST (err == 0, "findfre-flex-1%c: Adding FDE1", suffix);

  /* Function 2 is placed after 0x10 bytes from the end of Function 1.  */
  func2_start_vaddr = func1_start_vaddr + func1_size + 0x10;
  err = add_fde2 (encode, func2_start_vaddr, sframe_vaddr, 1, &func2_size);
  TEST (err == 0, "findfre-flex-1%c: Adding FDE2", suffix);

  fde_cnt = sframe_encoder_get_num_fidx (encode);
  TEST (fde_cnt == 2, "findfre-flex-1%c: Test FDE count", suffix);

  sframe_buf = sframe_encoder_write (encode, &sf_size, true, &err);
  TEST (err == 0, "findfre-flex-1%c: Encoder write", suffix);

  dctx = sframe_decode (sframe_buf, sf_size, &err);
  TEST (dctx != NULL, "findfre-flex-1%c: Decoder setup", suffix);

  /* Find the third FRE in first FDE.  */
  lookup_pc = func1_start_vaddr + 0x19 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_fp_offset (dctx, &frep, dfde, &err) == 0x0),
	"findfre-flex-1%c: Find third FRE in FDE1", suffix);

  /* Find an FRE for PC at the end of range covered by FRE.  */
  lookup_pc = func1_start_vaddr + 0x8 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &frep, dfde, &err) == 0x8),
	"findfre-flex-1%c: Find FRE for last PC covered by FRE", suffix);

  /* Find the last FRE in first FDE.  */
  lookup_pc = func1_start_vaddr + 0x5e - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &frep, dfde, &err) == 0x8),
	"findfre-flex-1%c: Find last FRE", suffix);

  /* Find the second FRE in second FDE.  */
  lookup_pc = func2_start_vaddr + 0x4 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &frep, dfde, &err) == 0x28),
	"findfre-flex-1%c: Find second FRE", suffix);

  /* Find the third FRE in second FDE.  */
  lookup_pc = func2_start_vaddr + 0x5 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_ra_offset (dctx, &frep, dfde, &err) == 0x0),
	"findfre-flex-1%c: Find third FRE in FDE2", suffix);

  /* Find FRE for PC out of range.  Expect error code.  */
  lookup_pc = func1_start_vaddr + func1_size - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST (err == SFRAME_ERR,
	"findfre-flex-1%c: Find FRE for out of range PC", suffix);

  sframe_encoder_free (&encode);
  sframe_decoder_free (&dctx);
}

int main (void)
{
  int64_t sframe_vaddr = 0x402220;
  int64_t text_vaddr = 0x401020;
  printf ("Testing with text_vaddr = %#lx; sframe_vaddr = %#lx\n", text_vaddr,
	  sframe_vaddr);
  test_text_findfre ('a', text_vaddr, sframe_vaddr);

  sframe_vaddr = 0x401020;
  text_vaddr = 0x402220;
  printf ("Testing with text_vaddr = %#lx; sframe_vaddr = %#lx\n", text_vaddr,
	  sframe_vaddr);
  test_text_findfre ('b', text_vaddr, sframe_vaddr);
}
