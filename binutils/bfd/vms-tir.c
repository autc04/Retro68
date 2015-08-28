/* vms-tir.c -- BFD back-end for VAX (openVMS/VAX) and
   EVAX (openVMS/Alpha) files.
   Copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2004, 2005, 2007,
   2008, 2009 Free Software Foundation, Inc.

   TIR record handling functions
   ETIR record handling functions

   Go and read the openVMS linker manual (esp. appendix B)
   if you don't know what's going on here :-)

   Written by Klaus K"ampf (kkaempf@rmi.de)

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
   MA 02110-1301, USA.  */

/* The following type abbreviations are used:

	cs	counted string (ascii string with length byte)
	by	byte (1 byte)
	sh	short (2 byte, 16 bit)
	lw	longword (4 byte, 32 bit)
	qw	quadword (8 byte, 64 bit)
	da	data stream  */

#include "sysdep.h"
#include "bfd.h"
#include "bfdlink.h"
#include "libbfd.h"
#include "vms.h"

static int check_section (bfd *, int);
static void image_set_ptr (bfd *abfd, int psect, uquad offset);
static void image_inc_ptr (bfd *abfd, uquad offset);
static void dst_define_location (bfd *abfd, uquad loc);
static void dst_restore_location (bfd *abfd, uquad loc);
static unsigned int dst_retrieve_location (bfd *abfd, uquad loc);
static void dst_check_allocation (bfd *abfd, unsigned int size);
static void image_dump (bfd *abfd, unsigned char *ptr, int size, int offset);
static void image_write_b (bfd *abfd, unsigned int value);
static void image_write_w (bfd *abfd, unsigned int value);
static void image_write_l (bfd *abfd, unsigned long value);
static void image_write_q (bfd *abfd, uquad value);
static bfd_boolean etir_sta (bfd *, int, unsigned char *, int *);
static bfd_boolean etir_sto (bfd *, int, unsigned char *, int *);
static bfd_boolean etir_opr (bfd *, int, unsigned char *, int *);
static bfd_boolean etir_ctl (bfd *, int, unsigned char *, int *);
static bfd_boolean etir_stc (bfd *, int, unsigned char *, int *);
static asection *new_section (bfd *, int);
static int alloc_section (bfd *, unsigned int);
static int etir_cmd (bfd *, int, unsigned char *, int *);
static int analyze_tir (bfd *, unsigned char *, unsigned int);
static int analyze_etir (bfd *, unsigned char *, unsigned int);
static unsigned char *tir_opr (bfd *, unsigned char *);
static const char *tir_cmd_name (int);
static const char *cmd_name (int);


static int
check_section (bfd * abfd, int size)
{
  bfd_size_type offset;

  offset = PRIV (image_ptr) - PRIV (image_section)->contents;
  if (offset + size > PRIV (image_section)->size)
    {
      PRIV (image_section)->contents
	= bfd_realloc_or_free (PRIV (image_section)->contents, offset + size);
      if (PRIV (image_section)->contents == NULL)
	{
	  (*_bfd_error_handler) (_("No Mem !"));
	  return -1;
	}
      PRIV (image_section)->size = offset + size;
      PRIV (image_ptr) = PRIV (image_section)->contents + offset;
    }

  return 0;
}

/* Routines to fill sections contents during tir/etir read.  */

/* Initialize image buffer pointer to be filled.  */

static void
image_set_ptr (bfd * abfd, int psect, uquad offset)
{
#if VMS_DEBUG
  _bfd_vms_debug (4, "image_set_ptr (%d=%s, %d)\n",
		  psect, PRIV (sections)[psect]->name, offset);
#endif

  PRIV (image_ptr) = PRIV (sections)[psect]->contents + offset;
  PRIV (image_section) = PRIV (sections)[psect];
}

/* Increment image buffer pointer by offset.  */

static void
image_inc_ptr (bfd * abfd, uquad offset)
{
#if VMS_DEBUG
  _bfd_vms_debug (4, "image_inc_ptr (%d)\n", offset);
#endif

  PRIV (image_ptr) += offset;
}

/* Save current DST location counter under specified index.  */

static void
dst_define_location (bfd *abfd, uquad loc)
{
  asection *dst_section = PRIV (dst_section);

#if VMS_DEBUG
  _bfd_vms_debug (4, "dst_define_location (%d)\n", (int)loc);
#endif

  /* Grow the ptr offset table if necessary.  */
  if (loc + 1 > PRIV (dst_ptr_offsets_count))
    {
      PRIV (dst_ptr_offsets) = bfd_realloc (PRIV (dst_ptr_offsets),
					   (loc + 1) * sizeof (unsigned int));
      PRIV (dst_ptr_offsets_count) = loc + 1;
    }

  PRIV (dst_ptr_offsets)[loc] = PRIV (image_ptr) - dst_section->contents;
}

/* Restore saved DST location counter from specified index.  */

static void
dst_restore_location (bfd *abfd, uquad loc)
{
  asection *dst_section = PRIV (dst_section);

#if VMS_DEBUG
  _bfd_vms_debug (4, "dst_restore_location (%d)\n", (int)loc);
#endif

  PRIV (image_ptr) = dst_section->contents + PRIV (dst_ptr_offsets)[loc];
}

/* Retrieve saved DST location counter from specified index.  */

static unsigned int
dst_retrieve_location (bfd *abfd, uquad loc)
{
#if VMS_DEBUG
  _bfd_vms_debug (4, "dst_retrieve_location (%d)\n", (int)loc);
#endif

  return PRIV (dst_ptr_offsets)[loc];
}

/* Check that the DST section is big enough for the specified
   amount of bytes.  */

static void
dst_check_allocation (bfd *abfd, unsigned int size)
{
  asection *dst_section = PRIV (dst_section);

  bfd_size_type used = PRIV (image_ptr) - dst_section->contents;
  bfd_size_type left = dst_section->size - used;

  /* Grow the DST section as necessary */
  if (size > left)
    {
      dst_section->size *= 2;
      dst_section->contents
	= bfd_realloc (dst_section->contents, dst_section->size);
      PRIV (image_ptr) = dst_section->contents + used;

      dst_check_allocation (abfd, size);
    }
}

/* Dump multiple bytes to section image.  */

static void
image_dump (bfd * abfd,
	    unsigned char *ptr,
	    int size,
	    int offset ATTRIBUTE_UNUSED)
{
#if VMS_DEBUG
  _bfd_vms_debug (8, "image_dump from (%p, %d) to (%p)\n", ptr, size,
		  PRIV (image_ptr));
  _bfd_hexdump (9, ptr, size, offset);
#endif

  if (PRIV (is_vax) && check_section (abfd, size))
    return;

  if (PRIV (dst_section))
    dst_check_allocation (abfd, size);

  while (size-- > 0)
    *PRIV (image_ptr)++ = *ptr++;
}

/* Write byte to section image.  */

static void
image_write_b (bfd * abfd, unsigned int value)
{
#if VMS_DEBUG
  _bfd_vms_debug (6, "image_write_b (%02x)\n", (int) value);
#endif

  if (PRIV (is_vax) && check_section (abfd, 1))
    return;

  if (PRIV (dst_section))
    dst_check_allocation (abfd, 1);

  *PRIV (image_ptr)++ = (value & 0xff);
}

/* Write 2-byte word to image.  */

static void
image_write_w (bfd * abfd, unsigned int value)
{
#if VMS_DEBUG
  _bfd_vms_debug (6, "image_write_w (%04x)\n", (int) value);
#endif

  if (PRIV (is_vax) && check_section (abfd, 2))
    return;

  if (PRIV (dst_section))
    dst_check_allocation (abfd, 2);

  bfd_putl16 ((bfd_vma) value, PRIV (image_ptr));
  PRIV (image_ptr) += 2;
}

/* Write 4-byte long to image.  */

static void
image_write_l (bfd * abfd, unsigned long value)
{
#if VMS_DEBUG
  _bfd_vms_debug (6, "image_write_l (%08lx)\n", value);
#endif

  if (PRIV (is_vax) && check_section (abfd, 4))
    return;

  if (PRIV (dst_section))
    dst_check_allocation (abfd, 4);

  bfd_putl32 ((bfd_vma) value, PRIV (image_ptr));
  PRIV (image_ptr) += 4;
}

/* Write 8-byte quad to image.  */

static void
image_write_q (bfd * abfd, uquad value)
{
#if VMS_DEBUG
  _bfd_vms_debug (6, "image_write_q (%016lx)\n", value);
#endif

  if (PRIV (is_vax) && check_section (abfd, 8))
    return;

  if (PRIV (dst_section))
    dst_check_allocation (abfd, 8);

  bfd_putl64 (value, PRIV (image_ptr));
  PRIV (image_ptr) += 8;
}

static const char *
cmd_name (int cmd)
{
  switch (cmd)
    {
    case ETIR_S_C_STA_GBL: return "ETIR_S_C_STA_GBL";
    case ETIR_S_C_STA_LW: return "ETIR_S_C_STA_LW";
    case ETIR_S_C_STA_QW: return "ETIR_S_C_STA_QW";
    case ETIR_S_C_STA_PQ: return "ETIR_S_C_STA_PQ";
    case ETIR_S_C_STA_LI: return "ETIR_S_C_STA_LI";
    case ETIR_S_C_STA_MOD: return "ETIR_S_C_STA_MOD";
    case ETIR_S_C_STA_CKARG: return "ETIR_S_C_STA_CKARG";
    case ETIR_S_C_STO_B: return "ETIR_S_C_STO_B";
    case ETIR_S_C_STO_W: return "ETIR_S_C_STO_W";
    case ETIR_S_C_STO_GBL: return "ETIR_S_C_STO_GBL";
    case ETIR_S_C_STO_CA: return "ETIR_S_C_STO_CA";
    case ETIR_S_C_STO_RB: return "ETIR_S_C_STO_RB";
    case ETIR_S_C_STO_AB: return "ETIR_S_C_STO_AB";
    case ETIR_S_C_STO_OFF: return "ETIR_S_C_STO_OFF";
    case ETIR_S_C_STO_IMM: return "ETIR_S_C_STO_IMM";
    case ETIR_S_C_STO_IMMR: return "ETIR_S_C_STO_IMMR";
    case ETIR_S_C_STO_LW: return "ETIR_S_C_STO_LW";
    case ETIR_S_C_STO_QW: return "ETIR_S_C_STO_QW";
    case ETIR_S_C_STO_GBL_LW: return "ETIR_S_C_STO_GBL_LW";
    case ETIR_S_C_STO_LP_PSB: return "ETIR_S_C_STO_LP_PSB";
    case ETIR_S_C_STO_HINT_GBL: return "ETIR_S_C_STO_HINT_GBL";
    case ETIR_S_C_STO_HINT_PS: return "ETIR_S_C_STO_HINT_PS";
    case ETIR_S_C_OPR_ADD: return "ETIR_S_C_OPR_ADD";
    case ETIR_S_C_OPR_INSV: return "ETIR_S_C_OPR_INSV";
    case ETIR_S_C_OPR_USH: return "ETIR_S_C_OPR_USH";
    case ETIR_S_C_OPR_ROT: return "ETIR_S_C_OPR_ROT";
    case ETIR_S_C_OPR_REDEF: return "ETIR_S_C_OPR_REDEF";
    case ETIR_S_C_OPR_DFLIT: return "ETIR_S_C_OPR_DFLIT";
    case ETIR_S_C_STC_LP: return "ETIR_S_C_STC_LP";
    case ETIR_S_C_STC_GBL: return "ETIR_S_C_STC_GBL";
    case ETIR_S_C_STC_GCA: return "ETIR_S_C_STC_GCA";
    case ETIR_S_C_STC_PS: return "ETIR_S_C_STC_PS";
    case ETIR_S_C_STC_NBH_PS: return "ETIR_S_C_STC_NBH_PS";
    case ETIR_S_C_STC_NOP_GBL: return "ETIR_S_C_STC_NOP_GBL";
    case ETIR_S_C_STC_NOP_PS: return "ETIR_S_C_STC_NOP_PS";
    case ETIR_S_C_STC_BSR_GBL: return "ETIR_S_C_STC_BSR_GBL";
    case ETIR_S_C_STC_BSR_PS: return "ETIR_S_C_STC_BSR_PS";
    case ETIR_S_C_STC_LDA_GBL: return "ETIR_S_C_STC_LDA_GBL";
    case ETIR_S_C_STC_LDA_PS: return "ETIR_S_C_STC_LDA_PS";
    case ETIR_S_C_STC_BOH_GBL: return "ETIR_S_C_STC_BOH_GBL";
    case ETIR_S_C_STC_BOH_PS: return "ETIR_S_C_STC_BOH_PS";
    case ETIR_S_C_STC_NBH_GBL: return "ETIR_S_C_STC_NBH_GBL";
    case ETIR_S_C_CTL_SETRB: return "ETIR_S_C_CTL_SETRB";
    case ETIR_S_C_STC_LP_PSB: return "ETIR_S_C_STC_LP_PSB";
    case ETIR_S_C_CTL_DFLOC: return "ETIR_S_C_CTL_DFLOC";
    case ETIR_S_C_CTL_STLOC: return "ETIR_S_C_CTL_STLOC";
    case ETIR_S_C_CTL_STKDL: return "ETIR_S_C_CTL_STKDL";

    default:
      /* These names have not yet been added to this switch statement.  */
      (*_bfd_error_handler) (_("unknown ETIR command %d"), cmd);
    }

  return NULL;
}
#define HIGHBIT(op) ((op & 0x80000000L) == 0x80000000L)

