/* vms-hdr.c -- BFD back-end for VMS/VAX (openVMS/VAX) and
   EVAX (openVMS/Alpha) files.
   Copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2005, 2006,
   2007, 2008, 2009 Free Software Foundation, Inc.

   HDR record handling functions
   EMH record handling functions

   EOM record handling functions
   EEOM record handling functions

   IHD record handling functions
   EIHD record handling functions

   ISD record handling functions
   EISD record handling functions

   IHS record handling functions
   EIHS record handling functions

   DBG record handling functions
   EDBG record handling functions

   TBT record handling functions
   ETBT record handling functions

   DST/DMT section handling functions

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

#include "sysdep.h"
#include "bfd.h"
#include "bfdver.h"
#include "bfdlink.h"
#include "safe-ctype.h"
#include "libbfd.h"

#include "vms.h"

static struct module *new_module (bfd *);
static void parse_module
  (bfd *, struct module *, unsigned char *, unsigned int);
static struct module *build_module_list (bfd *);
static bfd_boolean module_find_nearest_line
  (bfd *, struct module *, bfd_vma, const char **, const char **,
   unsigned int *);
static int vms_slurp_debug (bfd *);

#define SET_MODULE_PARSED(m) \
  do { if ((m)->name == NULL) (m)->name = ""; } while (0)
#define IS_MODULE_PARSED(m) ((m)->name != NULL)


/* Read & process emh record
   return 0 on success, -1 on error.  */

int
_bfd_vms_slurp_hdr (bfd *abfd, int objtype)
{
  unsigned char *ptr;
  unsigned char *vms_rec;
  int subtype;

  vms_rec = PRIV(vms_rec);

#if VMS_DEBUG
  vms_debug(2, "HDR/EMH\n");
#endif

  switch (objtype)
    {
    case OBJ_S_C_HDR:
      subtype = vms_rec[1];
      break;
    case EOBJ_S_C_EMH:
      subtype = bfd_getl16 (vms_rec + 4) + EVAX_OFFSET;
      break;
    default:
      subtype = -1;
    }

#if VMS_DEBUG
  vms_debug(3, "subtype %d\n", subtype);
#endif

  switch (subtype)
    {
    case MHD_S_C_MHD:
      /* Module header.  */
      PRIV (hdr_data).hdr_b_strlvl = vms_rec[2];
      PRIV (hdr_data).hdr_l_recsiz = bfd_getl16 (vms_rec + 3);
      PRIV (hdr_data).hdr_t_name = _bfd_vms_save_counted_string (vms_rec + 5);
      ptr = vms_rec + 5 + vms_rec[5] + 1;
      PRIV (hdr_data).hdr_t_version = _bfd_vms_save_counted_string (ptr);
      ptr += *ptr + 1;
      PRIV (hdr_data).hdr_t_date = _bfd_vms_save_sized_string (ptr, 17);
      break;

    case MHD_S_C_LNM:
      PRIV (hdr_data).hdr_c_lnm = _bfd_vms_save_sized_string (vms_rec, PRIV (rec_size - 2));
      break;

    case MHD_S_C_SRC:
      PRIV (hdr_data).hdr_c_src = _bfd_vms_save_sized_string (vms_rec, PRIV (rec_size - 2));
      break;

    case MHD_S_C_TTL:
      PRIV (hdr_data).hdr_c_ttl = _bfd_vms_save_sized_string (vms_rec, PRIV (rec_size - 2));
      break;

    case EMH_S_C_MHD + EVAX_OFFSET:
      /* Module header.  */
      PRIV (hdr_data).hdr_b_strlvl = vms_rec[6];
      PRIV (hdr_data).hdr_l_arch1  = bfd_getl32 (vms_rec + 8);
      PRIV (hdr_data).hdr_l_arch2  = bfd_getl32 (vms_rec + 12);
      PRIV (hdr_data).hdr_l_recsiz = bfd_getl32 (vms_rec + 16);
      PRIV (hdr_data).hdr_t_name   = _bfd_vms_save_counted_string (vms_rec + 20);
      ptr = vms_rec + 20 + vms_rec[20] + 1;
      PRIV (hdr_data).hdr_t_version =_bfd_vms_save_counted_string (ptr);
      ptr += *ptr + 1;
      PRIV (hdr_data).hdr_t_date = _bfd_vms_save_sized_string (ptr, 17);
      break;

    case EMH_S_C_LNM + EVAX_OFFSET:
      PRIV (hdr_data).hdr_c_lnm = _bfd_vms_save_sized_string (vms_rec, PRIV (rec_size - 6));
      break;

    case EMH_S_C_SRC + EVAX_OFFSET:
      PRIV (hdr_data).hdr_c_src = _bfd_vms_save_sized_string (vms_rec, PRIV (rec_size - 6));
      break;

    case EMH_S_C_TTL + EVAX_OFFSET:
      PRIV (hdr_data).hdr_c_ttl = _bfd_vms_save_sized_string (vms_rec, PRIV (rec_size - 6));
      break;

    case MHD_S_C_CPR:
    case MHD_S_C_MTC:
    case MHD_S_C_GTX:
    case EMH_S_C_CPR + EVAX_OFFSET:
    case EMH_S_C_MTC + EVAX_OFFSET:
    case EMH_S_C_GTX + EVAX_OFFSET:
      break;

    default:
      bfd_set_error (bfd_error_wrong_format);
      return -1;
    }

  return 0;
}

/* Output routines.  */

