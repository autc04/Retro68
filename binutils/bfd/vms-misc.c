/* vms-misc.c -- BFD back-end for VMS/VAX (openVMS/VAX) and
   EVAX (openVMS/Alpha) files.
   Copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
   2007, 2008, 2009  Free Software Foundation, Inc.

   Miscellaneous functions.

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

#if __STDC__
#include <stdarg.h>
#endif

#include "sysdep.h"
#include "bfd.h"
#include "bfdlink.h"
#include "libbfd.h"

#include "vms.h"

#define MIN(a,b) ((a) < (b) ? (a) : (b))

static int hash_string PARAMS ((const char *));
static asymbol *new_symbol PARAMS ((bfd *, char *));
static void maybe_adjust_record_pointer_for_object PARAMS ((bfd *));
static int vms_get_remaining_object_record PARAMS ((bfd *, int ));
static int vms_get_remaining_image_record PARAMS ((bfd *, int ));

#if VMS_DEBUG
/* Debug functions.  */

/* Debug function for all vms extensions evaluates environment
   variable VMS_DEBUG for a numerical value on the first call all
   error levels below this value are printed:

   Levels:
   1	toplevel bfd calls (functions from the bfd vector)
   2	functions called by bfd calls
   ...
   9	almost everything

   Level is also indentation level. Indentation is performed
   if level > 0.  */

void
_bfd_vms_debug (int level, char *format, ...)
{
  static int min_level = -1;
  static FILE *output = NULL;
  char *eptr;
  va_list args;
  int abslvl = (level > 0) ? level : - level;

  if (min_level == -1)
    {
      if ((eptr = getenv ("VMS_DEBUG")) != NULL)
	{
	  min_level = atoi (eptr);
	  output = stderr;
	}
      else
	min_level = 0;
    }
  if (output == NULL)
    return;
  if (abslvl > min_level)
    return;

  while (--level>0)
    fprintf (output, " ");
  va_start (args, format);
  vfprintf (output, format, args);
  fflush (output);
  va_end (args);
}

/* A debug function
   hex dump 'size' bytes starting at 'ptr'.  */

void
_bfd_hexdump (int level,
	      unsigned char *ptr,
	      int size,
	      int offset)
{
  unsigned char *lptr = ptr;
  int count = 0;
  long start = offset;

  while (size-- > 0)
    {
      if ((count%16) == 0)
	vms_debug (level, "%08lx:", start);
      vms_debug (-level, " %02x", *ptr++);
      count++;
      start++;
      if (size == 0)
	{
	  while ((count%16) != 0)
	    {
	      vms_debug (-level, "   ");
	      count++;
	    }
	}
      if ((count%16) == 0)
	{
	  vms_debug (-level, " ");
	  while (lptr < ptr)
	    {
	      vms_debug (-level, "%c", (*lptr < 32)?'.':*lptr);
	      lptr++;
	    }
	  vms_debug (-level, "\n");
	}
    }
  if ((count%16) != 0)
    vms_debug (-level, "\n");
}
#endif

/* Hash functions

   These are needed when reading an object file.  */

/* Allocate new vms_hash_entry
   keep the symbol name and a pointer to the bfd symbol in the table.  */

struct bfd_hash_entry *
_bfd_vms_hash_newfunc (struct bfd_hash_entry *entry,
		       struct bfd_hash_table *table,
		       const char *string)
{
  vms_symbol_entry *ret;

#if VMS_DEBUG
  vms_debug (5, "_bfd_vms_hash_newfunc (%p, %p, %s)\n", entry, table, string);
#endif

  if (entry == NULL)
    {
      ret = (vms_symbol_entry *)
	      bfd_hash_allocate (table, sizeof (vms_symbol_entry));
      if (ret ==  NULL)
	{
	  bfd_set_error (bfd_error_no_memory);
	  return NULL;
	}
      entry = (struct bfd_hash_entry *) ret;
    }

  /* Call the allocation method of the base class.  */
  ret = (vms_symbol_entry *) bfd_hash_newfunc (entry, table, string);
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_hash_newfunc ret %p\n", ret);
#endif

  ret->symbol = NULL;

  return (struct bfd_hash_entry *)ret;
}