/* etir_sta

   Vms stack commands.

   Handle sta_xxx commands in etir section,
   ptr points to data area in record.

   See table B-8 of the openVMS linker manual.  */

static bfd_boolean
etir_sta (bfd *abfd, int cmd, unsigned char *ptr, int *quarter_relocs)
{
#if VMS_DEBUG
  _bfd_vms_debug (5, "etir_sta %d/%x\n", cmd, cmd);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  switch (cmd)
    {
      /* Stack global
	 arg: cs	symbol name

	 stack 32 bit value of symbol (high bits set to 0).  */
    case ETIR_S_C_STA_GBL:
      {
	char *name;
	vms_symbol_entry *entry;

	name = _bfd_vms_save_counted_string (ptr);
	entry = (vms_symbol_entry *)
	  bfd_hash_lookup (PRIV (vms_symbol_table), name, FALSE, FALSE);
	if (entry == NULL)
	  {
#if VMS_DEBUG
	    _bfd_vms_debug (3, "%s: no symbol \"%s\"\n",
			    cmd_name (cmd), name);
#endif
	    _bfd_vms_push (abfd, (uquad) 0, -1);
	  }
	else
	  _bfd_vms_push (abfd, (uquad) (entry->symbol->value), -1);
      }
      *quarter_relocs = 1;
      break;

      /* Stack longword
	 arg: lw	value

	 stack 32 bit value, sign extend to 64 bit.  */
    case ETIR_S_C_STA_LW:
      _bfd_vms_push (abfd, (uquad) bfd_getl32 (ptr), -1);
      /* This one is special as it is both part of the section header
         and of the ALPHA_R_REFLONG relocation.  */
      if (bfd_getl16 (ptr - 4 + bfd_getl16 (ptr - 2)) == ETIR_S_C_CTL_DFLOC)
	*quarter_relocs = 0;
      else if (*quarter_relocs)
	*quarter_relocs += 1;
      else
	*quarter_relocs = 2;
      break;

      /* Stack quadword
	 arg: qw	value

	 stack 64 bit value of symbol.  */
    case ETIR_S_C_STA_QW:
      _bfd_vms_push (abfd, (uquad) bfd_getl64 (ptr), -1);
      if (*quarter_relocs)
	*quarter_relocs += 1;
      else
	*quarter_relocs = 2;
      break;

      /* Stack psect base plus quadword offset
	 arg: lw	section index
	 qw	signed quadword offset (low 32 bits)

	 Stack qw argument and section index
	 (see ETIR_S_C_STO_OFF, ETIR_S_C_CTL_SETRB).  */
    case ETIR_S_C_STA_PQ:
      {
	uquad dummy;
	int psect;

	psect = bfd_getl32 (ptr);
	if ((unsigned int) psect >= PRIV (section_count))
	  {
	    (*_bfd_error_handler) (_("bad section index in %s"),
				   cmd_name (cmd));
	    bfd_set_error (bfd_error_bad_value);
	    return FALSE;
	  }
	dummy = bfd_getl64 (ptr + 4);
	_bfd_vms_push (abfd, dummy, (int) psect);
      }
      /* This one is special as it is both part of the section header
         and of the ALPHA_R_REFLONG and ALPHA_R_REFQUAD relocations.  */
      if (bfd_getl16 (ptr - 4 + bfd_getl16 (ptr - 2)) == ETIR_S_C_CTL_SETRB)
	*quarter_relocs = 0;
      else
	*quarter_relocs = 2;
      break;

    case ETIR_S_C_STA_LI:
    case ETIR_S_C_STA_MOD:
    case ETIR_S_C_STA_CKARG:
      (*_bfd_error_handler) (_("unsupported STA cmd %s"), cmd_name (cmd));
      *quarter_relocs = 0;
      return FALSE;

    default:
      (*_bfd_error_handler) (_("reserved STA cmd %d"), cmd);
      *quarter_relocs = 0;
      return FALSE;
    }

#if VMS_DEBUG
  _bfd_vms_debug (5, "etir_sta true\n");
#endif

  return TRUE;
}

/* etir_sto

   vms store commands

   handle sto_xxx commands in etir section
   ptr points to data area in record

   see table B-9 of the openVMS linker manual.  */

static bfd_boolean
etir_sto (bfd *abfd, int cmd, unsigned char *ptr, int *quarter_relocs)
{
  uquad dummy;
  int psect;

#if VMS_DEBUG
  _bfd_vms_debug (5, "etir_sto %d/%x\n", cmd, cmd);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  switch (cmd)
    {
      /* Store byte: pop stack, write byte
	 arg: -.  */
    case ETIR_S_C_STO_B:
      dummy = _bfd_vms_pop (abfd, &psect);
      /* FIXME: check top bits.  */
      image_write_b (abfd, (unsigned int) dummy & 0xff);
      *quarter_relocs = 0;
      break;

      /* Store word: pop stack, write word
	 arg: -.  */
    case ETIR_S_C_STO_W:
      dummy = _bfd_vms_pop (abfd, &psect);
      /* FIXME: check top bits */
      image_write_w (abfd, (unsigned int) dummy & 0xffff);
      *quarter_relocs = 0;
      break;

      /* Store longword: pop stack, write longword
	 arg: -.  */
    case ETIR_S_C_STO_LW:
      dummy = _bfd_vms_pop (abfd, &psect);
      dummy += (PRIV (sections)[psect])->vma;
      /* FIXME: check top bits.  */
      image_write_l (abfd, (unsigned int) dummy & 0xffffffff);
      if (*quarter_relocs == 2)
	*quarter_relocs = 4;
      else
	*quarter_relocs += 1;
      break;

      /* Store quadword: pop stack, write quadword
	 arg: -.  */
    case ETIR_S_C_STO_QW:
      dummy = _bfd_vms_pop (abfd, &psect);
      dummy += (PRIV (sections)[psect])->vma;
      /* FIXME: check top bits.  */
      image_write_q (abfd, dummy);
      if (*quarter_relocs == 2)
	*quarter_relocs = 4;
      else
	*quarter_relocs += 1;
      break;

      /* Store immediate repeated: pop stack for repeat count
	 arg: lw	byte count
	 da	data.  */
    case ETIR_S_C_STO_IMMR:
      {
	int size;

	size = bfd_getl32 (ptr);
	dummy = (unsigned long) _bfd_vms_pop (abfd, NULL);
	while (dummy-- > 0)
	  image_dump (abfd, ptr+4, size, 0);
      }
      *quarter_relocs = 0;
      break;

      /* Store global: write symbol value
	 arg: cs	global symbol name.  */
    case ETIR_S_C_STO_GBL:
      {
	vms_symbol_entry *entry;
	char *name;

	name = _bfd_vms_save_counted_string (ptr);
	entry = (vms_symbol_entry *) bfd_hash_lookup (PRIV (vms_symbol_table),
						      name, FALSE, FALSE);
	if (entry == NULL)
	  /* FIXME, reloc.  */
	  image_write_q (abfd, (uquad) (0));
	else
	  /* FIXME, reloc.  */
	  image_write_q (abfd, (uquad) (entry->symbol->value));
      }
      *quarter_relocs = 4;
      break;

      /* Store code address: write address of entry point
	 arg: cs	global symbol name (procedure).  */
    case ETIR_S_C_STO_CA:
      {
	vms_symbol_entry *entry;
	char *name;

	name = _bfd_vms_save_counted_string (ptr);
	entry = (vms_symbol_entry *) bfd_hash_lookup (PRIV (vms_symbol_table),
						      name, FALSE, FALSE);
	if (entry == NULL)
	  /* FIXME, reloc.  */
	  image_write_q (abfd, (uquad) (0));
	else
	  /* FIXME, reloc.  */
	  image_write_q (abfd, (uquad) (entry->symbol->value));
      }
      *quarter_relocs = 4;
      break;

      /* Store offset to psect: pop stack, add low 32 bits to base of psect
	 arg: none.  */
    case ETIR_S_C_STO_OFF:
      {
	uquad q;
	int psect1;

	q = _bfd_vms_pop (abfd, & psect1);
	q += (PRIV (sections)[psect1])->vma;
	image_write_q (abfd, q);
      }
      *quarter_relocs += 2;
      break;

      /* Store immediate
	 arg: lw	count of bytes
	      da	data.  */
    case ETIR_S_C_STO_IMM:
      {
	int size;

	size = bfd_getl32 (ptr);
	image_dump (abfd, ptr+4, size, 0);
      }
      *quarter_relocs = 0;
      break;

      /* This code is 'reserved to digital' according to the openVMS
	 linker manual, however it is generated by the DEC C compiler
	 and defined in the include file.
	 FIXME, since the following is just a guess
	 store global longword: store 32bit value of symbol
	 arg: cs	symbol name.  */
    case ETIR_S_C_STO_GBL_LW:
      {
	vms_symbol_entry *entry;
	char *name;

	name = _bfd_vms_save_counted_string (ptr);
	entry = (vms_symbol_entry *) bfd_hash_lookup (PRIV (vms_symbol_table),
						      name, FALSE, FALSE);
	if (entry == NULL)
	  {
#if VMS_DEBUG
	    _bfd_vms_debug (3, "%s: no symbol \"%s\"\n", cmd_name (cmd), name);
#endif
	    image_write_l (abfd, (unsigned long) 0);	/* FIXME, reloc */
	  }
	else
	  /* FIXME, reloc.  */
	  image_write_l (abfd, (unsigned long) (entry->symbol->value));
      }
      *quarter_relocs = 4;
      break;

    case ETIR_S_C_STO_RB:
    case ETIR_S_C_STO_AB:
    case ETIR_S_C_STO_LP_PSB:
      (*_bfd_error_handler) (_("%s: not supported"), cmd_name (cmd));
      *quarter_relocs = 0;
      return FALSE;

    case ETIR_S_C_STO_HINT_GBL:
    case ETIR_S_C_STO_HINT_PS:
      (*_bfd_error_handler) (_("%s: not implemented"), cmd_name (cmd));
      *quarter_relocs = 0;
      return FALSE;

    default:
      (*_bfd_error_handler) (_("reserved STO cmd %d"), cmd);
      *quarter_relocs = 0;
      return FALSE;
    }

  return TRUE;
}