/* Manufacture a VMS like time on a unix based system.
   stolen from obj-vms.c.  */

static unsigned char *
get_vms_time_string (void)
{
  static unsigned char tbuf[18];
#ifndef VMS
#include <time.h>

  char *pnt;
  time_t timeb;

  time (& timeb);
  pnt = ctime (&timeb);
  pnt[3] = 0;
  pnt[7] = 0;
  pnt[10] = 0;
  pnt[16] = 0;
  pnt[24] = 0;
  sprintf ((char *) tbuf, "%2s-%3s-%s %s",
	   pnt + 8, pnt + 4, pnt + 20, pnt + 11);
#else
#include <starlet.h>
  struct
  {
    int Size;
    unsigned char *Ptr;
  } Descriptor;
  Descriptor.Size = 17;
  Descriptor.Ptr = tbuf;
  SYS$ASCTIM (0, &Descriptor, 0, 0);
#endif /* not VMS */

#if VMS_DEBUG
  vms_debug (6, "vmstimestring:'%s'\n", tbuf);
#endif

  return tbuf;
}

/* Write object header for bfd abfd.  */

int
_bfd_vms_write_hdr (bfd *abfd, int objtype)
{
  asymbol *symbol;
  unsigned int symnum;
  int had_case = 0;
  int had_file = 0;
  char version [256];

#if VMS_DEBUG
  vms_debug (2, "vms_write_hdr (%p)\n", abfd);
#endif

  _bfd_vms_output_alignment (abfd, 2);

  /* MHD.  */
  if (objtype != OBJ_S_C_HDR)
    {
      _bfd_vms_output_begin (abfd, EOBJ_S_C_EMH, EMH_S_C_MHD);
      _bfd_vms_output_short (abfd, EOBJ_S_C_STRLVL);
      _bfd_vms_output_long (abfd, 0);
      _bfd_vms_output_long (abfd, 0);
      _bfd_vms_output_long (abfd, MAX_OUTREC_SIZE);
    }

  if (bfd_get_filename (abfd) != 0)
    {
      /* Strip path and suffix information.  */
      char *fname, *fout, *fptr;

      fptr = bfd_get_filename (abfd);
      fname = strdup (fptr);

      /* Strip VMS path.  */
      fout = strrchr (fname, ']');
      if (fout == NULL)
	fout = strchr (fname, ':');
      if (fout != NULL)
	fout++;
      else
	fout = fname;

      /* Strip UNIX path.  */
      fptr = strrchr (fout, '/');
      if (fptr != NULL)
	fout = fptr + 1;

      /* Strip .obj suffix.  */
      fptr = strrchr (fout, '.');
      if (fptr != 0 && strcasecmp (fptr, ".OBJ") == 0)
	*fptr = 0;

      /* Convert to upper case and truncate at 31 characters.
         (VMS object file format restricts module name length to 31).  */
      fptr = fout;
      while (*fptr != 0)
	{
	  *fptr = TOUPPER (*fptr);
	  fptr++;
	  if (*fptr == ';' || (fptr - fout) >= 31)
	    *fptr = 0;
	}
      _bfd_vms_output_counted (abfd, fout);
      free (fname);
    }
  else
    _bfd_vms_output_counted (abfd, "NONAME");

  _bfd_vms_output_counted (abfd, BFD_VERSION_STRING);
  _bfd_vms_output_dump (abfd, get_vms_time_string (), EMH_DATE_LENGTH);
  _bfd_vms_output_fill (abfd, 0, EMH_DATE_LENGTH);
  _bfd_vms_output_flush (abfd);

  /* LMN.  */
  _bfd_vms_output_begin (abfd, EOBJ_S_C_EMH, EMH_S_C_LNM);
  snprintf (version, sizeof (version), "GAS BFD v%s", BFD_VERSION_STRING);
  _bfd_vms_output_dump (abfd, (unsigned char *)version, strlen (version));
  _bfd_vms_output_flush (abfd);

  /* SRC.  */
  _bfd_vms_output_begin (abfd, EOBJ_S_C_EMH, EMH_S_C_SRC);

  for (symnum = 0; symnum < abfd->symcount; symnum++)
    {
      symbol = abfd->outsymbols[symnum];

      if (symbol->flags & BSF_FILE)
	{
	  if (CONST_STRNEQ ((char *)symbol->name, "<CASE:"))
	    {
	      PRIV (flag_hash_long_names) = symbol->name[6] - '0';
	      PRIV (flag_show_after_trunc) = symbol->name[7] - '0';

	      if (had_file)
		break;
	      had_case = 1;
	      continue;
	    }

	  _bfd_vms_output_dump (abfd, (unsigned char *) symbol->name,
				(int) strlen (symbol->name));
	  if (had_case)
	    break;
	  had_file = 1;
	}
    }

  if (symnum == abfd->symcount)
    _bfd_vms_output_dump (abfd, (unsigned char *) STRING_COMMA_LEN ("noname"));

  _bfd_vms_output_flush (abfd);

  /* TTL.  */
  _bfd_vms_output_begin (abfd, EOBJ_S_C_EMH, EMH_S_C_TTL);
  _bfd_vms_output_dump (abfd, (unsigned char *) STRING_COMMA_LEN ("TTL"));
  _bfd_vms_output_flush (abfd);

  /* CPR.  */
  _bfd_vms_output_begin (abfd, EOBJ_S_C_EMH, EMH_S_C_CPR);
  _bfd_vms_output_dump (abfd,
			 (unsigned char *)"GNU BFD ported by Klaus Kämpf 1994-1996",
			 39);
  _bfd_vms_output_flush (abfd);

  return 0;
}