/* Object file input functions.  */

/* Return type and size from record header (buf) on Alpha.  */

void
_bfd_vms_get_header_values (bfd * abfd ATTRIBUTE_UNUSED,
			    unsigned char *buf,
			    int *type,
			    int *size)
{
  if (type)
    *type = bfd_getl16 (buf);

  if (size)
    *size = bfd_getl16 (buf+2);

#if VMS_DEBUG
  vms_debug (10, "_bfd_vms_get_header_values type %x, size %x\n",
	     type ? *type : 0, size ? *size : 0);
#endif
}

/* Get next record from object file to vms_buf.
   Set PRIV(buf_size) and return it

   This is a little tricky since it should be portable.

   The openVMS object file has 'variable length' which means that
   read() returns data in chunks of (hopefully) correct and expected
   size.  The linker (and other tools on VMS) depend on that. Unix
   doesn't know about 'formatted' files, so reading and writing such
   an object file in a Unix environment is not trivial.

   With the tool 'file' (available on all VMS FTP sites), one
   can view and change the attributes of a file.  Changing from
   'variable length' to 'fixed length, 512 bytes' reveals the
   record size at the first 2 bytes of every record.  The same
   happens during the transfer of object files from VMS to Unix,
   at least with UCX, the DEC implementation of TCP/IP.

   The VMS format repeats the size at bytes 2 & 3 of every record.

   On the first call (file_format == FF_UNKNOWN) we check if
   the first and the third byte pair (!) of the record match.
   If they do it's an object file in an Unix environment or with
   wrong attributes (FF_FOREIGN), else we should be in a VMS
   environment where read() returns the record size (FF_NATIVE).

   Reading is always done in 2 steps:
    1. first just the record header is read and the size extracted,
    2. then the read buffer is adjusted and the remaining bytes are
       read in.

   All file I/O is done on even file positions.  */

#define VMS_OBJECT_ADJUSTMENT  2

static void
maybe_adjust_record_pointer_for_object (bfd *abfd)
{
  /* Set the file format once for all on the first invocation.  */
  if (PRIV (file_format) == FF_UNKNOWN)
    {
      if (PRIV (vms_rec)[0] == PRIV (vms_rec)[4]
	  && PRIV (vms_rec)[1] == PRIV (vms_rec)[5])
	PRIV (file_format) = FF_FOREIGN;
      else
	PRIV (file_format) = FF_NATIVE;
    }

  /* The adjustment is needed only in an Unix environment.  */
  if (PRIV (file_format) == FF_FOREIGN)
    PRIV (vms_rec) += VMS_OBJECT_ADJUSTMENT;
}

/* Get first record from file and return the file type.  */

