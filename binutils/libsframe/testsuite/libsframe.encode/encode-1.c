/* encode-1.c -- Test for encoder in libsframe.

   Copyright (C) 2022-2026 Free Software Foundation, Inc.

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
#define FDE1_NUM_FRES    4
  /* A contiguous block containing 4 FREs.  */
  sframe_frame_row_entry fres[]
    = { {0x0, {0x8, 0, 0}, 0x3},
	{0x1, {0x10, 0xf0, 0}, 0x5},
	{0x4, {0x10, 0xf0, 0}, 0x4},
	{0x1a, {0x8, 0xf0, 0}, 0x5}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0x1a).  */
  *func_size = 0x1b;

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
  sframe_frame_row_entry fres[]
    = { {0x0, {0x8, 0, 0}, 0x3},
	{0x1, {0x10, 0xf0, 0}, 0x5},
	{0x4, {0x10, 0xf0, 0}, 0x4},
	{0xf, {0x8, 0xf0, 0}, 0x5}
      };
 /* Function size in bytes.  P.S. Must be a value greater than the
    fre_start_addr of the last FRE above (0xf).  */
  *func_size = 0x10;

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

/*
 * SFrame info from the following source (2 fdes, 4 fres in each fde):
 * static int cnt;
 * int foo() { return ++cnt; }
 * int main() { return foo(); }
 */
#define DATA    "DATA2"

static int
data_match (char *sframe_buf, size_t sz)
{
  FILE *fp;
  struct stat st;
  char *sf_buf;
  size_t sf_size;
  int diffs;

  fp = fopen (DATA, "r");
  if (fp == NULL)
    return 0;
  if (fstat (fileno (fp), &st) < 0)
    {
      perror ("fstat");
      fclose (fp);
      return 0;
    }
  sf_buf = malloc (st.st_size);
  if (sf_buf == NULL)
    {
      perror ("malloc");
      return 0;
    }
  sf_size = fread (sf_buf, 1, st.st_size, fp);
  fclose (fp);
  if (sf_size == 0 || sf_buf == NULL)
    {
      fprintf (stderr, "Encode: Read section failed\n");
      return 0;
    }
  if (sf_size != sz)
    return 0;

  diffs = memcmp (sf_buf, sframe_buf, sz);

  free (sf_buf);
  return diffs == 0;
}

int main (void)
{
  sframe_encoder_ctx *encode;
  sframe_frame_row_entry frep;
  int64_t sframe_vaddr;
  int64_t func1_start_vaddr;
  int64_t func2_start_vaddr;
  uint32_t func1_size = 0;
  uint32_t func2_size = 0;
  char *sframe_buf;
  size_t sf_size;
  int err = 0;
  unsigned int fde_cnt = 0;
  int match_p = 0;

  sframe_vaddr = 0x4020c8;
  encode = sframe_encode (SFRAME_VERSION,
			  SFRAME_F_FDE_FUNC_START_PCREL,
			  SFRAME_ABI_AMD64_ENDIAN_LITTLE,
			  SFRAME_CFA_FIXED_FP_INVALID,
			  -8, /* Fixed RA offset for AMD64.  */
			  &err);

  fde_cnt = sframe_encoder_get_num_fidx (encode);
  TEST (fde_cnt == 0, "encode-1: Encoder FDE count at init");

  err = sframe_encoder_add_fre (encode, 1, &frep);
  TEST (err == SFRAME_ERR, "encode-1: Encoder update workflow");

  func1_start_vaddr = 0x401106;
  err = add_fde1 (encode, func1_start_vaddr, sframe_vaddr, 0, &func1_size);
  TEST (err == 0, "encode-1: Encoder adding FDE1");

  /* Function 2 is placed after 0x0 bytes from the end of Function 1.  */
  func2_start_vaddr = func1_start_vaddr + func1_size + 0x0;
  err = add_fde2 (encode, func2_start_vaddr, sframe_vaddr, 1, &func2_size);
  TEST (err == 0, "encode-1: Encoder adding FDE2");

  fde_cnt = sframe_encoder_get_num_fidx (encode);
  TEST (fde_cnt == 2, "encode-1: Encoder FDE count post addition");

  sframe_buf = sframe_encoder_write (encode, &sf_size, true, &err);
  TEST (err == 0, "encode-1: Encoder write");

  match_p = data_match (sframe_buf, sf_size);
  TEST (match_p == 1, "encode-1: Encode buffer match");

  sframe_encoder_free (&encode);
  return 0;
}