/* Process EOM/EEOM record
   return 0 on success, -1 on error.  */

int
_bfd_vms_slurp_eom (bfd *abfd, int objtype)
{
  unsigned char *vms_rec;

#if VMS_DEBUG
  vms_debug(2, "EOM/EEOM\n");
#endif

  vms_rec = PRIV (vms_rec);

  if ((objtype == OBJ_S_C_EOM)
     || (objtype == OBJ_S_C_EOMW))
    {
    }
  else
    {
      PRIV (eom_data).eom_l_total_lps
        = bfd_getl32 (vms_rec + EEOM_S_L_TOTAL_LPS);
      PRIV (eom_data).eom_w_comcod = bfd_getl16 (vms_rec + EEOM_S_W_COMCOD);
      if (PRIV (eom_data).eom_w_comcod > 1)
	{
	  (*_bfd_error_handler) (_("Object module NOT error-free !\n"));
	  bfd_set_error (bfd_error_bad_value);
	  return -1;
	}
      PRIV (eom_data).eom_has_transfer = FALSE;
      if (PRIV (rec_size) > 10)
	{
	   PRIV (eom_data).eom_has_transfer = TRUE;
	   PRIV (eom_data).eom_b_tfrflg = vms_rec[EEOM_S_B_TFRFLG];
	   PRIV (eom_data).eom_l_psindx
	     = bfd_getl32 (vms_rec + EEOM_S_L_PSINDX);
	   PRIV (eom_data).eom_l_tfradr
	     = bfd_getl32 (vms_rec + EEOM_S_L_TFRADR);

	   abfd->start_address = PRIV (eom_data).eom_l_tfradr;
	}
    }
  return 0;
}

/* Write eom record for bfd abfd.  */

int
_bfd_vms_write_eom (bfd *abfd, int objtype)
{
#if VMS_DEBUG
  vms_debug (2, "vms_write_eom (%p, %d)\n", abfd, objtype);
#endif

  _bfd_vms_output_begin (abfd, objtype, -1);
  _bfd_vms_output_long (abfd, (unsigned long) (PRIV (vms_linkage_index) >> 1));
  _bfd_vms_output_byte (abfd, 0);	/* Completion code.  */
  _bfd_vms_output_byte (abfd, 0);	/* Fill byte.  */

  if (bfd_get_start_address (abfd) != (bfd_vma)-1)
    {
      asection *section;

      section = bfd_get_section_by_name (abfd, ".link");
      if (section == 0)
	{
	  bfd_set_error (bfd_error_nonrepresentable_section);
	  return -1;
	}
      _bfd_vms_output_short (abfd, 0);
      _bfd_vms_output_long (abfd, (unsigned long) (section->index));
      _bfd_vms_output_long (abfd,
			     (unsigned long) bfd_get_start_address (abfd));
      _bfd_vms_output_long (abfd, 0);
    }

  _bfd_vms_output_end (abfd);
  return 0;
}

/* Read & process IHD/EIHD record.
   Return 0 on success, -1 on error  */
int
_bfd_vms_slurp_ihd (bfd *abfd, unsigned int *isd_offset,
		    unsigned int *ihs_offset)
{
  unsigned int imgtype, size;
  bfd_vma symvva;

#if VMS_DEBUG
  vms_debug (8, "_bfd_vms_slurp_ihd\n");
#endif

  size = bfd_getl32 (PRIV (vms_rec) + EIHD_S_L_SIZE);
  imgtype = bfd_getl32 (PRIV (vms_rec) + EIHD_S_L_IMGTYPE);

  if (imgtype == EIHD_S_K_EXE)
    abfd->flags |= EXEC_P;

  symvva = bfd_getl64 (PRIV (vms_rec) + EIHD_S_Q_SYMVVA);
  if (symvva != 0)
    {
      PRIV (symvva) = symvva;
      abfd->flags |= DYNAMIC;
    }

  *isd_offset = bfd_getl32 (PRIV (vms_rec) + EIHD_S_L_ISDOFF);
  *ihs_offset = bfd_getl32 (PRIV (vms_rec) + EIHD_S_L_SYMDBGOFF);

#if VMS_DEBUG
  vms_debug (4, "EIHD record size %d imgtype %d symvva 0x%llx isd %d ihs %d\n",
	     size, imgtype, symvva, *isd_offset, *ihs_offset);
#endif

  return 0;
}

/* Read & process ISD/EISD record
   return 0 on success, -1 on error  */

