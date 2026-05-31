/* findfunc-1.c -- Test for sframe_get_funcdesc_with_addr in libsframe.

   Copyright (C) 2023-2026 Free Software Foundation, Inc.

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

/* sframe_get_funcdesc_with_addr is a core API in the libsframe library, which
   is used to find an FDE given a PC.  It is used by sframe_find_fre ().  The
   latter is the mainstay for an SFrame based stack tracer.

   The tests in here stress the sframe_get_funcdesc_with_addr API via calls to
   the sframe_find_fre ().  */

#include "sframe-test.h"

static int
add_fde1 (sframe_encoder_ctx *encode, int64_t start_pc_vaddr,
	  int64_t sframe_vaddr, int idx, uint32_t *func_size)
{
  /* A contiguous block containing 4 FREs.  */
#define FDE1_NUM_FRES    4
  sframe_frame_row_entry fres[FDE1_NUM_FRES]
    = { {0x0, {0x1, 0, 0}, 0x3},
	{0x1, {0x2, 0xf0, 0}, 0x5},
	{0x10, {0x3, 0xf0, 0}, 0x4},
	{0x38, {0x8, 0xf0, 0}, 0x5}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0x38).  */
  *func_size = 0x40;

  uint32_t offsetof_fde_in_sec
    = sframe_encoder_get_offsetof_fde_start_addr (encode, idx, NULL);
  int64_t func1_start_addr = (start_pc_vaddr
			      - (sframe_vaddr + offsetof_fde_in_sec));
  unsigned char finfo = sframe_fde_create_func_info (SFRAME_FRE_TYPE_ADDR1,
						     SFRAME_V3_FDE_PCTYPE_INC);
  int err = sframe_encoder_add_funcdesc_v3 (encode, func1_start_addr,
					    *func_size, finfo, 0, 0,
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
  /* A contiguous block containing 4 FREs.  */
#define FDE2_NUM_FRES    4
  sframe_frame_row_entry fres[FDE2_NUM_FRES]
    = { {0x0, {0x10, 0, 0}, 0x3},
	{0x10, {0x12, 0xf0, 0}, 0x5},
	{0x14, {0x14, 0xf0, 0}, 0x4},
	{0x20, {0x15, 0xf0, 0}, 0x5}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0x20).  */
  *func_size = 0x60;

  uint32_t offsetof_fde_in_sec
    = sframe_encoder_get_offsetof_fde_start_addr (encode, idx, NULL);
  int64_t func2_start_addr = (start_pc_vaddr
			      - (sframe_vaddr + offsetof_fde_in_sec));
  unsigned char finfo = sframe_fde_create_func_info (SFRAME_FRE_TYPE_ADDR1,
						     SFRAME_V3_FDE_PCTYPE_INC);
  int err = sframe_encoder_add_funcdesc_v3 (encode, func2_start_addr,
					    *func_size, finfo, 0, 0,
					    FDE2_NUM_FRES);
  if (err == -1)
    return err;

  for (unsigned int i = 0; i < FDE2_NUM_FRES; i++)
    if (sframe_encoder_add_fre (encode, idx, fres + i) == SFRAME_ERR)
      return -1;

  return 0;
}

static int
add_fde3 (sframe_encoder_ctx *encode, int64_t start_pc_vaddr,
	  int64_t sframe_vaddr, int idx, uint32_t *func_size)
{
  /* A contiguous block containing 4 FREs.  */
#define FDE3_NUM_FRES    4
  sframe_frame_row_entry fres[FDE3_NUM_FRES]
    = { {0x0, {0x16, 0, 0}, 0x3},
	{0x1, {0x17, 0xf0, 0}, 0x5},
	{0x10, {0x18, 0xf0, 0}, 0x4},
	{0x38, {0x19, 0xf0, 0}, 0x5}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0x38).  */
  *func_size = 0x40;

  uint32_t offsetof_fde_in_sec
    = sframe_encoder_get_offsetof_fde_start_addr (encode, idx, NULL);
  int64_t func3_start_addr = (start_pc_vaddr
			      - (sframe_vaddr + offsetof_fde_in_sec));
  unsigned char finfo = sframe_fde_create_func_info (SFRAME_FRE_TYPE_ADDR1,
						     SFRAME_V3_FDE_PCTYPE_INC);
  int err = sframe_encoder_add_funcdesc_v3 (encode, func3_start_addr,
					    *func_size, finfo, 0, 0,
					    FDE3_NUM_FRES);
  if (err == -1)
    return err;

  for (unsigned int i = 0; i < FDE3_NUM_FRES; i++)
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
  int64_t func3_start_vaddr;
  uint32_t func1_size = 0;
  uint32_t func2_size = 0;
  uint32_t func3_size = 0;
  uint32_t fde_cnt = 0;
  int64_t lookup_pc = 0;
  char *sframe_buf;
  size_t sf_size;
  int err = 0;
  uint32_t dfde = SFRAME_FDE_TYPE_DEFAULT;

  encode = sframe_encode (SFRAME_VERSION,
			  SFRAME_F_FDE_FUNC_START_PCREL,
			  SFRAME_ABI_AMD64_ENDIAN_LITTLE,
			  SFRAME_CFA_FIXED_FP_INVALID,
			  -8, /* Fixed RA offset for AMD64.  */
			  &err);

  /* Add FDE at index 0.  */
  func1_start_vaddr = text_vaddr;
  err = add_fde1 (encode, func1_start_vaddr, sframe_vaddr, 0, &func1_size);
  TEST (err == 0, "findfunc-1%c: Adding FDE1", suffix);

  /* Add FDE at index 1.  */
  func2_start_vaddr = func1_start_vaddr + func1_size + 0x10;
  err = add_fde2 (encode, func2_start_vaddr, sframe_vaddr, 1, &func2_size);
  TEST (err == 0, "findfunc-1%c: Adding FDE2", suffix);

  /* Add FDE at index 2.  */
  func3_start_vaddr = func2_start_vaddr + func2_size + 0x10;
  err = add_fde3 (encode, func3_start_vaddr, sframe_vaddr, 2, &func3_size);
  TEST (err == 0, "findfunc-1%c: Adding FDE3", suffix);

  fde_cnt = sframe_encoder_get_num_fidx (encode);
  TEST (fde_cnt == 3, "findfunc-1%c: Test FDE count", suffix);

  sframe_buf = sframe_encoder_write (encode, &sf_size, true, &err);
  TEST (err == 0, "findfunc-1%c: Encoder write", suffix);

  dctx = sframe_decode (sframe_buf, sf_size, &err);
  TEST (dctx != NULL, "findfunc-1%c: Decoder setup", suffix);

  /* Following negative tests check that libsframe APIs
     (sframe_get_funcdesc_with_addr, sframe_find_fre) work
     well for PCs not covered by the FDEs.  */

  /* Search with PC less than the first FDE's start addr.  */
  lookup_pc = func1_start_vaddr - 0x15 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST (err == SFRAME_ERR,
	"findfunc-1%c: test-1: Find FRE for PC not in range", suffix);

  /* Search with a PC between func1's last PC and func2's first PC.  */
  lookup_pc = func1_start_vaddr + func1_size + 0x1 - sframe_vaddr,
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST (err == SFRAME_ERR,
	"findfunc-1%c: test-2: Find FRE for PC not in range", suffix);

  /* Search for a PC between func2's last PC and func3's first PC.  */
  lookup_pc = func2_start_vaddr + func2_size + 0x3 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST (err == SFRAME_ERR,
	"findfunc-1%c: test-3: Find FRE for PC not in range", suffix);

  /* Search for a PC beyond the last func, i.e., > func3's last PC.  */
  lookup_pc = func3_start_vaddr + func3_size + 0x10 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST (err == SFRAME_ERR,
	"findfunc-1%c: test-4: Find FRE for PC not in range", suffix);

  /* And some positive tests... */

  /* Find an FRE for PC in FDE1.  */
  lookup_pc = func1_start_vaddr + 0x9 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &frep, dfde, &err) == 0x2),
	"findfunc-1%c: Find FRE in FDE1", suffix);

  /* Find an FRE for PC in FDE2.  */
  lookup_pc = func2_start_vaddr + 0x11 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &frep, dfde, &err) == 0x12),
	"findfunc-1%c: Find FRE in FDE2", suffix);

  /* Find an FRE for PC in FDE3.  */
  lookup_pc = func3_start_vaddr + 0x10 - sframe_vaddr;
  err = sframe_find_fre (dctx, lookup_pc, &frep);
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &frep, dfde, &err) == 0x18),
	"findfunc-1%c: Find FRE in FDE3", suffix);

  sframe_encoder_free (&encode);
  sframe_decoder_free (&dctx);
}

int main (void)
{
  int64_t sframe_vaddr = 0x4b5620;
  int64_t text_vaddr = 0x4038b0;
  printf ("Testing with text_vaddr = %#lx; sframe_vaddr = %#lx\n", text_vaddr,
	  sframe_vaddr);
  test_text_findfre ('a', text_vaddr, sframe_vaddr);

  sframe_vaddr = 0x4038b0;
  text_vaddr = 0x4b5620;
  printf ("Testing with text_vaddr = %#lx; sframe_vaddr = %#lx\n", text_vaddr,
	  sframe_vaddr);
  test_text_findfre ('b', text_vaddr, sframe_vaddr);
}