/* Stack operator commands
   all 32 bit signed arithmetic
   all word just like a stack calculator
   arguments are popped from stack, results are pushed on stack

   see table B-10 of the openVMS linker manual.  */

static bfd_boolean
etir_opr (bfd *abfd, int cmd, unsigned char *ptr ATTRIBUTE_UNUSED,
	  int *quarter_relocs)
{
  long op1, op2;

#if VMS_DEBUG
  _bfd_vms_debug (5, "etir_opr %d/%x\n", cmd, cmd);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  /* No relocation uses OPR commands except ETIR_S_C_OPR_ADD.  */
  if (cmd == ETIR_S_C_OPR_ADD)
    *quarter_relocs += 1;
  else
    *quarter_relocs = 0;

  switch (cmd)
    {
    case ETIR_S_C_OPR_NOP:      /* No-op.  */
      break;

    case ETIR_S_C_OPR_ADD:      /* Add.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 + op2), -1);
      break;

    case ETIR_S_C_OPR_SUB:      /* Subtract.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op2 - op1), -1);
      break;

    case ETIR_S_C_OPR_MUL:      /* Multiply.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 * op2), -1);
      break;

    case ETIR_S_C_OPR_DIV:      /* Divide.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      if (op2 == 0)
	_bfd_vms_push (abfd, (uquad) 0, -1);
      else
	_bfd_vms_push (abfd, (uquad) (op2 / op1), -1);
      break;

    case ETIR_S_C_OPR_AND:      /* Logical AND.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 & op2), -1);
      break;

    case ETIR_S_C_OPR_IOR:      /* Logical inclusive OR.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 | op2), -1);
      break;

    case ETIR_S_C_OPR_EOR:      /* Logical exclusive OR.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 ^ op2), -1);
      break;

    case ETIR_S_C_OPR_NEG:      /* Negate.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (-op1), -1);
      break;

    case ETIR_S_C_OPR_COM:      /* Complement.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 ^ -1L), -1);
      break;

    case ETIR_S_C_OPR_ASH:      /* Arithmetic shift.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      if (op2 < 0)		/* Shift right.  */
	op1 >>= -op2;
      else			/* Shift left.  */
	op1 <<= op2;
      _bfd_vms_push (abfd, (uquad) op1, -1);
      break;

    case ETIR_S_C_OPR_INSV:      /* Insert field.   */
      (void) _bfd_vms_pop (abfd, NULL);
    case ETIR_S_C_OPR_USH:       /* Unsigned shift.   */
    case ETIR_S_C_OPR_ROT:       /* Rotate.  */
    case ETIR_S_C_OPR_REDEF:     /* Redefine symbol to current location.  */
    case ETIR_S_C_OPR_DFLIT:     /* Define a literal.  */
      (*_bfd_error_handler) (_("%s: not supported"), cmd_name (cmd));
      return FALSE;

    case ETIR_S_C_OPR_SEL:      /* Select.  */
      if ((long) _bfd_vms_pop (abfd, NULL) & 0x01L)
	(void) _bfd_vms_pop (abfd, NULL);
      else
	{
	  op1 = (long) _bfd_vms_pop (abfd, NULL);
	  (void) _bfd_vms_pop (abfd, NULL);
	  _bfd_vms_push (abfd, (uquad) op1, -1);
	}
      break;

    default:
      (*_bfd_error_handler) (_("reserved OPR cmd %d"), cmd);
      return FALSE;
    }

  return TRUE;
}

/* Control commands.

   See table B-11 of the openVMS linker manual.  */

static bfd_boolean
etir_ctl (bfd *abfd, int cmd, unsigned char *ptr, int *quarter_relocs)
{
  uquad dummy;
  int psect;

#if VMS_DEBUG
  _bfd_vms_debug (5, "etir_ctl %d/%x\n", cmd, cmd);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  /* No relocation uses CTL commands.  */
  *quarter_relocs = 0;

  switch (cmd)
    {
      /* Det relocation base: pop stack, set image location counter
	 arg: none.  */
    case ETIR_S_C_CTL_SETRB:
      dummy = _bfd_vms_pop (abfd, &psect);
      image_set_ptr (abfd, psect, dummy);
      break;

      /* Augment relocation base: increment image location counter by offset
	 arg: lw	offset value.  */
    case ETIR_S_C_CTL_AUGRB:
      dummy = bfd_getl32 (ptr);
      image_inc_ptr (abfd, dummy);
      break;

      /* Define location: pop index, save location counter under index
	 arg: none.  */
    case ETIR_S_C_CTL_DFLOC:
      dummy = _bfd_vms_pop (abfd, NULL);
      dst_define_location (abfd, dummy);
      break;

      /* Set location: pop index, restore location counter from index
	 arg: none.  */
    case ETIR_S_C_CTL_STLOC:
      dummy = _bfd_vms_pop (abfd, NULL);
      dst_restore_location (abfd, dummy);
      break;

      /* Stack defined location: pop index, push location counter from index
	 arg: none.  */
    case ETIR_S_C_CTL_STKDL:
      dummy = _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, dst_retrieve_location (abfd, dummy), -1);
      break;

    default:
      (*_bfd_error_handler) (_("reserved CTL cmd %d"), cmd);
      return FALSE;
    }

  return TRUE;
}

/* Store conditional commands

   See table B-12 and B-13 of the openVMS linker manual.  */

static bfd_boolean
etir_stc (bfd *abfd, int cmd, unsigned char *ptr ATTRIBUTE_UNUSED,
	  int *quarter_relocs)
{
#if VMS_DEBUG
  _bfd_vms_debug (5, "etir_stc %d/%x\n", cmd, cmd);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  switch (cmd)
    {
      /* 200 Store-conditional Linkage Pair
	 arg: none.  */
    case ETIR_S_C_STC_LP:

      /* 202 Store-conditional Address at global address
	 arg:	lw	linkage index
		cs	global name.  */

    case ETIR_S_C_STC_GBL:

      /* 203 Store-conditional Code Address at global address
	 arg:	lw	linkage index
		cs	procedure name.  */
    case ETIR_S_C_STC_GCA:

      /* 204 Store-conditional Address at psect + offset
	 arg:	lw	linkage index
		lw	psect index
		qw	offset.  */
    case ETIR_S_C_STC_PS:
      (*_bfd_error_handler) (_("%s: not supported"), cmd_name (cmd));
      *quarter_relocs = 0;
      return FALSE;

      /* 201 Store-conditional Linkage Pair with Procedure Signature
	 arg:	lw	linkage index
		cs	procedure name
		by	signature length
		da	signature.  */

    case ETIR_S_C_STC_LP_PSB:
      image_inc_ptr (abfd, (uquad) 16);	/* skip entry,procval */
      *quarter_relocs = 4;
      break;

      /* 205 Store-conditional NOP at address of global
	 arg: none.  */
    case ETIR_S_C_STC_NOP_GBL:
      /* ALPHA_R_NOP */

      /* 207 Store-conditional BSR at global address
	 arg: none.  */

    case ETIR_S_C_STC_BSR_GBL:
      /* ALPHA_R_BSR */

      /* 209 Store-conditional LDA at global address
	 arg: none.  */

    case ETIR_S_C_STC_LDA_GBL:
      /* ALPHA_R_LDA */

      /* 211 Store-conditional BSR or Hint at global address
	 arg: none.  */

    case ETIR_S_C_STC_BOH_GBL:
      *quarter_relocs = 4;
      break;

      /* 213 Store-conditional NOP,BSR or HINT at global address
	 arg: none.  */

    case ETIR_S_C_STC_NBH_GBL:

      /* 206 Store-conditional NOP at pect + offset
	 arg: none.  */

    case ETIR_S_C_STC_NOP_PS:

      /* 208 Store-conditional BSR at pect + offset
	 arg: none.  */

    case ETIR_S_C_STC_BSR_PS:

      /* 210 Store-conditional LDA at psect + offset
	 arg: none.  */

    case ETIR_S_C_STC_LDA_PS:

      /* 212 Store-conditional BSR or Hint at pect + offset
	 arg: none.  */

    case ETIR_S_C_STC_BOH_PS:

      /* 214 Store-conditional NOP, BSR or HINT at psect + offset
	 arg: none.  */
    case ETIR_S_C_STC_NBH_PS:
      (*_bfd_error_handler) ("%s: not supported", cmd_name (cmd));
      *quarter_relocs = 0;
      return FALSE;

    default:
      (*_bfd_error_handler) (_("reserved STC cmd %d"), cmd);
      *quarter_relocs = 0;
      return FALSE;
    }

  return TRUE;
}

static asection *
new_section (bfd * abfd ATTRIBUTE_UNUSED, int idx)
{
  asection *section;
  char sname[16];
  char *name;

#if VMS_DEBUG
  _bfd_vms_debug (5, "new_section %d\n", idx);
#endif
  sprintf (sname, SECTION_NAME_TEMPLATE, idx);

  name = bfd_malloc ((bfd_size_type) strlen (sname) + 1);
  if (name == 0)
    return NULL;
  strcpy (name, sname);

  section = bfd_malloc ((bfd_size_type) sizeof (asection));
  if (section == 0)
    {
#if VMS_DEBUG
      _bfd_vms_debug (6,  "new_section (%s) failed", name);
#endif
      return NULL;
    }

  section->size = 0;
  section->vma = 0;
  section->contents = 0;
  section->name = name;
  section->index = idx;

  return section;
}

static int
alloc_section (bfd * abfd, unsigned int idx)
{
  bfd_size_type amt;

#if VMS_DEBUG
  _bfd_vms_debug (4, "alloc_section %d\n", idx);
#endif

  amt = idx + 1;
  amt *= sizeof (asection *);
  PRIV (sections) = bfd_realloc_or_free (PRIV (sections), amt);
  if (PRIV (sections) == NULL)
    return -1;

  while (PRIV (section_count) <= idx)
    {
      PRIV (sections)[PRIV (section_count)]
	= new_section (abfd, (int) PRIV (section_count));
      if (PRIV (sections)[PRIV (section_count)] == 0)
	return -1;
      PRIV (section_count)++;
    }

  return 0;
}

/* tir_sta

   Vax stack commands.

   Handle sta_xxx commands in tir section,
   ptr points to data area in record.

   See table 7-3 of the VAX/VMS linker manual.  */