int
_bfd_vms_get_first_record (bfd *abfd)
{
  unsigned int test_len;

#if VMS_DEBUG
  vms_debug (8, "_bfd_vms_get_first_record\n");
#endif

  if (PRIV (is_vax))
    test_len = 0;
  else
    /* Minimum is 6 bytes for objects (2 bytes size, 2 bytes record id,
       2 bytes size repeated) and 12 bytes for images (4 bytes major id,
       4 bytes minor id, 4 bytes length).  */
    test_len = 12;

  /* Size the main buffer.  */
  if (PRIV (buf_size) == 0)
    {
      /* On VAX there's no size information in the record, so
	 start with OBJ_S_C_MAXRECSIZ.  */
      bfd_size_type amt = (test_len ? test_len : OBJ_S_C_MAXRECSIZ);
      PRIV (vms_buf) = (unsigned char *) bfd_malloc (amt);
      PRIV (buf_size) = amt;
    }

  /* Initialize the record pointer.  */
  PRIV (vms_rec) = PRIV (vms_buf);

  /* We only support modules on VAX.  */
  if (PRIV (is_vax))
    {
      if (vms_get_remaining_object_record (abfd, test_len) <= 0)
	return FT_UNKNOWN;

#if VMS_DEBUG
      vms_debug (2, "file type is VAX module\n");
#endif

      return FT_MODULE;
    }

  if (bfd_bread (PRIV (vms_buf), test_len, abfd) != test_len)
    {
      bfd_set_error (bfd_error_file_truncated);
      return FT_UNKNOWN;
    }

  /* Is it an image?  */
  if ((bfd_getl32 (PRIV (vms_rec)) == EIHD_S_K_MAJORID)
      && (bfd_getl32 (PRIV (vms_rec) + 4) == EIHD_S_K_MINORID))
    {
      if (vms_get_remaining_image_record (abfd, test_len) <= 0)
	return FT_UNKNOWN;

#if VMS_DEBUG
      vms_debug (2, "file type is image\n");
#endif

      return FT_IMAGE;
    }

  /* Assume it's a module and adjust record pointer if necessary.  */
  maybe_adjust_record_pointer_for_object (abfd);

  /* But is it really a module?  */
  if (bfd_getl16 (PRIV (vms_rec)) <= EOBJ_S_C_MAXRECTYP
      && bfd_getl16 (PRIV (vms_rec) + 2) <= EOBJ_S_C_MAXRECSIZ)
    {
      if (vms_get_remaining_object_record (abfd, test_len) <= 0)
	return FT_UNKNOWN;

#if VMS_DEBUG
      vms_debug (2, "file type is module\n");
#endif

      return FT_MODULE;
    }

#if VMS_DEBUG
  vms_debug (2, "file type is unknown\n");
#endif

  return FT_UNKNOWN;
}

/* Implement step #1 of the object record reading procedure.
   Return the record type or -1 on failure.  */

int
_bfd_vms_get_object_record (bfd *abfd)
{
  unsigned int test_len;
  int type;

#if VMS_DEBUG
  vms_debug (8, "_bfd_vms_get_obj_record\n");
#endif

  if (PRIV (is_vax))
    test_len = 0;
  else
    {
      /* See _bfd_vms_get_first_record.  */
      test_len = 6;

      /* Skip odd alignment byte.  */
      if (bfd_tell (abfd) & 1)
	{
	  if (bfd_bread (PRIV (vms_buf), 1, abfd) != 1)
	    {
	      bfd_set_error (bfd_error_file_truncated);
	      return -1;
	    }
	}

      /* Read the record header  */
      if (bfd_bread (PRIV (vms_buf), test_len, abfd) != test_len)
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return -1;
	}

      /* Reset the record pointer.  */
      PRIV (vms_rec) = PRIV (vms_buf);
      maybe_adjust_record_pointer_for_object (abfd);
    }

  if (vms_get_remaining_object_record (abfd, test_len) <= 0)
    return -1;

  if (PRIV (is_vax))
    type = PRIV (vms_rec) [0];
  else
    type = bfd_getl16 (PRIV (vms_rec));

#if VMS_DEBUG
  vms_debug (8, "_bfd_vms_get_obj_record: rec %p, size %d, type %d\n",
	      PRIV (vms_rec), PRIV (rec_size), type);
#endif

  return type;
}

/* Implement step #2 of the object record reading procedure.
   Return the size of the record or 0 on failure.  */

static int
vms_get_remaining_object_record (bfd *abfd, int read_so_far)
{
#if VMS_DEBUG
  vms_debug (8, "vms_get_remaining_obj_record\n");
#endif

  if (PRIV (is_vax))
    {
      if (read_so_far != 0)
        abort ();

      PRIV (rec_size) = bfd_bread (PRIV (vms_buf), PRIV (buf_size), abfd);

      if (PRIV (rec_size) <= 0)
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return 0;
	}

      /* Reset the record pointer.  */
      PRIV (vms_rec) = PRIV (vms_buf);
    }
  else
    {
      unsigned int to_read;

      /* Extract record size.  */
      PRIV (rec_size) = bfd_getl16 (PRIV (vms_rec) + 2);

      if (PRIV (rec_size) <= 0)
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return 0;
	}

      /* That's what the linker manual says.  */
      if (PRIV (rec_size) > EOBJ_S_C_MAXRECSIZ)
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return 0;
	}

      /* Take into account object adjustment.  */
      to_read = PRIV (rec_size);
      if (PRIV (file_format) == FF_FOREIGN)
	to_read += VMS_OBJECT_ADJUSTMENT;

      /* Adjust the buffer.  */
      if (to_read > PRIV (buf_size))
	{
	  PRIV (vms_buf)
	    = (unsigned char *) bfd_realloc (PRIV (vms_buf), to_read);
	  if (PRIV (vms_buf) == NULL)
	    return 0;
	  PRIV (buf_size) = to_read;
	}

      /* Read the remaining record.  */
      to_read -= read_so_far;