int
_bfd_vms_slurp_isd (bfd *abfd, unsigned int offset)
{
  int section_count = 0;
  unsigned char *p;
  unsigned int rec_size;

#if VMS_DEBUG
  vms_debug (8, "_bfd_vms_slurp_isd\n");
#endif

  for (p = PRIV (vms_rec) + offset;
       (rec_size = bfd_getl32 (p + EISD_S_L_EISDSIZE)) != 0;
       p += rec_size)
    {
      unsigned long long vaddr = bfd_getl64 (p + EISD_S_Q_VIR_ADDR);
      unsigned int size = bfd_getl32 (p + EISD_S_L_SECSIZE);
      unsigned int flags = bfd_getl32 (p + EISD_S_L_FLAGS);
      unsigned int vbn = bfd_getl32 (p + EISD_S_L_VBN);
      char *name = NULL;
      asection *section;
      flagword bfd_flags;

#if VMS_DEBUG
      vms_debug (4, "EISD record at 0x%x size 0x%x addr 0x%x bfd_flags 0x%x block %d\n",
		 p - PRIV (vms_rec), size, vaddr, flags, vbn);
#endif

      /* VMS combines psects from .obj files into isects in the .exe.  This
	 process doesn't preserve enough information to reliably determine
	 what's in each section without examining the data.  This is
	 especially true of DWARF debug sections.  */
      bfd_flags = SEC_ALLOC;

      if (flags & EISD_S_M_EXE)
	bfd_flags |= SEC_CODE | SEC_HAS_CONTENTS | SEC_LOAD;

      if (flags & EISD_S_M_NONSHRADR)
	bfd_flags |= SEC_DATA | SEC_HAS_CONTENTS | SEC_LOAD;

      if (!(flags & EISD_S_M_WRT))
	bfd_flags |= SEC_READONLY;

      if (flags & EISD_S_M_DZRO)
	bfd_flags |= SEC_DATA;

      if (flags & EISD_S_M_FIXUPVEC)
	bfd_flags |= SEC_DATA | SEC_HAS_CONTENTS | SEC_LOAD;

      if (flags & EISD_S_M_CRF)
	bfd_flags |= SEC_HAS_CONTENTS | SEC_LOAD;

      if (flags & EISD_S_M_GBL)
	{
	  name = _bfd_vms_save_counted_string (p + EISD_S_T_GBLNAM);
	  bfd_flags |= SEC_COFF_SHARED_LIBRARY;
	  bfd_flags &= ~(SEC_ALLOC | SEC_LOAD);
	}
      else
	{
	  name = (char*) bfd_alloc (abfd, 32);
	  sprintf (name, "$LOCAL_%03d$", section_count++);
	}

      section = bfd_make_section (abfd, name);

      if (!section)
	return -1;

      section->filepos = vbn ? VMS_BLOCK_SIZE * (vbn - 1) : (unsigned int)-1;
      section->size = size;
      section->vma = vaddr;

      if (!bfd_set_section_flags (abfd, section, bfd_flags))
	return -1;
    }

  return 0;
}

/* Read & process IHS/EIHS record
   return 0 on success, -1 on error  */
int
_bfd_vms_slurp_ihs (bfd *abfd, unsigned int offset)
{
  unsigned char *p = PRIV (vms_rec) + offset;
  unsigned int gstvbn = bfd_getl32 (p + EIHS_S_L_GSTVBN);
  unsigned int gstsize ATTRIBUTE_UNUSED = bfd_getl32 (p + EIHS_S_L_GSTSIZE);
  unsigned int dstvbn = bfd_getl32 (p + EIHS_S_L_DSTVBN);
  unsigned int dstsize = bfd_getl32 (p + EIHS_S_L_DSTSIZE);
  unsigned int dmtvbn = bfd_getl32 (p + EIHS_S_L_DMTVBN);
  unsigned int dmtbytes = bfd_getl32 (p + EIHS_S_L_DMTBYTES);
  asection *section;

#if VMS_DEBUG
  vms_debug (8, "_bfd_vms_slurp_ihs\n");
  vms_debug (4, "EIHS record gstvbn %d gstsize %d dstvbn %d dstsize %d dmtvbn %d dmtbytes %d\n",
	     gstvbn, gstsize, dstvbn, dstsize, dmtvbn, dmtbytes);
#endif

  if (dstvbn)
    {
      flagword bfd_flags = SEC_HAS_CONTENTS | SEC_DEBUGGING;

      section = bfd_make_section (abfd, "$DST$");
      if (!section)
	return -1;

      section->size = dstsize;
      section->filepos = VMS_BLOCK_SIZE * (dstvbn - 1);

      if (!bfd_set_section_flags (abfd, section, bfd_flags))
	return -1;

      PRIV (dst_section) = section;
      abfd->flags |= (HAS_DEBUG | HAS_LINENO);
    }

  if (dmtvbn)
    {
      flagword bfd_flags = SEC_HAS_CONTENTS | SEC_DEBUGGING;

      section = bfd_make_section (abfd, "$DMT$");
      if (!section)
	return -1;

      section->size = dmtbytes;
      section->filepos = VMS_BLOCK_SIZE * (dmtvbn - 1);

      if (!bfd_set_section_flags (abfd, section, bfd_flags))
	return -1;
    }

  if (gstvbn)
    {
      flagword bfd_flags = SEC_HAS_CONTENTS;

      section = bfd_make_section (abfd, "$GST$");
      if (!section)
	return -1;

      if (bfd_seek (abfd, VMS_BLOCK_SIZE * (gstvbn - 1), SEEK_SET))
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return -1;
	}

      if (_bfd_vms_slurp_object_records (abfd) != 0)
	return -1;

      section->filepos = VMS_BLOCK_SIZE * (gstvbn - 1);
      section->size = bfd_tell (abfd) - section->filepos;

      if (!bfd_set_section_flags (abfd, section, bfd_flags))
	return -1;

      abfd->flags |= HAS_SYMS;
    }

  return 0;
}

/* Build a new module for the specified BFD.  */

static struct module *
new_module (bfd *abfd)
{
  struct module *module
    = (struct module *) bfd_zalloc (abfd, sizeof (struct module));
  module->file_table_count = 16; /* Arbitrary.  */
  module->file_table
    = bfd_malloc (module->file_table_count * sizeof (struct fileinfo));
  return module;
}