static unsigned char *
tir_sta (bfd * abfd, unsigned char *ptr)
{
  int cmd = *ptr++;

#if VMS_DEBUG
  _bfd_vms_debug (5, "tir_sta %d\n", cmd);
#endif

  switch (cmd)
    {
      /* stack */
    case TIR_S_C_STA_GBL:
      /* stack global
	 arg: cs	symbol name

	 stack 32 bit value of symbol (high bits set to 0).  */
      {
	char *name;
	vms_symbol_entry *entry;

	name = _bfd_vms_save_counted_string (ptr);

	entry = _bfd_vms_enter_symbol (abfd, name);
	if (entry == NULL)
	  return NULL;

	_bfd_vms_push (abfd, (uquad) (entry->symbol->value), -1);
	ptr += *ptr + 1;
      }
      break;

    case TIR_S_C_STA_SB:
      /* stack signed byte
	 arg: by	value

	 stack byte value, sign extend to 32 bit.  */
      _bfd_vms_push (abfd, (uquad) *ptr++, -1);
      break;

    case TIR_S_C_STA_SW:
      /* stack signed short word
	 arg: sh	value

	 stack 16 bit value, sign extend to 32 bit.  */
      _bfd_vms_push (abfd, (uquad) bfd_getl16 (ptr), -1);
      ptr += 2;
      break;

    case TIR_S_C_STA_LW:
      /* stack signed longword
	 arg: lw	value

	 stack 32 bit value.  */
      _bfd_vms_push (abfd, (uquad) bfd_getl32 (ptr), -1);
      ptr += 4;
      break;

    case TIR_S_C_STA_PB:
    case TIR_S_C_STA_WPB:
      /* stack psect base plus byte offset (word index)
	 arg: by	section index
		(sh	section index)
		by	signed byte offset.  */
      {
	unsigned long dummy;
	int psect;

	if (cmd == TIR_S_C_STA_PB)
	  psect = *ptr++;
	else
	  {
	    psect = bfd_getl16 (ptr);
	    ptr += 2;
	  }

	if ((unsigned int) psect >= PRIV (section_count))
	  alloc_section (abfd, psect);

	dummy = (long) *ptr++;
	dummy += (PRIV (sections)[psect])->vma;
	_bfd_vms_push (abfd, (uquad) dummy, psect);
      }
      break;

    case TIR_S_C_STA_PW:
    case TIR_S_C_STA_WPW:
      /* stack psect base plus word offset (word index)
	 arg: by	section index
		(sh	section index)
		sh	signed short offset.  */
      {
	unsigned long dummy;
	int psect;

	if (cmd == TIR_S_C_STA_PW)
	  psect = *ptr++;
	else
	  {
	    psect = bfd_getl16 (ptr);
	    ptr += 2;
	  }

	if ((unsigned int) psect >= PRIV (section_count))
	  alloc_section (abfd, psect);

	dummy = bfd_getl16 (ptr); ptr+=2;
	dummy += (PRIV (sections)[psect])->vma;
	_bfd_vms_push (abfd, (uquad) dummy, psect);
      }
      break;

    case TIR_S_C_STA_PL:
    case TIR_S_C_STA_WPL:
      /* stack psect base plus long offset (word index)
	 arg: by	section index
		(sh	section index)
		lw	signed longword offset.	 */
      {
	unsigned long dummy;
	int psect;

	if (cmd == TIR_S_C_STA_PL)
	  psect = *ptr++;
	else
	  {
	    psect = bfd_getl16 (ptr);
	    ptr += 2;
	  }

	if ((unsigned int) psect >= PRIV (section_count))
	  alloc_section (abfd, psect);

	dummy = bfd_getl32 (ptr); ptr += 4;
	dummy += (PRIV (sections)[psect])->vma;
	_bfd_vms_push (abfd, (uquad) dummy, psect);
      }
      break;

    case TIR_S_C_STA_UB:
      /* stack unsigned byte
	 arg: by	value

	 stack byte value.  */
      _bfd_vms_push (abfd, (uquad) *ptr++, -1);
      break;

    case TIR_S_C_STA_UW:
      /* stack unsigned short word
	 arg: sh	value

	 stack 16 bit value.  */
      _bfd_vms_push (abfd, (uquad) bfd_getl16 (ptr), -1);
      ptr += 2;
      break;

    case TIR_S_C_STA_BFI:
      /* stack byte from image
	 arg: none.  */
      /* FALLTHRU  */
    case TIR_S_C_STA_WFI:
      /* stack byte from image
	 arg: none.  */
      /* FALLTHRU */
    case TIR_S_C_STA_LFI:
      /* stack byte from image
	 arg: none.  */
      (*_bfd_error_handler) (_("stack-from-image not implemented"));
      return NULL;

    case TIR_S_C_STA_EPM:
      /* stack entry point mask
	 arg: cs	symbol name

	 stack (unsigned) entry point mask of symbol
	 err if symbol is no entry point.  */
      {
	char *name;
	vms_symbol_entry *entry;

	name = _bfd_vms_save_counted_string (ptr);
	entry = _bfd_vms_enter_symbol (abfd, name);
	if (entry == NULL)
	  return NULL;

	(*_bfd_error_handler) (_("stack-entry-mask not fully implemented"));
	_bfd_vms_push (abfd, (uquad) 0, -1);
	ptr += *ptr + 1;
      }
      break;

    case TIR_S_C_STA_CKARG:
      /* compare procedure argument
	 arg: cs	symbol name
		by	argument index
		da	argument descriptor

	 compare argument descriptor with symbol argument (ARG$V_PASSMECH)
	 and stack TRUE (args match) or FALSE (args dont match) value.  */
      (*_bfd_error_handler) (_("PASSMECH not fully implemented"));
      _bfd_vms_push (abfd, (uquad) 1, -1);
      break;

    case TIR_S_C_STA_LSY:
      /* stack local symbol value
	 arg:	sh	environment index
		cs	symbol name.  */
      {
	int envidx;
	char *name;
	vms_symbol_entry *entry;

	envidx = bfd_getl16 (ptr);
	ptr += 2;
	name = _bfd_vms_save_counted_string (ptr);
	entry = _bfd_vms_enter_symbol (abfd, name);
	if (entry == NULL)
	  return NULL;
	(*_bfd_error_handler) (_("stack-local-symbol not fully implemented"));
	_bfd_vms_push (abfd, (uquad) 0, -1);
	ptr += *ptr + 1;
      }
      break;

    case TIR_S_C_STA_LIT:
      /* stack literal
	 arg:	by	literal index

	 stack literal.  */
      ptr++;
      _bfd_vms_push (abfd, (uquad) 0, -1);
      (*_bfd_error_handler) (_("stack-literal not fully implemented"));
      break;

    case TIR_S_C_STA_LEPM:
      /* stack local symbol entry point mask
	 arg:	sh	environment index
		cs	symbol name

	 stack (unsigned) entry point mask of symbol
	 err if symbol is no entry point.  */
      {
	int envidx;
	char *name;
	vms_symbol_entry *entry;

	envidx = bfd_getl16 (ptr);
	ptr += 2;
	name = _bfd_vms_save_counted_string (ptr);
	entry = _bfd_vms_enter_symbol (abfd, name);
	if (entry == NULL)
	  return NULL;
	(*_bfd_error_handler) (_("stack-local-symbol-entry-point-mask not fully implemented"));
	_bfd_vms_push (abfd, (uquad) 0, -1);
	ptr += *ptr + 1;
      }
      break;

    default:
      (*_bfd_error_handler) (_("reserved STA cmd %d"), ptr[-1]);
      return NULL;
      break;
    }

  return ptr;
}

static const char *
tir_cmd_name (int cmd)
{
  switch (cmd)
    {
    case TIR_S_C_STO_RSB: return "TIR_S_C_STO_RSB";
    case TIR_S_C_STO_RSW: return "TIR_S_C_STO_RSW";
    case TIR_S_C_STO_RL: return "TIR_S_C_STO_RL";
    case TIR_S_C_STO_VPS: return "TIR_S_C_STO_VPS";
    case TIR_S_C_STO_USB: return "TIR_S_C_STO_USB";
    case TIR_S_C_STO_USW: return "TIR_S_C_STO_USW";
    case TIR_S_C_STO_RUB: return "TIR_S_C_STO_RUB";
    case TIR_S_C_STO_RUW: return "TIR_S_C_STO_RUW";
    case TIR_S_C_STO_PIRR: return "TIR_S_C_STO_PIRR";
    case TIR_S_C_OPR_INSV: return "TIR_S_C_OPR_INSV";
    case TIR_S_C_OPR_DFLIT: return "TIR_S_C_OPR_DFLIT";
    case TIR_S_C_OPR_REDEF: return "TIR_S_C_OPR_REDEF";
    case TIR_S_C_OPR_ROT: return "TIR_S_C_OPR_ROT";
    case TIR_S_C_OPR_USH: return "TIR_S_C_OPR_USH";
    case TIR_S_C_OPR_ASH: return "TIR_S_C_OPR_ASH";
    case TIR_S_C_CTL_DFLOC: return "TIR_S_C_CTL_DFLOC";
    case TIR_S_C_CTL_STLOC: return "TIR_S_C_CTL_STLOC";
    case TIR_S_C_CTL_STKDL: return "TIR_S_C_CTL_STKDL";

    default:
      /* These strings have not been added yet.  */
      abort ();
    }
}

/* tir_sto

   vax store commands

   handle sto_xxx commands in tir section
   ptr points to data area in record

   See table 7-4 of the VAX/VMS linker manual.  */

static unsigned char *
tir_sto (bfd * abfd, unsigned char *ptr)
{
  unsigned long dummy;
  int size;
  int psect;

#if VMS_DEBUG
  _bfd_vms_debug (5, "tir_sto %d\n", *ptr);
#endif

  switch (*ptr++)
    {
    case TIR_S_C_STO_SB:
      /* Store signed byte: pop stack, write byte
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      image_write_b (abfd, dummy & 0xff);	/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_SW:
      /* Store signed word: pop stack, write word
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      image_write_w (abfd, dummy & 0xffff);	/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_LW:
      /* Store longword: pop stack, write longword
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      image_write_l (abfd, dummy & 0xffffffff);	/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_BD:
      /* Store byte displaced: pop stack, sub lc+1, write byte
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      dummy -= ((PRIV (sections)[psect])->vma + 1);
      image_write_b (abfd, dummy & 0xff);/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_WD:
      /* Store word displaced: pop stack, sub lc+2, write word
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      dummy -= ((PRIV (sections)[psect])->vma + 2);
      image_write_w (abfd, dummy & 0xffff);/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_LD:
      /* Store long displaced: pop stack, sub lc+4, write long
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      dummy -= ((PRIV (sections)[psect])->vma + 4);
      image_write_l (abfd, dummy & 0xffffffff);/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_LI:
      /* Store short literal: pop stack, write byte
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      image_write_b (abfd, dummy & 0xff);/* FIXME: check top bits */
      break;

    case TIR_S_C_STO_PIDR:
      /* Store position independent data reference: pop stack, write longword
	 arg: none.
	 FIXME: incomplete !  */
      dummy = _bfd_vms_pop (abfd, &psect);
      image_write_l (abfd, dummy & 0xffffffff);
      break;

    case TIR_S_C_STO_PICR:
      /* Store position independent code reference: pop stack, write longword
	 arg: none.
	 FIXME: incomplete !  */
      dummy = _bfd_vms_pop (abfd, &psect);
      image_write_b (abfd, 0x9f);
      image_write_l (abfd, dummy & 0xffffffff);
      break;

    case TIR_S_C_STO_RIVB:
      /* Store repeated immediate variable bytes
	 1-byte count n field followed by n bytes of data
	 pop stack, write n bytes <stack> times.  */
      size = *ptr++;
      dummy = (unsigned long) _bfd_vms_pop (abfd, NULL);
      while (dummy-- > 0L)
	image_dump (abfd, ptr, size, 0);
      ptr += size;
      break;

    case TIR_S_C_STO_B:
      /* Store byte from top longword.  */
      dummy = (unsigned long) _bfd_vms_pop (abfd, NULL);
      image_write_b (abfd, dummy & 0xff);
      break;

    case TIR_S_C_STO_W:
      /* Store word from top longword.  */
      dummy = (unsigned long) _bfd_vms_pop (abfd, NULL);
      image_write_w (abfd, dummy & 0xffff);
      break;

    case TIR_S_C_STO_RB:
      /* Store repeated byte from top longword.  */
      size = (unsigned long) _bfd_vms_pop (abfd, NULL);
      dummy = (unsigned long) _bfd_vms_pop (abfd, NULL);
      while (size-- > 0)
	image_write_b (abfd, dummy & 0xff);
      break;

    case TIR_S_C_STO_RW:
      /* Store repeated word from top longword.  */
      size = (unsigned long) _bfd_vms_pop (abfd, NULL);
      dummy = (unsigned long) _bfd_vms_pop (abfd, NULL);
      while (size-- > 0)
	image_write_w (abfd, dummy & 0xffff);
      break;

    case TIR_S_C_STO_RSB:
    case TIR_S_C_STO_RSW:
    case TIR_S_C_STO_RL:
    case TIR_S_C_STO_VPS:
    case TIR_S_C_STO_USB:
    case TIR_S_C_STO_USW:
    case TIR_S_C_STO_RUB:
    case TIR_S_C_STO_RUW:
    case TIR_S_C_STO_PIRR:
      (*_bfd_error_handler) (_("%s: not implemented"), tir_cmd_name (ptr[-1]));
      break;

    default:
      (*_bfd_error_handler) (_("reserved STO cmd %d"), ptr[-1]);
      break;
    }

  return ptr;
}