#if VMS_DEBUG
      vms_debug (8, "vms_get_remaining_obj_record: to_read %d\n", to_read);
#endif

      if (bfd_bread (PRIV (vms_buf) + read_so_far, to_read, abfd) != to_read)
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return 0;
	}

      /* Reset the record pointer.  */
      PRIV (vms_rec) = PRIV (vms_buf);
      maybe_adjust_record_pointer_for_object (abfd);
    }

#if VMS_DEBUG
  vms_debug (8, "vms_get_remaining_obj_record: size %d\n", PRIV (rec_size));
#endif

  return PRIV (rec_size);
}

/* Implement step #2 of the record reading procedure for images.
   Return the size of the record or 0 on failure.  */

static int
vms_get_remaining_image_record (bfd *abfd, int read_so_far)
{
  unsigned int to_read;
  int remaining;

  /* Extract record size.  */
  PRIV (rec_size) = bfd_getl32 (PRIV (vms_rec) + EIHD_S_L_SIZE);

  if (PRIV (rec_size) > PRIV (buf_size))
    {
      PRIV (vms_buf) = bfd_realloc (PRIV (vms_buf), PRIV (rec_size));

      if (PRIV (vms_buf) == NULL)
	{
	  bfd_set_error (bfd_error_no_memory);
	  return 0;
	}

      PRIV (buf_size) = PRIV (rec_size);
    }

  /* Read the remaining record.  */
  remaining = PRIV (rec_size) - read_so_far;
  to_read = MIN (VMS_BLOCK_SIZE - read_so_far, remaining);

  while (remaining > 0)
    {
      if (bfd_bread (PRIV (vms_buf) + read_so_far, to_read, abfd) != to_read)
	{
	  bfd_set_error (bfd_error_file_truncated);
	  return 0;
	}

      read_so_far += to_read;
      remaining -= to_read;

      /* Eat trailing 0xff's.  */
      if (remaining > 0)
	while (PRIV (vms_buf) [read_so_far - 1] == 0xff)
	  read_so_far--;

      to_read = MIN (VMS_BLOCK_SIZE, remaining);
    }

  /* Reset the record pointer.  */
  PRIV (vms_rec) = PRIV (vms_buf);

  return PRIV (rec_size);
}

/* Copy sized string (string with fixed size) to new allocated area
   size is string size (size of record)  */

char *
_bfd_vms_save_sized_string (unsigned char *str, int size)
{
  char *newstr = bfd_malloc ((bfd_size_type) size + 1);

  if (newstr == NULL)
    return NULL;
  strncpy (newstr, (char *) str, (size_t) size);
  newstr[size] = 0;

  return newstr;
}

/* Copy counted string (string with size at first byte) to new allocated area
   ptr points to size byte on entry  */

char *
_bfd_vms_save_counted_string (unsigned char *ptr)
{
  int len = *ptr++;

  return _bfd_vms_save_sized_string (ptr, len);
}

/* Stack routines for vms ETIR commands.  */

/* Push value and section index.  */