/* Parse debug info for a module and internalize it.  */

static void
parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
	      unsigned int length)
{
  unsigned char *maxptr = ptr + length, *src_ptr, *pcl_ptr;
  unsigned int prev_linum = 0, curr_linenum = 0;
  bfd_vma prev_pc = 0, curr_pc = 0;
  struct srecinfo *curr_srec, *srec;
  struct lineinfo *curr_line, *line;
  struct funcinfo *funcinfo;

  /* Initialize tables with zero element.  */
  curr_srec = (struct srecinfo *) bfd_zalloc (abfd, sizeof (struct srecinfo));
  module->srec_table = curr_srec;

  curr_line = (struct lineinfo *) bfd_zalloc (abfd, sizeof (struct lineinfo));
  module->line_table = curr_line;

  while (ptr < maxptr)
    {
      /* The first byte is not counted in the recorded length.  */
      int rec_length = bfd_getl16 (ptr) + 1;
      int rec_type = bfd_getl16 (ptr + 2);

#if VMS_DEBUG
      _bfd_vms_debug (2, "DST record: length %d, type %d\n",
		      rec_length, rec_type);
#endif

      switch (rec_type)
	{
	case DST_S_C_MODBEG:
	  module->name
	    = _bfd_vms_save_counted_string (ptr + DST_S_B_MODBEG_NAME);

	  curr_pc = 0;
	  prev_pc = 0;
	  curr_linenum = 0;
	  prev_linum = 0;

#if VMS_DEBUG
          _bfd_vms_debug (3, "module: %s\n", module->name);
#endif
	  break;

	case DST_S_C_MODEND:
#if VMS_DEBUG
          _bfd_vms_debug (3, "end module\n");
#endif
	  break;

	case DST_S_C_RTNBEG:
	  funcinfo = (struct funcinfo *)
	    bfd_zalloc (abfd, sizeof (struct funcinfo));
          funcinfo->name
	    = _bfd_vms_save_counted_string (ptr + DST_S_B_RTNBEG_NAME);
	  funcinfo->low = bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
	  funcinfo->next = module->func_table;
	  module->func_table = funcinfo;
    
#if VMS_DEBUG
          _bfd_vms_debug (3, "routine: %s at 0x%x\n",
			  funcinfo->name, funcinfo->low);
#endif
	  break;

	case DST_S_C_RTNEND:
	  module->func_table->high = module->func_table->low
	    + bfd_getl32 (ptr + DST_S_L_RTNEND_SIZE) - 1;

	  if (module->func_table->high > module->high)
	    module->high = module->func_table->high;

#if VMS_DEBUG
          _bfd_vms_debug (3, "end routine\n");
#endif
	  break;

	case DST_S_C_PROLOG:
#if VMS_DEBUG
          _bfd_vms_debug (3, "prologue\n");
#endif
	  break;

	case DST_S_C_EPILOG:
#if VMS_DEBUG
          _bfd_vms_debug (3, "epilog\n");
#endif
	  break;

	case DST_S_C_BLKBEG:
#if VMS_DEBUG
          _bfd_vms_debug (3, "block\n");
#endif
	  break;

	case DST_S_C_BLKEND:
#if VMS_DEBUG
          _bfd_vms_debug (3, "end block\n");
#endif
	  break;

	case DST_S_C_SOURCE:
	  src_ptr = ptr + DST_S_C_SOURCE_HEADER_SIZE;

#if VMS_DEBUG
	  _bfd_vms_debug (3, "source info\n");
#endif

	  while (src_ptr < ptr + rec_length)
	    {
	      int cmd = src_ptr[0], cmd_length, data;

	      switch (cmd)
		{
		case DST_S_C_SRC_DECLFILE:
		  {
		    unsigned int fileid
		      = bfd_getl16 (src_ptr + DST_S_W_SRC_DF_FILEID);
		    char *filename
		      = _bfd_vms_save_counted_string (src_ptr
			  + DST_S_B_SRC_DF_FILENAME);

		    while (fileid >= module->file_table_count)
		      {
			module->file_table_count *= 2;
			module->file_table
			  = bfd_realloc (module->file_table,
					 module->file_table_count
					   * sizeof (struct fileinfo));
		      }

		    module->file_table [fileid].name = filename;
		    module->file_table [fileid].srec = 1;
		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
#if VMS_DEBUG
		    _bfd_vms_debug (4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
				    fileid,
				    module->file_table [fileid].name);
#endif
		  }
		  break;

		case DST_S_C_SRC_DEFLINES_B:
		  /* Perform the association and set the next higher index
		     to the limit.  */
		  data = src_ptr[DST_S_B_SRC_UNSBYTE];
		  srec = (struct srecinfo *)
		    bfd_zalloc (abfd, sizeof (struct srecinfo));
		  srec->line = curr_srec->line + data;
		  srec->srec = curr_srec->srec + data;
		  srec->sfile = curr_srec->sfile;
		  curr_srec->next = srec;
		  curr_srec = srec;
		  cmd_length = 2;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_DEFLINES_B: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_DEFLINES_W:
		  /* Perform the association and set the next higher index
		     to the limit.  */
		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
		  srec = (struct srecinfo *)
		    bfd_zalloc (abfd, sizeof (struct srecinfo));
		  srec->line = curr_srec->line + data;
		  srec->srec = curr_srec->srec + data,
		  srec->sfile = curr_srec->sfile;
		  curr_srec->next = srec;
		  curr_srec = srec;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_DEFLINES_W: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_INCRLNUM_B:
		  data = src_ptr[DST_S_B_SRC_UNSBYTE];
		  curr_srec->line += data;
		  cmd_length = 2;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_SETFILE:
		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
		  curr_srec->sfile = data;
		  curr_srec->srec = module->file_table[data].srec;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_SETFILE: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_SETLNUM_L:
		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
		  curr_srec->line = data;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_SETLNUM_L: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_SETLNUM_W:
		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
		  curr_srec->line = data;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_SETLNUM_W: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_SETREC_L:
		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
		  curr_srec->srec = data;
		  module->file_table[curr_srec->sfile].srec = data;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_SETREC_L: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_SETREC_W:
		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
		  curr_srec->srec = data;
		  module->file_table[curr_srec->sfile].srec = data;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_SETREC_W: %d\n", data);
#endif
		  break;

		case DST_S_C_SRC_FORMFEED:
		  cmd_length = 1;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SRC_FORMFEED\n");
#endif
		  break;

		default:
		  (*_bfd_error_handler) (_("unknown source command %d"),
					 cmd);
		  cmd_length = 2;
		  break;
		}

	      src_ptr += cmd_length;
	    }
	  break;

	case DST_S_C_LINE_NUM:
	  pcl_ptr = ptr + DST_S_C_LINE_NUM_HEADER_SIZE;

#if VMS_DEBUG
	  _bfd_vms_debug (3, "line info\n");
#endif

	  while (pcl_ptr < ptr + rec_length)
	    {
	      /* The command byte is signed so we must sign-extend it.  */
	      int cmd = ((signed char *)pcl_ptr)[0], cmd_length, data;

	      switch (cmd)
		{
		case DST_S_C_DELTA_PC_W:
		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
		  curr_pc += data;
		  curr_linenum += 1;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_DELTA_PC_W: %d\n", data);
#endif
		  break;

		case DST_S_C_DELTA_PC_L:
		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
		  curr_pc += data;
		  curr_linenum += 1;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_DELTA_PC_L: %d\n", data);
#endif
		  break;

		case DST_S_C_INCR_LINUM:
		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
		  curr_linenum += data;
		  cmd_length = 2;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_INCR_LINUM: %d\n", data);
#endif
		  break;

		case DST_S_C_INCR_LINUM_W:
		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
		  curr_linenum += data;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_INCR_LINUM_W: %d\n", data);
#endif
		  break;

		case DST_S_C_INCR_LINUM_L:
		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
		  curr_linenum += data;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_INCR_LINUM_L: %d\n", data);
#endif
		  break;

		case DST_S_C_SET_LINUM_INCR:
		  (*_bfd_error_handler)
		    (_("DST_S_C_SET_LINUM_INCR not implemented"));
		  cmd_length = 2;
		  break;

		case DST_S_C_SET_LINUM_INCR_W:
		  (*_bfd_error_handler)
		    (_("DST_S_C_SET_LINUM_INCR_W not implemented"));
		  cmd_length = 3;
		  break;

		case DST_S_C_RESET_LINUM_INCR:
		  (*_bfd_error_handler)
		    (_("DST_S_C_RESET_LINUM_INCR not implemented"));
		  cmd_length = 1;
		  break;

		case DST_S_C_BEG_STMT_MODE:
		  (*_bfd_error_handler)
		    (_("DST_S_C_BEG_STMT_MODE not implemented"));
		  cmd_length = 1;
		  break;

		case DST_S_C_END_STMT_MODE:
		  (*_bfd_error_handler)
		    (_("DST_S_C_END_STMT_MODE not implemented"));
		  cmd_length = 1;
		  break;

		case DST_S_C_SET_LINUM_B:
		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
		  curr_linenum = data;
		  cmd_length = 2;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SET_LINUM_B: %d\n", data);
#endif
		  break;
	
		case DST_S_C_SET_LINE_NUM:
		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
		  curr_linenum = data;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SET_LINE_NUM: %d\n", data);
#endif
		  break;

		case DST_S_C_SET_LINUM_L:
		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
		  curr_linenum = data;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SET_LINUM_L: %d\n", data);
#endif
		  break;

		case DST_S_C_SET_PC:
		  (*_bfd_error_handler)
		    (_("DST_S_C_SET_PC not implemented"));
		  cmd_length = 2;
		  break;

		case DST_S_C_SET_PC_W:
		  (*_bfd_error_handler)
		    (_("DST_S_C_SET_PC_W not implemented"));
		  cmd_length = 3;
		  break;

		case DST_S_C_SET_PC_L:
		  (*_bfd_error_handler)
		    (_("DST_S_C_SET_PC_L not implemented"));
		  cmd_length = 5;
		  break;

		case DST_S_C_SET_STMTNUM:
		  (*_bfd_error_handler)
		    (_("DST_S_C_SET_STMTNUM not implemented"));
		  cmd_length = 2;
		  break;

		case DST_S_C_TERM:
		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
		  curr_pc += data;
		  cmd_length = 2;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_TERM: %d\n", data);
#endif
		  break;

		case DST_S_C_TERM_W:
		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
		  curr_pc += data;
		  cmd_length = 3;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_TERM_W: %d\n", data);
#endif
		  break;

		case DST_S_C_TERM_L:
		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
		  curr_pc += data;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_TERM_L: %d\n", data);
#endif
		  break;

		case DST_S_C_SET_ABS_PC:
		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
		  curr_pc = data;
		  cmd_length = 5;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "DST_S_C_SET_ABS_PC: 0x%x\n", data);
#endif
		  break;

		default:
		  if (cmd <= 0)
		    {
		      curr_pc -= cmd;
		      curr_linenum += 1;
		      cmd_length = 1;
#if VMS_DEBUG
		      _bfd_vms_debug (4, "bump pc to 0x%llx and line to %d\n",
				      curr_pc, curr_linenum);
#endif
		    }
		  else
		    {
		      (*_bfd_error_handler) (_("unknown line command %d"),
					     cmd);
		      cmd_length = 2;
		    }
		  break;
		}

	      if ((curr_linenum != prev_linum && curr_pc != prev_pc)
		  || cmd <= 0
		  || cmd == DST_S_C_DELTA_PC_L
		  || cmd == DST_S_C_DELTA_PC_W)
		{
		  line = (struct lineinfo *)
		    bfd_zalloc (abfd, sizeof (struct lineinfo));
		  line->address = curr_pc;
		  line->line = curr_linenum;

		  curr_line->next = line;
		  curr_line = line;

		  prev_linum = curr_linenum;
		  prev_pc = curr_pc;
#if VMS_DEBUG
		  _bfd_vms_debug (4, "-> correlate pc 0x%llx with line %d\n",
				  curr_pc, curr_linenum);
#endif
		}

	      pcl_ptr += cmd_length;
	    }
	  break;

	case 0x17: /* Undocumented type used by DEC C to declare equates.  */
#if VMS_DEBUG
	  _bfd_vms_debug (3, "undocumented type 0x17\n");
#endif
	  break;

	default:
#if VMS_DEBUG
	  _bfd_vms_debug (3, "ignoring record\n");
#endif
	  break;

	}

      ptr += rec_length;
    }

  /* Finalize tables with EOL marker.  */
  srec = (struct srecinfo *) bfd_zalloc (abfd, sizeof (struct srecinfo));
  srec->line = (unsigned int) -1;
  srec->srec = (unsigned int) -1;
  curr_srec->next = srec;

  line = (struct lineinfo *) bfd_zalloc (abfd, sizeof (struct lineinfo));
  line->line = (unsigned int) -1;
  line->address = (bfd_vma) -1;
  curr_line->next = line;

  /* Advertise that this module has been parsed.  This is needed
     because parsing can be either performed at module creation
     or deferred until debug info is consumed.  */
  SET_MODULE_PARSED (module);
}