/* Stack operator commands
   All 32 bit signed arithmetic
   All word just like a stack calculator
   Arguments are popped from stack, results are pushed on stack

   See table 7-5 of the VAX/VMS linker manual.  */

static unsigned char *
tir_opr (bfd * abfd, unsigned char *ptr)
{
  long op1, op2;

#if VMS_DEBUG
  _bfd_vms_debug (5, "tir_opr %d\n", *ptr);
#endif

  /* Operation.  */
  switch (*ptr++)
    {
    case TIR_S_C_OPR_NOP: /* No-op.  */
      break;

    case TIR_S_C_OPR_ADD: /* Add.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 + op2), -1);
      break;

    case TIR_S_C_OPR_SUB: /* Subtract.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op2 - op1), -1);
      break;

    case TIR_S_C_OPR_MUL: /* Multiply.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 * op2), -1);
      break;

    case TIR_S_C_OPR_DIV: /* Divide.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      if (op2 == 0)
	_bfd_vms_push (abfd, (uquad) 0, -1);
      else
	_bfd_vms_push (abfd, (uquad) (op2 / op1), -1);
      break;

    case TIR_S_C_OPR_AND: /* Logical AND.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 & op2), -1);
      break;

    case TIR_S_C_OPR_IOR: /* Logical inclusive OR.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 | op2), -1);
      break;

    case TIR_S_C_OPR_EOR: /* Logical exclusive OR.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 ^ op2), -1);
      break;

    case TIR_S_C_OPR_NEG: /* Negate.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (-op1), -1);
      break;

    case TIR_S_C_OPR_COM: /* Complement.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      _bfd_vms_push (abfd, (uquad) (op1 ^ -1L), -1);
      break;

    case TIR_S_C_OPR_INSV: /* Insert field.  */
      (void) _bfd_vms_pop (abfd, NULL);
      (*_bfd_error_handler)  (_("%s: not fully implemented"),
			      tir_cmd_name (ptr[-1]));
      break;

    case TIR_S_C_OPR_ASH: /* Arithmetic shift.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      if (HIGHBIT (op1))	/* Shift right.  */
	op2 >>= op1;
      else			/* Shift left.  */
	op2 <<= op1;
      _bfd_vms_push (abfd, (uquad) op2, -1);
      (*_bfd_error_handler)  (_("%s: not fully implemented"),
			      tir_cmd_name (ptr[-1]));
      break;

    case TIR_S_C_OPR_USH: /* Unsigned shift.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      if (HIGHBIT (op1))	/* Shift right.  */
	op2 >>= op1;
      else			/* Shift left.  */
	op2 <<= op1;
      _bfd_vms_push (abfd, (uquad) op2, -1);
      (*_bfd_error_handler)  (_("%s: not fully implemented"),
			      tir_cmd_name (ptr[-1]));
      break;

    case TIR_S_C_OPR_ROT: /* Rotate.  */
      op1 = (long) _bfd_vms_pop (abfd, NULL);
      op2 = (long) _bfd_vms_pop (abfd, NULL);
      if (HIGHBIT (0))	/* Shift right.  */
	op2 >>= op1;
      else		/* Shift left.  */
	op2 <<= op1;
      _bfd_vms_push (abfd, (uquad) op2, -1);
      (*_bfd_error_handler)  (_("%s: not fully implemented"),
			      tir_cmd_name (ptr[-1]));
      break;

    case TIR_S_C_OPR_SEL: /* Select.  */
      if ((long) _bfd_vms_pop (abfd, NULL) & 0x01L)
	(void) _bfd_vms_pop (abfd, NULL);
      else
	{
	  op1 = (long) _bfd_vms_pop (abfd, NULL);
	  (void) _bfd_vms_pop (abfd, NULL);
	  _bfd_vms_push (abfd, (uquad) op1, -1);
	}
      break;

    case TIR_S_C_OPR_REDEF: /* Redefine symbol to current location.  */
    case TIR_S_C_OPR_DFLIT: /* Define a literal.  */
      (*_bfd_error_handler) (_("%s: not supported"),
			     tir_cmd_name (ptr[-1]));
      break;

    default:
      (*_bfd_error_handler) (_("reserved OPR cmd %d"), ptr[-1]);
      break;
    }

  return ptr;
}

/* Control commands

   See table 7-6 of the VAX/VMS linker manual.  */

static unsigned char *
tir_ctl (bfd * abfd, unsigned char *ptr)
{
  unsigned long dummy;
  int psect;

#if VMS_DEBUG
  _bfd_vms_debug (5, "tir_ctl %d\n", *ptr);
#endif

  switch (*ptr++)
    {
    case TIR_S_C_CTL_SETRB:
      /* Set relocation base: pop stack, set image location counter
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      if ((unsigned int) psect >= PRIV (section_count))
	alloc_section (abfd, psect);
      image_set_ptr (abfd, psect, (uquad) dummy);
      break;

    case TIR_S_C_CTL_AUGRB:
      /* Augment relocation base: increment image location counter by offset
	 arg: lw	offset value.  */
      dummy = bfd_getl32 (ptr);
      image_inc_ptr (abfd, (uquad) dummy);
      break;

    case TIR_S_C_CTL_DFLOC:
      /* Define location: pop index, save location counter under index
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, NULL);
      (*_bfd_error_handler) (_("%s: not fully implemented"),
			     tir_cmd_name (ptr[-1]));
      break;

    case TIR_S_C_CTL_STLOC:
      /* Set location: pop index, restore location counter from index
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      (*_bfd_error_handler) (_("%s: not fully implemented"),
			     tir_cmd_name (ptr[-1]));
      break;

    case TIR_S_C_CTL_STKDL:
      /* Stack defined location: pop index, push location counter from index
	 arg: none.  */
      dummy = _bfd_vms_pop (abfd, &psect);
      (*_bfd_error_handler) (_("%s: not fully implemented"),
			     tir_cmd_name (ptr[-1]));
      break;

    default:
      (*_bfd_error_handler) (_("reserved CTL cmd %d"), ptr[-1]);
      break;
    }
  return ptr;
}

/* Handle command from TIR section.  */

static unsigned char *
tir_cmd (bfd * abfd, unsigned char *ptr)
{
  static const struct
  {
    int mincod;
    int maxcod;
    unsigned char * (*explain) (bfd *, unsigned char *);
  }
  tir_table[] =
  {
    { 0,		 TIR_S_C_MAXSTACOD, tir_sta },
    { TIR_S_C_MINSTOCOD, TIR_S_C_MAXSTOCOD, tir_sto },
    { TIR_S_C_MINOPRCOD, TIR_S_C_MAXOPRCOD, tir_opr },
    { TIR_S_C_MINCTLCOD, TIR_S_C_MAXCTLCOD, tir_ctl },
    { -1, -1, NULL }
  };
  int i = 0;

#if VMS_DEBUG
  _bfd_vms_debug (4, "tir_cmd %d/%x\n", *ptr, *ptr);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  if (*ptr & 0x80)
    {
      /* Store immediate.  */
      i = 128 - (*ptr++ & 0x7f);
      image_dump (abfd, ptr, i, 0);
      ptr += i;
    }
  else
    {
      while (tir_table[i].mincod >= 0)
	{
	  if ( (tir_table[i].mincod <= *ptr)
	       && (*ptr <= tir_table[i].maxcod))
	    {
	      ptr = tir_table[i].explain (abfd, ptr);
	      break;
	    }
	  i++;
	}
      if (tir_table[i].mincod < 0)
	{
	  (*_bfd_error_handler) (_("obj code %d not found"), *ptr);
	  ptr = 0;
	}
    }

  return ptr;
}

/* Handle command from ETIR section.  */

static int
etir_cmd (bfd *abfd, int cmd, unsigned char *ptr, int *quarter_relocs)
{
  static const struct
  {
    int mincod;
    int maxcod;
    bfd_boolean (*explain) (bfd *, int, unsigned char *, int *);
  }
  etir_table[] =
  {
    { ETIR_S_C_MINSTACOD, ETIR_S_C_MAXSTACOD, etir_sta },
    { ETIR_S_C_MINSTOCOD, ETIR_S_C_MAXSTOCOD, etir_sto },
    { ETIR_S_C_MINOPRCOD, ETIR_S_C_MAXOPRCOD, etir_opr },
    { ETIR_S_C_MINCTLCOD, ETIR_S_C_MAXCTLCOD, etir_ctl },
    { ETIR_S_C_MINSTCCOD, ETIR_S_C_MAXSTCCOD, etir_stc },
    { -1, -1, NULL }
  };

  int i = 0;

#if VMS_DEBUG
  _bfd_vms_debug (4, "etir_cmd: %s(%d)\n", cmd_name (cmd), cmd);
  _bfd_hexdump (8, ptr, 16, (long) ptr);
#endif

  while (etir_table[i].mincod >= 0)
    {
      if ( (etir_table[i].mincod <= cmd)
	   && (cmd <= etir_table[i].maxcod))
	{
	  if (!etir_table[i].explain (abfd, cmd, ptr, quarter_relocs))
	    return -1;
	  break;
	}
      i++;
    }

#if VMS_DEBUG
  _bfd_vms_debug (4, "etir_cmd: result = 0\n");
#endif
  return 0;
}

/* Text Information and Relocation Records (OBJ$C_TIR)
   handle tir record.  */

static int
analyze_tir (bfd * abfd, unsigned char *ptr, unsigned int length)
{
  unsigned char *maxptr;

#if VMS_DEBUG
  _bfd_vms_debug (3, "analyze_tir: %d bytes\n", length);
#endif

  maxptr = ptr + length;

  while (ptr < maxptr)
    {
      ptr = tir_cmd (abfd, ptr);
      if (ptr == 0)
	return -1;
    }

  return 0;
}

/* Text Information and Relocation Records (EOBJ$C_ETIR)
   handle etir record.  */