void
_bfd_vms_push (bfd * abfd, uquad val, int psect)
{
  static int last_psect;

#if VMS_DEBUG
  vms_debug (4, "<push %016lx (%d) at %d>\n", val, psect, PRIV (stackptr));
#endif

  if (psect >= 0)
    last_psect = psect;

  PRIV (stack[PRIV (stackptr)]).value = val;
  PRIV (stack[PRIV (stackptr)]).psect = last_psect;
  PRIV (stackptr)++;
  if (PRIV (stackptr) >= STACKSIZE)
    {
      bfd_set_error (bfd_error_bad_value);
      (*_bfd_error_handler) (_("Stack overflow (%d) in _bfd_vms_push"), PRIV (stackptr));
      exit (1);
    }
}

/* Pop value and section index.  */

uquad
_bfd_vms_pop (bfd * abfd, int *psect)
{
  uquad value;

  if (PRIV (stackptr) == 0)
    {
      bfd_set_error (bfd_error_bad_value);
      (*_bfd_error_handler) (_("Stack underflow in _bfd_vms_pop"));
      exit (1);
    }
  PRIV (stackptr)--;
  value = PRIV (stack[PRIV (stackptr)]).value;
  if ((psect != NULL) && (PRIV (stack[PRIV (stackptr)]).psect >= 0))
    *psect = PRIV (stack[PRIV (stackptr)]).psect;

#if VMS_DEBUG
  vms_debug (4, "<pop %016lx(%d)>\n", value, PRIV (stack[PRIV (stackptr)]).psect);
#endif

  return value;
}

/* Object output routines.   */

/* Begin new record or record header
   write 2 bytes rectype
   write 2 bytes record length (filled in at flush)
   write 2 bytes header type (ommitted if rechead == -1).  */

void
_bfd_vms_output_begin (bfd * abfd, int rectype, int rechead)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_begin (type %d, head %d)\n", rectype,
	      rechead);
#endif

  _bfd_vms_output_short (abfd, (unsigned int) rectype);

  /* Save current output position to fill in length later.   */

  if (PRIV (push_level) > 0)
    PRIV (length_pos) = PRIV (output_size);

#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_begin: length_pos = %d\n",
	      PRIV (length_pos));
#endif

  /* Placeholder for length.  */
  _bfd_vms_output_short (abfd, 0);

  if (rechead != -1)
    _bfd_vms_output_short (abfd, (unsigned int) rechead);
}

/* Set record/subrecord alignment.   */

void
_bfd_vms_output_alignment (bfd * abfd, int alignto)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_alignment (%d)\n", alignto);
#endif

  PRIV (output_alignment) = alignto;
}

/* Prepare for subrecord fields.  */

void
_bfd_vms_output_push (bfd * abfd)
{
#if VMS_DEBUG
  vms_debug (6, "vms_output_push (pushed_size = %d)\n", PRIV (output_size));
#endif

  PRIV (push_level)++;
  PRIV (pushed_size) = PRIV (output_size);
}

/* End of subrecord fields.   */

void
_bfd_vms_output_pop (bfd * abfd)
{
#if VMS_DEBUG
  vms_debug (6, "vms_output_pop (pushed_size = %d)\n", PRIV (pushed_size));
#endif

  _bfd_vms_output_flush (abfd);
  PRIV (length_pos) = 2;

#if VMS_DEBUG
  vms_debug (6, "vms_output_pop: length_pos = %d\n", PRIV (length_pos));
#endif

  PRIV (pushed_size) = 0;
  PRIV (push_level)--;
}

/* Flush unwritten output, ends current record.  */

void
_bfd_vms_output_flush (bfd * abfd)
{
  int real_size = PRIV (output_size);
  int aligncount;
  int length;

#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_flush (real_size = %d, pushed_size %d at lenpos %d)\n",
	      real_size, PRIV (pushed_size), PRIV (length_pos));
#endif

  if (PRIV (push_level) > 0)
    length = real_size - PRIV (pushed_size);
  else
    length = real_size;

  if (length == 0)
    return;
  aligncount = (PRIV (output_alignment)
		- (length % PRIV (output_alignment))) % PRIV (output_alignment);

#if VMS_DEBUG
  vms_debug (6, "align: adding %d bytes\n", aligncount);
