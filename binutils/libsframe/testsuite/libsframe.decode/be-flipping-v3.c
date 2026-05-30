/* be-flipping-v3.c -- Test for handling different endianness for SFrame V3
   flex FDE in libsframe.

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

/* SFrame info from the source specified in README-be-flipping-v3.  It contains
   one flex FDE with 5 FREs.  */
#define DATA	"DATA-BE-V3"

int
main (void)
{
  sframe_decoder_ctx *dctx = NULL;
  uint32_t nfres, fsize;
  int32_t fstart;
  unsigned char finfo;
  int err = 0, err_reg_data = 0;
  uint32_t reg_data = 0;

  FILE *fp;
  struct stat st;
  char *sf_buf;
  size_t sf_size;
  uint8_t rep_block_size;

  /* Test setup.  */
  fp = fopen (DATA, "r");
  if (fp == NULL)
    goto setup_fail;
  if (fstat (fileno (fp), &st) < 0)
    {
      perror ("fstat");
      fclose (fp);
      goto setup_fail;
    }
  sf_buf = malloc (st.st_size);
  if (sf_buf == NULL)
    {
      perror ("malloc");
      goto setup_fail;
    }
  sf_size = fread (sf_buf, 1, st.st_size, fp);
  fclose (fp);
  if (sf_size == 0)
    {
      fprintf (stderr, "Decode: Read buffer failed\n");
      goto setup_fail;
    }

  uint32_t dfde = SFRAME_FDE_TYPE_FLEX;
  /* Execute tests.  */

  /* Call to sframe_decode will endian flip the input buffer (big-endian) if
     the host running the test is a little-endian system.  This endian-flipped
     copy of the buffer is kept internally in dctx.  */
  dctx = sframe_decode (sf_buf, sf_size, &err);
  TEST (dctx != NULL, "be-flipping-v3: Decoder setup");

  unsigned int fde_cnt = sframe_decoder_get_num_fidx (dctx);
  TEST (fde_cnt == 1, "be-flipping-v3: Decoder FDE count");

  err = sframe_decoder_get_funcdesc_v2 (dctx, 0, &nfres, &fsize, &fstart,
					&finfo, &rep_block_size);
  TEST (err == 0, "be-flipping-v3: Decoder get FDE");
  TEST (nfres == 5, "be-flipping-v3: Decoder FRE count");

  /* Get the FRE at index 2.  */
  sframe_frame_row_entry fre = {0};
  err = sframe_decoder_get_fre (dctx, 0, 2, &fre);
  TEST (err == 0, "be-flipping-v3: Decoder get third FRE");

  /* Expected CFA offset of 160.  */
  TEST ((err == 0 && sframe_fre_get_cfa_offset (dctx, &fre, dfde, &err) == 0xa0),
	"be-flipping-v3: Get CFA offset of third FRE");

  /* Expected RA reg r16.  */
  reg_data = sframe_get_fre_udata (&fre, SFRAME_FRE_RA_OFFSET_IDX * 2,
				   &err_reg_data);
  TEST ((err_reg_data == 0 && SFRAME_V3_FLEX_FDE_CTRLWORD_REG_P (reg_data) == 0x1),
	"be-flipping-v3: Whether RA reg_p is true");
  TEST ((err_reg_data == 0 && SFRAME_V3_FLEX_FDE_CTRLWORD_REGNUM (reg_data) == 16),
	"be-flipping-v3: Get RA reg of third FRE");

  /* Expected FP reg r17.  */
  err_reg_data = 0;
  reg_data = sframe_get_fre_udata (&fre, SFRAME_FRE_FP_OFFSET_IDX * 2,
				   &err_reg_data);
  TEST ((err_reg_data == 0 && SFRAME_V3_FLEX_FDE_CTRLWORD_REG_P (reg_data) == 0x1),
	"be-flipping-v3: Whether FP reg_p is true");
  TEST ((err_reg_data == 0 && SFRAME_V3_FLEX_FDE_CTRLWORD_REGNUM (reg_data) == 17),
	"be-flipping-v3: Get FP reg of third FRE");

  free (sf_buf);
  sf_buf = NULL;

  sframe_decoder_free (&dctx);
  return 0;

setup_fail:
  sframe_decoder_free (&dctx);
  fail ("be-flipping-v3: Test setup");
  return 1;
}