/* Build the list of modules for the specified BFD.  */

static struct module *
build_module_list (bfd *abfd)
{
  struct module *module, *list = NULL;
  asection *dmt;

  if ((dmt = bfd_get_section_by_name (abfd, "$DMT$")))
    {
      /* We have a DMT section so this must be an image.  Parse the
	 section and build the list of modules.  This is sufficient
	 since we can compute the start address and the end address
	 of every module from the section contents.  */
      bfd_size_type size = bfd_get_section_size (dmt);
      unsigned char *ptr, *end;

      ptr = (unsigned char *) bfd_alloc (abfd, size);
      if (! ptr)
	return NULL;

      if (! bfd_get_section_contents (abfd, dmt, ptr, 0, size))
	return NULL;

#if VMS_DEBUG
      _bfd_vms_debug (2, "DMT\n");
#endif

      end = ptr + size;

      while (ptr < end)
	{
	  /* Each header declares a module with its start offset and size
	     of debug info in the DST section, as well as the count of
	     program sections (i.e. address spans) it contains.  */
	  int modbeg = bfd_getl32 (ptr + DBG_S_L_DMT_MODBEG);
	  int size = bfd_getl32 (ptr + DBG_S_L_DST_SIZE);
	  int count = bfd_getl16 (ptr + DBG_S_W_DMT_PSECT_COUNT);
	  ptr += DBG_S_C_DMT_HEADER_SIZE;

#if VMS_DEBUG
	  _bfd_vms_debug (3, "module: modbeg = %d, size = %d, count = %d\n",
			  modbeg, size, count);
#endif

	  /* We create a 'module' structure for each program section since
	     we only support contiguous addresses in a 'module' structure.
	     As a consequence, the actual debug info in the DST section is
	     shared and can be parsed multiple times; that doesn't seem to
	     cause problems in practice.  */
	  while (count-- > 0)
	    {
	      int start = bfd_getl32 (ptr + DBG_S_L_DMT_PSECT_START);
	      int length = bfd_getl32 (ptr + DBG_S_L_DMT_PSECT_LENGTH);
	      module = new_module (abfd);
	      module->modbeg = modbeg;
	      module->size = size;
	      module->low = start;
	      module->high = start + length;
	      module->next = list;
	      list = module;
	      ptr += DBG_S_C_DMT_PSECT_SIZE;

#if VMS_DEBUG
	      _bfd_vms_debug (4, "section: start = 0x%x, length = %d\n",
			      start, length);
#endif
	    }
	}
    }
  else
    {
      /* We don't have a DMT section so this must be an object.  Parse
	 the module right now in order to compute its start address and
	 end address.  */
      module = new_module (abfd);
      parse_module (abfd, module, PRIV (dst_section)->contents,
		    PRIV (dst_ptr_end) - PRIV (dst_section)->contents);
      list = module;
    }

  return list;
}