#endif

  while (aligncount-- > 0)
    {
      PRIV (output_buf)[real_size++] = 0;
      length++;
    }

  /* Put length to buffer.  */
  PRIV (output_size) = PRIV (length_pos);
  _bfd_vms_output_short (abfd, (unsigned int) length);

  if (PRIV (push_level) == 0)
    {
      /* File is open in undefined (UDF) format on VMS, but ultimately will be
	 converted to variable length (VAR) format.  VAR format has a length
	 word first which must be explicitly output in UDF format.  */
      bfd_bwrite (PRIV (output_buf) + 2, 2, abfd);
      bfd_bwrite (PRIV (output_buf), (size_t) real_size, abfd);
      PRIV (output_size) = 0;
    }
  else
    {
      PRIV (output_size) = real_size;
      PRIV (pushed_size) = PRIV (output_size);
    }
}

/* End record output.   */

void
_bfd_vms_output_end (bfd * abfd)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_end\n");
#endif

  _bfd_vms_output_flush (abfd);
}

/* Check remaining buffer size

   Return what's left.  */

int
_bfd_vms_output_check (bfd * abfd, int size)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_check (%d)\n", size);
#endif

  return (MAX_OUTREC_SIZE - (PRIV (output_size) + size + MIN_OUTREC_LUFT));
}

/* Output byte (8 bit) value.  */

void
_bfd_vms_output_byte (bfd * abfd, unsigned int value)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_byte (%02x)\n", value);
#endif

  bfd_put_8 (abfd, value & 0xff, PRIV (output_buf) + PRIV (output_size));
  PRIV (output_size) += 1;
}

/* Output short (16 bit) value.  */

void
_bfd_vms_output_short (bfd * abfd, unsigned int value)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_short (%04x)\n", value);
#endif

  bfd_put_16 (abfd, (bfd_vma) value & 0xffff,
	      PRIV (output_buf) + PRIV (output_size));
  PRIV (output_size) += 2;
}

/* Output long (32 bit) value.  */

void
_bfd_vms_output_long (bfd * abfd, unsigned long value)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_long (%08lx)\n", value);
#endif

  bfd_put_32 (abfd, (bfd_vma) value, PRIV (output_buf) + PRIV (output_size));
  PRIV (output_size) += 4;
}

/* Output quad (64 bit) value.  */

void
_bfd_vms_output_quad (bfd * abfd, uquad value)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_quad (%016lx)\n", value);
#endif

  bfd_put_64(abfd, value, PRIV (output_buf) + PRIV (output_size));
  PRIV (output_size) += 8;
}

/* Output c-string as counted string.  */

void
_bfd_vms_output_counted (bfd * abfd, char *value)
{
  int len;

#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_counted (%s)\n", value);
#endif

  len = strlen (value);
  if (len == 0)
    {
      (*_bfd_error_handler) (_("_bfd_vms_output_counted called with zero bytes"));
      return;
    }
  if (len > 255)
    {
      (*_bfd_error_handler) (_("_bfd_vms_output_counted called with too many bytes"));
      return;
    }
  _bfd_vms_output_byte (abfd, (unsigned int) len & 0xff);
  _bfd_vms_output_dump (abfd, (unsigned char *) value, len);
}

/* Output character area.  */

void
_bfd_vms_output_dump (bfd * abfd,
		      unsigned char *data,
		      int length)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_dump (%d)\n", length);
#endif

  if (length == 0)
    return;

  memcpy (PRIV (output_buf) + PRIV (output_size), data, (size_t) length);
  PRIV (output_size) += length;
}

/* Output count bytes of value.  */

void
_bfd_vms_output_fill (bfd * abfd,
		      int value,
		      int count)
{
#if VMS_DEBUG
  vms_debug (6, "_bfd_vms_output_fill (val %02x times %d)\n", value, count);
#endif

  if (count == 0)
    return;
  memset (PRIV (output_buf) + PRIV (output_size), value, (size_t) count);
  PRIV (output_size) += count;
}

/* This hash routine borrowed from GNU-EMACS, and strengthened slightly.  ERY.  */