static int
analyze_etir (bfd * abfd, unsigned char *ptr, unsigned int length)
{
  unsigned char *maxptr = ptr + length;
  /* Relocations are made of 1, 2 or 4 ETIR commands.
     We therefore count them using quarters.  */
  int quarter_relocs = 0;
  int result = 0;

#if VMS_DEBUG
  _bfd_vms_debug (3, "analyze_etir: %d bytes\n", length);
#endif

  while (ptr < maxptr)
    {
      int cmd = bfd_getl16 (ptr);
      int cmd_length = bfd_getl16 (ptr + 2);
      result = etir_cmd (abfd, cmd, ptr + 4, &quarter_relocs);
      if (result != 0)
	break;

      /* If we have a relocation, we record its length to size
	 future buffers and bump the reloc count of the section.  */
      if (quarter_relocs)
	{
	  vms_section_data (PRIV (image_section))->reloc_size += cmd_length;
	  abfd->flags |= HAS_RELOC;

	  if (quarter_relocs == 4)
	    {
	      PRIV (image_section)->reloc_count++;

#if VMS_DEBUG
	      _bfd_vms_debug (4, "-> reloc %d at 0x%x\n",
			      PRIV (image_section)->reloc_count-1,
			      ptr - (maxptr - length));
#endif

	      quarter_relocs = 0;
	    }
	  else if (quarter_relocs > 4)
	    {

#if VMS_DEBUG
	      _bfd_vms_debug (4, "Reloc count error (%d) in section %s\n",
			      PRIV (image_section)->reloc_count,
			      PRIV (image_section)->name);
#endif

	      quarter_relocs = 0;
	    }
	}

      /* If we have a Store Immediate, we reserve space for the
	 count argument.  */
      else if (cmd == ETIR_S_C_STO_IMM)
        vms_section_data (PRIV (image_section))->reloc_size
	  += ETIR_S_C_HEADER_SIZE + 4;

      ptr += cmd_length;
    }

#if VMS_DEBUG
  _bfd_vms_debug (3, "analyze_etir: result = %d\n", result);
#endif

  return result;
}

/* Process ETIR record
   Return 0 on success, -1 on error.  */

int
_bfd_vms_slurp_tir (bfd * abfd, int objtype)
{
  int result;

#if VMS_DEBUG
  _bfd_vms_debug (2, "TIR/ETIR\n");
#endif

  switch (objtype)
    {
    case EOBJ_S_C_ETIR:
      PRIV (vms_rec) += ETIR_S_C_HEADER_SIZE;
      PRIV (rec_size) -= ETIR_S_C_HEADER_SIZE;
      result = analyze_etir (abfd, PRIV (vms_rec), (unsigned) PRIV (rec_size));
      break;
    case OBJ_S_C_TIR:
      PRIV (vms_rec) += 1;	/* Skip type.  */
      PRIV (rec_size) -= 1;
      result = analyze_tir (abfd, PRIV (vms_rec), (unsigned) PRIV (rec_size));
      break;
    default:
      result = -1;
      break;
    }

  return result;
}

 /* Slurp relocs from ETIR sections and (temporarily) save them
    in the per-section reloc buffer.  */

int
_bfd_vms_slurp_relocs (bfd *abfd)
{
  struct vms_section_data_struct *vsd;
  unsigned char *begin = PRIV (vms_rec) + 4;
  unsigned char *end = PRIV (vms_rec) + PRIV (rec_size);
  unsigned char *ptr;
  int cmd, length, slurped_length;

#if VMS_DEBUG
  _bfd_vms_debug (3, "_bfd_vms_slurp_relocs: %d bytes\n", PRIV (rec_size));
#endif

  for (ptr = begin; ptr < end; ptr += length)
    {
      cmd = bfd_getl16 (ptr);
      length = bfd_getl16 (ptr + 2);
      slurped_length = length;

      switch (cmd)
	{
	case ETIR_S_C_STA_PQ: /* ALPHA_R_REF{LONG|QUAD}, others part 1 */
	  /* This one is special as it is both part of the section header
	     and of the ALPHA_R_REFLONG and ALPHA_R_REFQUAD relocations.  */
	  if (bfd_getl16 (ptr + length) == ETIR_S_C_CTL_SETRB)
	    {
	      int psect = bfd_getl32 (ptr + ETIR_S_C_HEADER_SIZE);
	      PRIV (image_section) = PRIV (sections)[psect];
	      continue;
	    }

	case ETIR_S_C_STA_GBL: /* ALPHA_R_REFLONG und_section, step 1 */
			       /* ALPHA_R_REFQUAD und_section, step 1 */
	  break;

	case ETIR_S_C_STA_LW: /* ALPHA_R_REFLONG und_section, step 2 */
			      /* ALPHA_R_REFLONG abs_section, step 1 */
	  /* This one is special as it is both part of the section header
	     and of the ALPHA_R_REFLONG relocation.  */
	  if (bfd_getl16 (ptr + length) == ETIR_S_C_CTL_DFLOC)
	    {
	      PRIV (image_section) = PRIV (dst_section);
	      continue;
	    }

	case ETIR_S_C_STA_QW: /* ALPHA_R_REFQUAD und_section, step 2 */
			      /* ALPHA_R_REFQUAD abs_section, step 1 */

	case ETIR_S_C_STO_LW: /* ALPHA_R_REFLONG und_section, step 4 */
			      /* ALPHA_R_REFLONG abs_section, step 2 */
			      /* ALPHA_R_REFLONG others, step 2 */

	case ETIR_S_C_STO_QW: /* ALPHA_R_REFQUAD und_section, step 4 */
			      /* ALPHA_R_REFQUAD abs_section, step 2 */

	case ETIR_S_C_STO_OFF: /* ALPHA_R_REFQUAD others, step 2 */

	case ETIR_S_C_OPR_ADD: /* ALPHA_R_REFLONG und_section, step 3 */
			       /* ALPHA_R_REFQUAD und_section, step 3 */

	case ETIR_S_C_STO_CA:      /* ALPHA_R_CODEADDR */
	case ETIR_S_C_STO_GBL:     /* ALPHA_R_REFQUAD und_section */
	case ETIR_S_C_STO_GBL_LW:  /* ALPHA_R_REFLONG und_section */
	case ETIR_S_C_STC_LP_PSB:  /* ALPHA_R_LINKAGE */
	case ETIR_S_C_STC_NOP_GBL: /* ALPHA_R_NOP */
	case ETIR_S_C_STC_BSR_GBL: /* ALPHA_R_BSR */
	case ETIR_S_C_STC_LDA_GBL: /* ALPHA_R_LDA */
	case ETIR_S_C_STC_BOH_GBL: /* ALPHA_R_BOH */
	  break;

	case ETIR_S_C_STO_IMM:
	  if (PRIV (image_section)->reloc_count == 0)
	    continue;
	  /* This is not a relocation, but we nevertheless slurp the
	     count argument.  We'll use it to compute the addresses
	     of the relocations.  */
	  slurped_length = ETIR_S_C_HEADER_SIZE + 4;
	  break;

	default:
	  continue;
	}

      vsd = vms_section_data (PRIV (image_section));
      memcpy (vsd->reloc_stream + vsd->reloc_offset, ptr, slurped_length);
      vsd->reloc_offset += slurped_length;
      if (vsd->reloc_offset > vsd->reloc_size)
        {
	  (*_bfd_error_handler) (_("Reloc size error in section %s"),
			         PRIV (image_section)->name);
	  return -1;
	}
    }

#if VMS_DEBUG
  _bfd_vms_debug (3, "_bfd_vms_slurp_relocs: result = 0\n");
#endif

  return 0;
}

/* Decode relocs from the reloc buffer of the specified section
   and internalize them in the specified buffer.  */