/* Calculate and return the name of the source file and the line nearest
   to the wanted location in the specified module.  */

static bfd_boolean
module_find_nearest_line (bfd *abfd, struct module *module, bfd_vma addr,
			  const char **file, const char **func, 
			  unsigned int *line)
{
  struct funcinfo *funcinfo;
  struct lineinfo *lineinfo;
  struct srecinfo *srecinfo;
  bfd_boolean ret = FALSE;

  /* Parse this module if that was not done at module creation.  */
  if (! IS_MODULE_PARSED (module))
    {
      unsigned int size = module->size;
      unsigned int modbeg = PRIV (dst_section)->filepos + module->modbeg;
      unsigned char *buffer = (unsigned char *) bfd_malloc (module->size);

      if (bfd_seek (abfd, modbeg, SEEK_SET) != 0
	  || bfd_bread (buffer, size, abfd) != size)
	{
	  bfd_set_error (bfd_error_no_debug_section);
	  return FALSE;
	}

      parse_module (abfd, module, buffer, size);
      free (buffer);
    }

  /* Find out the function (if any) that contains the address.  */
  for (funcinfo = module->func_table; funcinfo; funcinfo = funcinfo->next)
    if (addr >= funcinfo->low && addr <= funcinfo->high)
      {
        *func = funcinfo->name;
	ret = TRUE;
	break;
      }

  /* Find out the source file and the line nearest to the address.  */
  for (lineinfo = module->line_table; lineinfo; lineinfo = lineinfo->next)
    if (lineinfo->next && addr < lineinfo->next->address)
      {
	for (srecinfo = module->srec_table; srecinfo; srecinfo = srecinfo->next)
	  if (srecinfo->next && lineinfo->line < srecinfo->next->line)
	    {
	      if (srecinfo->sfile > 0)
		{
		  *file = module->file_table[srecinfo->sfile].name;
		  *line = srecinfo->srec + lineinfo->line - srecinfo->line;
		}
	      else
		{
		  *file = module->name;
		  *line = lineinfo->line;
		}
	      return TRUE;
	    }

	break;
      }

  return ret;
}