static int
hash_string (const char *ptr)
{
  const unsigned char *p = (unsigned char *) ptr;
  const unsigned char *end = p + strlen (ptr);
  unsigned char c;
  int hash = 0;

  while (p != end)
    {
      c = *p++;
      hash = ((hash << 3) + (hash << 15) + (hash >> 28) + c);
    }
  return hash;
}

/* Generate a length-hashed VMS symbol name (limited to maxlen chars).  */

char *
_bfd_vms_length_hash_symbol (bfd * abfd, const char *in, int maxlen)
{
  unsigned long result;
  int in_len;
  char *new_name;
  const char *old_name;
  int i;
  static char outbuf[EOBJ_S_C_SYMSIZ+1];
  char *out = outbuf;

#if VMS_DEBUG
  vms_debug (4, "_bfd_vms_length_hash_symbol \"%s\"\n", in);
#endif

  if (maxlen > EOBJ_S_C_SYMSIZ)
    maxlen = EOBJ_S_C_SYMSIZ;

  /* Save this for later.  */
  new_name = out;

  /* We may need to truncate the symbol, save the hash for later.  */
  in_len = strlen (in);

  result = (in_len > maxlen) ? hash_string (in) : 0;

  old_name = in;

  /* Do the length checking.  */
  if (in_len <= maxlen)
    i = in_len;
  else
    {
      if (PRIV (flag_hash_long_names))
	i = maxlen-9;
      else
	i = maxlen;
    }

  strncpy (out, in, (size_t) i);
  in += i;
  out += i;

  if ((in_len > maxlen)
      && PRIV (flag_hash_long_names))
    sprintf (out, "_%08lx", result);
  else
    *out = 0;

#if VMS_DEBUG
  vms_debug (4, "--> [%d]\"%s\"\n", strlen (outbuf), outbuf);
#endif

  if (in_len > maxlen
	&& PRIV (flag_hash_long_names)
	&& PRIV (flag_show_after_trunc))
    printf (_("Symbol %s replaced by %s\n"), old_name, new_name);

  return outbuf;
}

/* Allocate and initialize a new symbol.  */

static asymbol *
new_symbol (bfd * abfd, char *name)
{
  asymbol *symbol;

#if VMS_DEBUG
  _bfd_vms_debug (7,  "new_symbol %s\n", name);
#endif

  symbol = bfd_make_empty_symbol (abfd);
  if (symbol == 0)
    return symbol;
  symbol->name = name;
  symbol->section = (asection *)(unsigned long)-1;

  return symbol;
}

/* Allocate and enter a new private symbol.  */

vms_symbol_entry *
_bfd_vms_enter_symbol (bfd * abfd, char *name)
{
  vms_symbol_entry *entry;

#if VMS_DEBUG
  _bfd_vms_debug (6,  "_bfd_vms_enter_symbol %s\n", name);
#endif

  entry = (vms_symbol_entry *)
	  bfd_hash_lookup (PRIV (vms_symbol_table), name, FALSE, FALSE);
  if (entry == 0)
    {
#if VMS_DEBUG
      _bfd_vms_debug (8,  "creating hash entry for %s\n", name);
#endif
      entry = (vms_symbol_entry *) bfd_hash_lookup (PRIV (vms_symbol_table),
						    name, TRUE, FALSE);
      if (entry != 0)
	{
	  asymbol *symbol;
	  symbol = new_symbol (abfd, name);
	  if (symbol != 0)
	    {
	      entry->symbol = symbol;
	      PRIV (gsd_sym_count)++;
	      abfd->symcount++;
	    }
	  else
	    entry = 0;
	}
      else
	(*_bfd_error_handler) (_("failed to enter %s"), name);
    }
  else
    {
#if VMS_DEBUG
      _bfd_vms_debug (8,  "found hash entry for %s\n", name);
#endif
    }

#if VMS_DEBUG
  _bfd_vms_debug (7, "-> entry %p, entry->symbol %p\n", entry, entry->symbol);
#endif
  return entry;
}