int
_bfd_vms_decode_relocs (bfd *abfd, arelent *relocs, asection *section,
			asymbol **symbols ATTRIBUTE_UNUSED)
{
  int saved_cmd, saved_sym_offset, saved_sec_offset, saved_addend_offset;
  int cmd, sym_offset, sec_offset, address_offset, addend_offset;
  struct vms_section_data_struct *vsd = vms_section_data (section);
  bfd_reloc_code_real_type reloc_code;
  vms_symbol_entry *entry;
  bfd_vma vaddr = 0;
  unsigned char *begin = vsd->reloc_stream;
  unsigned char *end = vsd->reloc_stream + vsd->reloc_size;
  unsigned char *ptr, *arg_ptr;
  const char *name;
  int length;

#if VMS_DEBUG
  _bfd_vms_debug (3, "_bfd_vms_decode_relocs: %d bytes\n", vsd->reloc_size);
#endif

  #define PUSH_CMD()					\
    {							\
      saved_cmd = cmd;					\
      saved_sym_offset = sym_offset - length;		\
      saved_sec_offset = sec_offset - length;		\
      saved_addend_offset = addend_offset - length;	\
      continue;						\
    }

  #define POP_CMD()					\
    {							\
      cmd = saved_cmd;					\
      saved_cmd = ETIR_S_C_MAXSTCCOD + 1;		\
      sym_offset = saved_sym_offset;			\
      sec_offset = saved_sec_offset;			\
      addend_offset= saved_addend_offset;		\
    }

  #define CMD_PUSHED (saved_cmd != ETIR_S_C_MAXSTCCOD + 1)

  #define NO_OFFSET -128

  saved_cmd = ETIR_S_C_MAXSTCCOD + 1;
  saved_sym_offset = NO_OFFSET;
  saved_sec_offset = NO_OFFSET;
  saved_addend_offset = NO_OFFSET;

  for (ptr = begin; ptr < end; ptr += length)
    {
      cmd = bfd_getl16 (ptr);
      length = bfd_getl16 (ptr + 2);

      arg_ptr = ptr + ETIR_S_C_HEADER_SIZE;
      sym_offset = NO_OFFSET;
      sec_offset = NO_OFFSET;
      address_offset = NO_OFFSET;
      addend_offset = NO_OFFSET;

      switch (cmd)
	{
	case ETIR_S_C_STA_GBL: /* ALPHA_R_REFLONG und_section, step 1 */
			       /* ALPHA_R_REFQUAD und_section, step 1 */
	  sym_offset = 0;
	  PUSH_CMD ()

	case ETIR_S_C_STA_PQ: /* ALPHA_R_REF{LONG|QUAD}, others part 1 */
	  sec_offset = 0;
	  addend_offset = 4;
	  PUSH_CMD ()

	case ETIR_S_C_STA_LW: /* ALPHA_R_REFLONG abs_section, step 1 */
			      /* ALPHA_R_REFLONG und_section, step 2 */
	  if (CMD_PUSHED)
	    {
	      POP_CMD ()
	      if (cmd != ETIR_S_C_STA_GBL)
		{
		  (*_bfd_error_handler) (_("Unknown reloc %s + %s"),
					 cmd_name (cmd),
					 cmd_name (ETIR_S_C_STA_LW));
		  return 0;
		}
	      cmd = ETIR_S_C_STA_LW;
	    }
	  addend_offset = 0;
	  PUSH_CMD ()

	case ETIR_S_C_STA_QW: /* ALPHA_R_REFQUAD abs_section, step 1 */
			      /* ALPHA_R_REFQUAD und_section, step 2 */
	  if (CMD_PUSHED)
	    {
	      POP_CMD ()
	      if (cmd != ETIR_S_C_STA_GBL)
		{
		  (*_bfd_error_handler) (_("Unknown reloc %s + %s"),
					 cmd_name (cmd),
					 cmd_name (ETIR_S_C_STA_QW));
		  return 0;
		}
	      cmd = ETIR_S_C_STA_QW;
	    }
	  addend_offset = 0;
	  PUSH_CMD ()

	case ETIR_S_C_STO_LW: /* ALPHA_R_REFLONG und_section, step 4 */
			      /* ALPHA_R_REFLONG abs_section, step 2 */
			      /* ALPHA_R_REFLONG others, step 2 */
	  POP_CMD ()
	  if (cmd != ETIR_S_C_OPR_ADD
	      && cmd != ETIR_S_C_STA_LW
	      && cmd != ETIR_S_C_STA_PQ)
	    {
	      (*_bfd_error_handler) (_("Unknown reloc %s + %s"),
	        cmd_name (cmd), cmd_name (ETIR_S_C_STO_LW));
	      return 0;
	    }
	  reloc_code = BFD_RELOC_32;
	  break;

	case ETIR_S_C_STO_QW: /* ALPHA_R_REFQUAD und_section, step 4 */
			      /* ALPHA_R_REFQUAD abs_section, step 2 */
	  POP_CMD ()
	  if (cmd != ETIR_S_C_OPR_ADD && cmd != ETIR_S_C_STA_QW)
	    {
	      (*_bfd_error_handler) (_("Unknown reloc %s + %s"),
	        cmd_name (cmd), cmd_name (ETIR_S_C_STO_QW));
	      return 0;
	    }
	  reloc_code = BFD_RELOC_64;
	  break;

	case ETIR_S_C_STO_OFF: /* ALPHA_R_REFQUAD others, step 2 */
	  POP_CMD ()
	  if (cmd != ETIR_S_C_STA_PQ)
	    {
	      (*_bfd_error_handler) (_("Unknown reloc %s + %s"),
	        cmd_name (cmd), cmd_name (ETIR_S_C_STO_OFF));
	      return 0;
	    }
	  reloc_code = BFD_RELOC_64;
	  break;

	case ETIR_S_C_OPR_ADD: /* ALPHA_R_REFLONG und_section, step 3 */
			       /* ALPHA_R_REFQUAD und_section, step 3 */
	  POP_CMD ()
	  if (cmd != ETIR_S_C_STA_LW && cmd != ETIR_S_C_STA_QW)
	    {
	      (*_bfd_error_handler) (_("Unknown reloc %s + %s"),
	        cmd_name (cmd), cmd_name (ETIR_S_C_OPR_ADD));
	      return 0;
	    }
	  cmd = ETIR_S_C_OPR_ADD;
	  PUSH_CMD ()

	case ETIR_S_C_STO_CA: /* ALPHA_R_CODEADDR */
	  reloc_code = BFD_RELOC_ALPHA_CODEADDR;
	  sym_offset = 0;
	  break;

	case ETIR_S_C_STO_GBL: /* ALPHA_R_REFQUAD und_section */
	  reloc_code = BFD_RELOC_64;
	  sym_offset = 0;
	  break;

	case ETIR_S_C_STO_GBL_LW: /* ALPHA_R_REFLONG und_section */
	  reloc_code = BFD_RELOC_32;
	  sym_offset = 0;
	  break;

	case ETIR_S_C_STC_LP_PSB: /* ALPHA_R_LINKAGE */
	  reloc_code = BFD_RELOC_ALPHA_LINKAGE;
	  sym_offset = 4;
	  break;

	case ETIR_S_C_STC_NOP_GBL: /* ALPHA_R_NOP */
	  reloc_code = BFD_RELOC_ALPHA_NOP;
	  goto call_reloc;

	case ETIR_S_C_STC_BSR_GBL: /* ALPHA_R_BSR */
	  reloc_code = BFD_RELOC_ALPHA_BSR;
	  goto call_reloc;

	case ETIR_S_C_STC_LDA_GBL: /* ALPHA_R_LDA */
	  reloc_code = BFD_RELOC_ALPHA_LDA;
	  goto call_reloc;

	case ETIR_S_C_STC_BOH_GBL: /* ALPHA_R_BOH */
	  reloc_code = BFD_RELOC_ALPHA_BOH;
	  goto call_reloc;

	call_reloc:
	  sym_offset = 32;
	  address_offset = 8;
	  addend_offset = 24;
	  break;

	case ETIR_S_C_STO_IMM:
	  vaddr += bfd_getl32 (arg_ptr);
	  length = ETIR_S_C_HEADER_SIZE + 4;
	  continue;

	default:
	  continue;
	}

      relocs->howto = bfd_reloc_type_lookup (abfd, reloc_code);

      if (sym_offset > NO_OFFSET)
	{
	  name = _bfd_vms_save_counted_string (arg_ptr + sym_offset);
	  entry = (vms_symbol_entry *)
	    bfd_hash_lookup (PRIV (vms_symbol_table), name, FALSE, FALSE);
	  if (entry == NULL)
	    {
	      (*_bfd_error_handler) (_("Unknown symbol %s in command %s"),
				     name, cmd_name (cmd));
	      relocs->sym_ptr_ptr = NULL;
	    }
	  else
	    /* ??? This is a hack.  We should point in 'symbols'.  */
	    relocs->sym_ptr_ptr = &entry->symbol;
	}
      else if (sec_offset > NO_OFFSET)
	relocs->sym_ptr_ptr
	  = PRIV (sections)[bfd_getl32 (arg_ptr + sec_offset)]->symbol_ptr_ptr;
      else
	relocs->sym_ptr_ptr = NULL;

      if (address_offset > NO_OFFSET)
	relocs->address = bfd_getl64 (arg_ptr + address_offset);
      else
	relocs->address = vaddr;

      if (addend_offset > NO_OFFSET)
	relocs->addend = bfd_getl64 (arg_ptr + addend_offset);
      else
	relocs->addend = 0;

      vaddr += bfd_get_reloc_size (relocs->howto);
      relocs++;     
    }

  #undef PUSH_CMD
  #undef POP_CMD
  #undef NO_OFFSET

#if VMS_DEBUG
  _bfd_vms_debug (3, "_bfd_vms_decode_relocs: result = 0\n");
#endif

  return 0;
}

/* Process LNK record
   Return 0 on success, -1 on error

   Not implemented yet.  */

int
_bfd_vms_slurp_lnk (bfd * abfd ATTRIBUTE_UNUSED,
		    int objtype ATTRIBUTE_UNUSED)
{
#if VMS_DEBUG
  _bfd_vms_debug (2, "LNK\n");
#endif

  return 0;
}

/* WRITE ETIR SECTION

   This is still under construction and therefore not documented.  */

static void start_etir_record (bfd *abfd, int index, uquad offset,
			       bfd_boolean justoffset);
static void start_first_etbt_record (bfd *abfd);
static void start_another_etbt_record (bfd *abfd);
static void sto_imm (bfd *abfd, bfd_size_type, unsigned char *, bfd_vma vaddr,
		     int index, const char *name);
static void end_etir_record (bfd *abfd);
static void etir_output_check (bfd *abfd, asection *section, bfd_vma vaddr,
			       int checklen);

/* Start ETIR record for section #index at virtual addr offset.  */

static void
start_etir_record (bfd * abfd, int index, uquad offset, bfd_boolean justoffset)
{
  if (!justoffset)
    {
      /* One ETIR per section.  */
      _bfd_vms_output_begin (abfd, EOBJ_S_C_ETIR, -1);
      _bfd_vms_output_push (abfd);
    }

  /* Push start offset.  */
  _bfd_vms_output_begin (abfd, ETIR_S_C_STA_PQ, -1);
  _bfd_vms_output_long (abfd, (unsigned long) index);
  _bfd_vms_output_quad (abfd, (uquad) offset);
  _bfd_vms_output_flush (abfd);

  /* Start = pop ().  */
  _bfd_vms_output_begin (abfd, ETIR_S_C_CTL_SETRB, -1);
  _bfd_vms_output_flush (abfd);
}

static void
end_etir_record (bfd * abfd)
{
  _bfd_vms_output_pop (abfd);
  _bfd_vms_output_end (abfd);
}

/* Output a STO_IMM command for SSIZE bytes of data from CPR at virtual
   address VADDR in section specified by INDEX and NAME.  */

static void
sto_imm (bfd *abfd, bfd_size_type ssize, unsigned char *cptr, bfd_vma vaddr,
	 int index, const char *name)
{
  bfd_size_type size;

#if VMS_DEBUG
  _bfd_vms_debug (8, "sto_imm %d bytes\n", ssize);
  _bfd_hexdump (9, cptr, (int) ssize, (int) vaddr);
#endif

  while (ssize > 0)
    {
      /* Try all the rest.  */
      size = ssize;

      if (_bfd_vms_output_check (abfd, size) < 0)
	{
	  /* Doesn't fit, split !  */
	  end_etir_record (abfd);

	  if (name [0] && name[1] == 'v' && !strcmp (name, ".vmsdebug"))
	    start_another_etbt_record (abfd);
	  else
	    start_etir_record (abfd, index, vaddr, FALSE);

	  size = _bfd_vms_output_check (abfd, 0);	/* get max size */
	  if (size > ssize)			/* more than what's left ? */
	    size = ssize;
	}

      _bfd_vms_output_begin (abfd, ETIR_S_C_STO_IMM, -1);
      _bfd_vms_output_long (abfd, (unsigned long) (size));
      _bfd_vms_output_dump (abfd, cptr, size);
      _bfd_vms_output_flush (abfd);

#if VMS_DEBUG
      _bfd_vms_debug (10, "dumped %d bytes\n", size);
      _bfd_hexdump (10, cptr, (int) size, (int) vaddr);
#endif

      vaddr += size;
      cptr += size;
      ssize -= size;
    }
}

/* Start ETBT record for section #index at virtual addr offset.  */

static void
start_first_etbt_record (bfd *abfd)
{
  _bfd_vms_output_begin (abfd, EOBJ_S_C_ETBT, -1);
  _bfd_vms_output_push (abfd);

  _bfd_vms_output_begin (abfd, ETIR_S_C_STA_LW, -1);	/* push start offset */
  _bfd_vms_output_long (abfd, (unsigned long) 0);
  _bfd_vms_output_flush (abfd);

  _bfd_vms_output_begin (abfd, ETIR_S_C_CTL_DFLOC, -1);	/* start = pop() */
  _bfd_vms_output_flush (abfd);
}

static void
start_another_etbt_record (bfd *abfd)
{
  _bfd_vms_output_begin (abfd, EOBJ_S_C_ETBT, -1);
  _bfd_vms_output_push (abfd);
}

static void
etir_output_check (bfd *abfd, asection *section, bfd_vma vaddr, int checklen)
{
  if (_bfd_vms_output_check (abfd, checklen) < 0)
    {
      end_etir_record (abfd);
      if (section->name[0] && section->name[1] == 'v'
	  && !strcmp (section->name, ".vmsdebug"))
	start_another_etbt_record (abfd);
      else
	start_etir_record (abfd, section->index, vaddr, FALSE);
    }
}

/* Return whether RELOC must be deferred till the end.  */

static int
defer_reloc_p (arelent *reloc)
{
  switch (reloc->howto->type)
    {
    case ALPHA_R_NOP:
    case ALPHA_R_LDA:
    case ALPHA_R_BSR:
    case ALPHA_R_BOH:
      return 1;

    default:
      return 0;
    }
}

/* Write section contents for bfd abfd.  */