/* Provided a BFD, a section and an offset into the section, calculate and
   return the name of the source file and the line nearest to the wanted
   location.  */

bfd_boolean
_bfd_vms_find_nearest_dst_line (bfd *abfd, asection *section,
				asymbol **symbols ATTRIBUTE_UNUSED,
				bfd_vma offset, const char **file,
				const char **func, unsigned int *line)
{
  struct module *module;

  /* What address are we looking for?  */
  bfd_vma addr = section->vma + offset;

  *file = NULL;
  *func = NULL;
  *line = 0;

  if (PRIV (dst_section) == NULL)
    return FALSE;

  if (PRIV (modules) == NULL)
    {
      PRIV (modules) = build_module_list (abfd);
      if (PRIV (modules) == NULL)
        return FALSE;
    }

  for (module = PRIV (modules); module; module = module->next)
    if (addr >= module->low && addr <= module->high)
      return module_find_nearest_line (abfd, module, addr, file, func, line);

  return FALSE;
}

/* Process EDBG/ETBT record.
   Return 0 on success, -1 on error  */

static int
vms_slurp_debug (bfd *abfd)
{
  if (PRIV (dst_section) == NULL)
    {
      /* We have no way to find out beforehand how much debug info there
	 is in an object file, so pick an initial amount and grow it as
	 needed later.  */
      flagword flags = SEC_HAS_CONTENTS | SEC_DEBUGGING | SEC_RELOC;
      asection *section = bfd_make_section (abfd, "$DST$");
      if (!section)
	return -1;
      section->size = 1024;
      if (!bfd_set_section_flags (abfd, section, flags))
	return -1;
      section->contents = ((unsigned char *)
			   bfd_zmalloc (section->size));
      if (section->contents == NULL)
	return -1;
      section->filepos = (unsigned int)-1;
      PRIV (dst_section) = section;
    }

  PRIV (image_section) = PRIV (dst_section);
  PRIV (image_ptr) = PRIV (dst_section)->contents;
 
  return _bfd_vms_slurp_tir (abfd, EOBJ_S_C_ETIR);
}

/* Process DBG/EDBG record.
   Return 0 on success, -1 on error.  */

int
_bfd_vms_slurp_dbg (bfd *abfd, int objtype ATTRIBUTE_UNUSED)
{
#if VMS_DEBUG
  _bfd_vms_debug (2, "DBG/EDBG\n");
#endif

  abfd->flags |= (HAS_DEBUG | HAS_LINENO);

  return vms_slurp_debug (abfd);
}

/* Process TBT/ETBT record.
   Return 0 on success, -1 on error.  */

int
_bfd_vms_slurp_tbt (bfd *abfd, int objtype ATTRIBUTE_UNUSED)
{
#if VMS_DEBUG
  _bfd_vms_debug (2, "TBT/ETBT\n");
#endif

  abfd->flags |= HAS_LINENO;

  return vms_slurp_debug (abfd);
}

/* Write DBG/EDBG record.  */

int
_bfd_vms_write_dbg (bfd *abfd ATTRIBUTE_UNUSED, int objtype ATTRIBUTE_UNUSED)
{
#if VMS_DEBUG
  _bfd_vms_debug (2, "vms_write_dbg (%p, objtype)\n", abfd, objtype);
#endif

  return 0;
}

/* Write TBT/ETBT record.  */

int
_bfd_vms_write_tbt (bfd *abfd ATTRIBUTE_UNUSED, int objtype ATTRIBUTE_UNUSED)
{
#if VMS_DEBUG
  _bfd_vms_debug (2, "vms_write_tbt (%p, %d)\n", abfd, objtype);
#endif

  return 0;
}