int
_bfd_vms_write_tir (bfd * abfd, int objtype ATTRIBUTE_UNUSED)
{
  asection *section;

#if VMS_DEBUG
  _bfd_vms_debug (2, "vms_write_tir (%p, %d)\n", abfd, objtype);
#endif

  _bfd_vms_output_alignment (abfd, 4);

  PRIV (vms_linkage_index) = 1;

  for (section = abfd->sections; section; section = section->next)
    {
#if VMS_DEBUG
      _bfd_vms_debug (4, "writing %d. section '%s' (%d bytes)\n",
		      section->index, section->name,
		      (int) (section->size));
#endif

      if (!(section->flags & SEC_HAS_CONTENTS)
	  || bfd_is_com_section (section))
	continue;

      if (!section->contents)
	{
	  bfd_set_error (bfd_error_no_contents);
	  return -1;
	}

      if (section->name[0]
	  && section->name[1] == 'v'
	  && !strcmp (section->name, ".vmsdebug"))
	start_first_etbt_record (abfd);
      else
	start_etir_record (abfd, section->index, 0, FALSE);

      if (section->flags & SEC_RELOC)
	{
	  bfd_vma curr_addr = 0;
	  unsigned char *curr_data = section->contents;
	  bfd_size_type size;
	  int pass2_needed = 0;
	  int pass2_in_progress = 0;
	  unsigned int irel;

	  if (section->reloc_count <= 0)
	    (*_bfd_error_handler)
	      (_("SEC_RELOC with no relocs in section %s"), section->name);

#if VMS_DEBUG
	  else
	    {
	      int i = section->reloc_count;
	      arelent **rptr = section->orelocation;
	      _bfd_vms_debug (4, "%d relocations:\n", i);
	      while (i-- > 0)
		{
		  _bfd_vms_debug (4, "sym %s in sec %s, value %08lx, "
				     "addr %08lx, off %08lx, len %d: %s\n",
				  (*(*rptr)->sym_ptr_ptr)->name,
				  (*(*rptr)->sym_ptr_ptr)->section->name,
				  (long) (*(*rptr)->sym_ptr_ptr)->value,
				  (*rptr)->address, (*rptr)->addend,
				  bfd_get_reloc_size ((*rptr)->howto),
				   ( *rptr)->howto->name);
		  rptr++;
		}
	    }
#endif

	new_pass:
	  for (irel = 0; irel < section->reloc_count; irel++)
	    {
	      struct evax_private_udata_struct *udata;
	      arelent *rptr = section->orelocation [irel];
	      bfd_vma addr = rptr->address;
	      asymbol *sym = *rptr->sym_ptr_ptr;
	      asection *sec = sym->section;
	      int defer = defer_reloc_p (rptr);
	      unsigned int slen;
	      char *hash;

	      if (pass2_in_progress)
		{
		  /* Non-deferred relocs have already been output.  */
		  if (!defer)
		    continue;
		}
	      else
		{
		  /* Deferred relocs must be output at the very end.  */
		  if (defer)
		    {
		      pass2_needed = 1;
		      continue;
		    }

		  /* Regular relocs are intertwined with binary data.  */
	          if (curr_addr > addr)
		    (*_bfd_error_handler) (_("Size error in section %s"),
					   section->name);
		  size = addr - curr_addr;
		  sto_imm (abfd, size, curr_data, curr_addr,
		          section->index, section->name);
		  curr_data += size;
		  curr_addr += size;
		}

	      size = bfd_get_reloc_size (rptr->howto);

	      switch (rptr->howto->type)
	        {
		case ALPHA_R_IGNORE:
		  break;

		case ALPHA_R_REFLONG:
		  if (bfd_is_und_section (sym->section))
		    {
		      bfd_vma addend = rptr->addend;
		      slen = strlen ((char *) sym->name);
		      hash = _bfd_vms_length_hash_symbol
			       (abfd, sym->name, EOBJ_S_C_SYMSIZ);
		      etir_output_check (abfd, section, curr_addr, slen);
		      if (addend)
			{
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STA_GBL, -1);
			  _bfd_vms_output_counted (abfd, hash);
			  _bfd_vms_output_flush (abfd);
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STA_LW, -1);
			  _bfd_vms_output_long (abfd, (unsigned long) addend);
			  _bfd_vms_output_flush (abfd);
			  _bfd_vms_output_begin (abfd, ETIR_S_C_OPR_ADD, -1);
			  _bfd_vms_output_flush (abfd);
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STO_LW, -1);
			  _bfd_vms_output_flush (abfd);
			}
		      else
			{
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STO_GBL_LW, -1);
			  _bfd_vms_output_counted (abfd, hash);
			  _bfd_vms_output_flush (abfd);
			}
		    }
		  else if (bfd_is_abs_section (sym->section))
		    {
		      etir_output_check (abfd, section, curr_addr, 16);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STA_LW, -1);
		      _bfd_vms_output_long (abfd, (unsigned long) sym->value);
		      _bfd_vms_output_flush (abfd);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STO_LW, -1);
		      _bfd_vms_output_flush (abfd);
		    }
		  else
		    {
		      etir_output_check (abfd, section, curr_addr, 32);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STA_PQ, -1);
		      _bfd_vms_output_long (abfd, (unsigned long) sec->index);
		      _bfd_vms_output_quad (abfd, (uquad) rptr->addend
						    + (uquad) sym->value);
		      _bfd_vms_output_flush (abfd);
		      /* ??? Table B-8 of the OpenVMS Linker Utilily Manual
			 says that we should have a ETIR_S_C_STO_OFF here.
			 But the relocation would not be BFD_RELOC_32 then.
			 This case is very likely unreachable.  */
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STO_LW, -1);
		      _bfd_vms_output_flush (abfd);
		    }
		  break;

		case ALPHA_R_REFQUAD:
		  if (bfd_is_und_section (sym->section))
		    {
		      bfd_vma addend = rptr->addend;
		      slen = strlen ((char *) sym->name);
		      hash = _bfd_vms_length_hash_symbol
			       (abfd, sym->name, EOBJ_S_C_SYMSIZ);
		      etir_output_check (abfd, section, curr_addr, slen);
		      if (addend)
			{
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STA_GBL, -1);
			  _bfd_vms_output_counted (abfd, hash);
			  _bfd_vms_output_flush (abfd);
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STA_QW, -1);
			  _bfd_vms_output_quad (abfd, (uquad) addend);
			  _bfd_vms_output_flush (abfd);
			  _bfd_vms_output_begin (abfd, ETIR_S_C_OPR_ADD, -1);
			  _bfd_vms_output_flush (abfd);
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STO_QW, -1);
			  _bfd_vms_output_flush (abfd);
			}
		      else
			{
			  _bfd_vms_output_begin (abfd, ETIR_S_C_STO_GBL, -1);
			  _bfd_vms_output_counted (abfd, hash);
			  _bfd_vms_output_flush (abfd);
			}
		    }
		  else if (bfd_is_abs_section (sym->section))
		    {
		      etir_output_check (abfd, section, curr_addr, 16);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STA_QW, -1);
		      _bfd_vms_output_quad (abfd, (uquad) sym->value);
		      _bfd_vms_output_flush (abfd);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STO_QW, -1);
		      _bfd_vms_output_flush (abfd);
		    }
		  else
		    {
		      etir_output_check (abfd, section, curr_addr, 32);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STA_PQ, -1);
		      _bfd_vms_output_long (abfd, (unsigned long) sec->index);
		      _bfd_vms_output_quad (abfd, (uquad) rptr->addend
						    + (uquad) sym->value);
		      _bfd_vms_output_flush (abfd);
		      _bfd_vms_output_begin (abfd, ETIR_S_C_STO_OFF, -1);
		      _bfd_vms_output_flush (abfd);
		    }
		  break;

		case ALPHA_R_HINT:
		  sto_imm (abfd, size, curr_data, curr_addr,
			   section->index, section->name);
		  break;
		
		case ALPHA_R_LINKAGE:
		  etir_output_check (abfd, section, curr_addr, 64);
		  _bfd_vms_output_begin (abfd, ETIR_S_C_STC_LP_PSB, -1);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) PRIV (vms_linkage_index));
		  PRIV (vms_linkage_index) += 2;
		  hash = _bfd_vms_length_hash_symbol
			   (abfd, sym->name, EOBJ_S_C_SYMSIZ);
		  _bfd_vms_output_counted (abfd, hash);
		  _bfd_vms_output_byte (abfd, 0);
		  _bfd_vms_output_flush (abfd);
		  break;

		case ALPHA_R_CODEADDR:
		  slen = strlen ((char *) sym->name);
		  hash = _bfd_vms_length_hash_symbol
			   (abfd, sym->name, EOBJ_S_C_SYMSIZ);
		  etir_output_check (abfd, section, curr_addr, slen);
		  _bfd_vms_output_begin (abfd, ETIR_S_C_STO_CA, -1);
		  _bfd_vms_output_counted (abfd, hash);
		  _bfd_vms_output_flush (abfd);
		  break;

		case ALPHA_R_NOP:
		  udata
		    = (struct evax_private_udata_struct *) rptr->sym_ptr_ptr;
		  etir_output_check (abfd, section, curr_addr,
				     32 + 1 + strlen (udata->origname));
		  _bfd_vms_output_begin (abfd, ETIR_S_C_STC_NOP_GBL, -1);
		  _bfd_vms_output_long (abfd, (unsigned long) udata->lkindex);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->enbsym->section->index);
		  _bfd_vms_output_quad (abfd, (uquad) rptr->address);
		  _bfd_vms_output_long (abfd, (unsigned long) 0x47ff041f);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->enbsym->section->index);
		  _bfd_vms_output_quad (abfd, (uquad) rptr->addend);
		  _bfd_vms_output_counted
		    (abfd, _bfd_vms_length_hash_symbol
			     (abfd, udata->origname, EOBJ_S_C_SYMSIZ));
		  _bfd_vms_output_flush (abfd);
		  break;

		case ALPHA_R_BSR:
		  (*_bfd_error_handler) (_("Spurious ALPHA_R_BSR reloc"));
		  break;

		case ALPHA_R_LDA:
		  udata
		    = (struct evax_private_udata_struct *) rptr->sym_ptr_ptr;
		  etir_output_check (abfd, section, curr_addr,
				     32 + 1 + strlen (udata->origname));
		  _bfd_vms_output_begin (abfd, ETIR_S_C_STC_LDA_GBL, -1);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->lkindex + 1);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->enbsym->section->index);
		  _bfd_vms_output_quad (abfd, (uquad) rptr->address);
		  _bfd_vms_output_long (abfd, (unsigned long) 0x237B0000);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->bsym->section->index);
		  _bfd_vms_output_quad (abfd, (uquad) rptr->addend);
		  _bfd_vms_output_counted
		    (abfd, _bfd_vms_length_hash_symbol
			    (abfd, udata->origname, EOBJ_S_C_SYMSIZ));
		  _bfd_vms_output_flush (abfd);
		  break;

		case ALPHA_R_BOH:
		  udata
		    = (struct evax_private_udata_struct *) rptr->sym_ptr_ptr;
		  etir_output_check (abfd, section, curr_addr,
				       32 + 1 + strlen (udata->origname));
		  _bfd_vms_output_begin (abfd, ETIR_S_C_STC_BOH_GBL, -1);
		  _bfd_vms_output_long (abfd, (unsigned long) udata->lkindex);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->enbsym->section->index);
		  _bfd_vms_output_quad (abfd, (uquad) rptr->address);
		  _bfd_vms_output_long (abfd, (unsigned long) 0xD3400000);
		  _bfd_vms_output_long
		    (abfd, (unsigned long) udata->enbsym->section->index);
		  _bfd_vms_output_quad (abfd, (uquad) rptr->addend);
		  _bfd_vms_output_counted
		    (abfd, _bfd_vms_length_hash_symbol
			     (abfd, udata->origname, EOBJ_S_C_SYMSIZ));
		  _bfd_vms_output_flush (abfd);
		  break;

		default:
		  (*_bfd_error_handler) (_("Unhandled relocation %s"),
		  			 rptr->howto->name);
		  break;
		}

	      curr_data += size;
	      curr_addr += size;
	    } /* End of relocs loop.  */

	  if (!pass2_in_progress)
	    {
	      /* Output rest of section.  */
	      if (curr_addr > section->size)
		(*_bfd_error_handler) (_("Size error in section %s"),
				       section->name);
	      size = section->size - curr_addr;
	      sto_imm (abfd, size, curr_data, curr_addr,
		       section->index, section->name);
	      curr_data += size;
	      curr_addr += size;

	      if (pass2_needed)
		{
		  pass2_in_progress = 1;
		  goto new_pass;
		}
	    }
	}
  
      else /* (section->flags & SEC_RELOC) */
	sto_imm (abfd, section->size, section->contents, 0,
		 section->index, section->name);

      end_etir_record (abfd);
    }

  _bfd_vms_output_alignment (abfd, 2);
  return 0;
}
