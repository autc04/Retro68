/* seh pdata/xdata coff object file format
   Copyright 2009
   Free Software Foundation, Inc.

   This file is part of GAS.

   GAS is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3, or (at your option)
   any later version.

   GAS is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with GAS; see the file COPYING.  If not, write to the Free
   Software Foundation, 51 Franklin Street - Fifth Floor, Boston, MA
   02110-1301, USA.  */

#include "obj-coff-seh.h"

/* Forward declarations.  */
static seh_kind seh_get_target_kind (void);
static int seh_symbol (bfd *, const char *, const char *, const char *, asection *, int, int);
static void seh_reloc (bfd *, bfd_size_type, int, int);
static void save_relocs (asection *sec);
static asection *quick_section (bfd *abfd, const char *name, int flags, int align);
static void seh_symbol_init (bfd *abfd, unsigned int added);
static void seh_emit_rva (const char *);
static void seh_emit_long (const char *);
static void seh_make_globl (char *);
static segT seh_make_section (void);
static segT seh_make_section2 (const char *section_name, unsigned flags);
static char *seh_make_xlbl_name (seh_context *);
static char *make_seh_text_label (seh_context *c, symbolS **addr);

static void seh_write_text_eh_data (const char *hnd, const char *hnd_data);
static void seh_emit_rva (const char *name);
static int seh_needed_unwind_info (seh_context *);
static void seh_fill_pcsyms (const seh_context *c, char **, int *);
static size_t seh_getelm_data_size (const seh_context *, int, int);
static size_t seh_getsize_of_unwind_entry (seh_context *, int, int, int);
static void seh_make_unwind_entry (const seh_context *, char *, int, int, int, unsigned char *, size_t *, int);
static size_t seh_getsize_unwind_data (seh_context *);
static void seh_create_unwind_data (seh_context *, unsigned char *, size_t);
static void seh_make_function_entry_xdata (seh_context *, char *, char *, char *, unsigned char *, size_t *,int);
static seh_scope_elem *seh_x64_makescope_elem (seh_context *, const char *, const char *, const char *, const char *);

/* Local data.  */
static asymbol **symtab;
static int symptr;
static arelent *reltab = 0;
static int relcount = 0, relsize = 0;

static seh_context *seh_ctx_root = NULL;
static seh_context *seh_ctx = NULL;
static seh_context *seh_ctx_cur = NULL;

/* Write xdata for arm, sh3, sh4, and ppc.  */

static void
seh_write_text_eh_data (const char *hnd, const char *hnd_data)
{
  if (!hnd || *hnd==0)
    return;
  if (hnd[0] == '@')
    seh_emit_long ("0");
  else
    seh_emit_long (hnd);
  if (!hnd_data || hnd_data[0] == '@')
    seh_emit_long ("0");
  else
    seh_emit_long (hnd_data);
}

/* Generate initial pdata for x64 and mips.  */
static void
make_function_entry_pdata (seh_context *c)
{
  segT sec = NULL;
  segT current_seg = now_seg;
  subsegT current_subseg = now_subseg;

  sec = seh_make_section ();
  switch (seh_get_target_kind ())
    {
    case seh_kind_x64:
      subseg_set (sec, 0);
      seh_emit_rva (c->func_name);
      seh_emit_rva (c->end_symbol);
      seh_emit_rva (c->xdata_first);
      break;
    case seh_kind_mips:
      subseg_set (sec, 0);
      seh_emit_long (c->func_name);
      seh_emit_long (c->end_symbol);
      if (c->handler_name == NULL)
	seh_emit_long ("0");
      else if (c->handler_name[0] == '@')
	{
	  if (strcasecmp (c->handler_name, "@1") == 0)
	    seh_emit_long ("1");
	  else
	    seh_emit_long ("0");
	}
      else
	seh_emit_long (c->handler_name);
      if (c->handler_data_name == NULL || c->handler_data_name[0] == '@')
	seh_emit_long ("0");
      else
	seh_emit_long (c->handler_data_name);
      seh_emit_long (c->endprologue_symbol ? c->endprologue_symbol : c->func_name);
      break;
    default:
      break;
    }
  subseg_set (current_seg, current_subseg);
}

static void
seh_x64_write_xdata (void)
{
  seh_context *h;
  size_t xdata_size = 0, count_syms = 0;
  size_t xdata_offs = 0;
  unsigned char *data;
  segT seg_xdata;
  bfd *abfd = stdoutput;

  h = seh_ctx_root;
  if (!h || h->done)
    return;
  while (h != NULL)
    {
      h->xdata_offset = xdata_size;
      xdata_size += seh_getsize_unwind_data (h);
      count_syms += h->count_syms;
      h = h->next;
    }

  if (xdata_size == 0)
    return;

  seh_symbol_init (abfd, count_syms);
  data = xmalloc (xdata_size);
  seg_xdata = quick_section (abfd, ".xdata", SEC_HAS_CONTENTS, 3);
  seg_xdata->contents = data;
  memset (data, 0, xdata_size);
  bfd_set_section_size (abfd, seg_xdata, xdata_size);
  h = seh_ctx_root;
  while (h != NULL)
    {
      xdata_offs = h->xdata_offset;
      h->section = seg_xdata;
      h->abfd = abfd;
      if (h->done == 0)
	{
	  h->done = 1;
	  seh_create_unwind_data (h, data, xdata_offs);
	  h->done = 1;
	}
      h = h->next;
    }
  save_relocs (seg_xdata);
  bfd_set_symtab (abfd, symtab, symptr);
  bfd_set_section_contents (abfd, seg_xdata, data, 0, xdata_size);
}

static void
seh_arm_create_pdata (seh_context *c, unsigned char *data, size_t pdata_offs)
{
  int idx;
  unsigned int val;
  valueT func_len = 0;
  valueT prolog_len = 0;
  valueT start_len = 0;

  func_len = resolve_symbol_value (c->end_addr);
  start_len = resolve_symbol_value (c->start_addr);
  if (c->endprologue_addr)
    prolog_len = resolve_symbol_value (c->endprologue_addr);
  else
    prolog_len = start_len;
  func_len -= start_len;
  prolog_len -= start_len;
  if (!c || !data)
    return;
  /* $$$$ */
  idx = seh_symbol (c->abfd, c->start_symbol, "", "", UNDSEC, BSF_GLOBAL, 0);
  seh_reloc (c->abfd, pdata_offs, BFD_RELOC_32, idx);
  val = (unsigned int) func_len;
  val <<= 8;
  val |= ((unsigned int) prolog_len & 0xffU);
  if (c->use_instruction_32)
    val |= 0x40000000U;
  if (c->handler_written)
    val |= 0x80000000U;
  bfd_put_32 (c->abfd, (bfd_vma) val, data + pdata_offs + 4);
}

static void
seh_arm_write_pdata (void)
{
  seh_context *h;
  size_t pdata_size = 0, count_syms = 0;
  size_t pdata_offs = 0;
  unsigned char *data;
  segT seg_pdata;
  bfd *abfd = stdoutput;

  h = seh_ctx_root;
  if (h == NULL || h->done)
    return;
  while (h != NULL)
    {
      h->xdata_offset = pdata_size;
      pdata_size += 8;
      count_syms += 1;
      h = h->next;
    }

  if (pdata_size == 0)
    return;

  seh_symbol_init (abfd, count_syms);
  data = xmalloc (pdata_size);
  seg_pdata = quick_section (abfd, ".pdata", SEC_HAS_CONTENTS, 3);
  seg_pdata->contents = data;
  memset (data, 0, pdata_size);
  bfd_set_section_size (abfd, seg_pdata, pdata_size);
  h = seh_ctx_root;
  while (h != NULL)
    {
      pdata_offs = h->xdata_offset;
      h->section = seg_pdata;
      h->abfd = abfd;
      if (h->done != 0)
	{
	  seh_arm_create_pdata (h, data, pdata_offs);
	  h->done = 1;
	}
      h = h->next;
    }
  save_relocs (seg_pdata);
  bfd_set_symtab (abfd, symtab, symptr);
  bfd_set_section_contents (abfd, seg_pdata, data, 0, pdata_size);
}

void
obj_coff_seh_do_final (void)
{
  switch (seh_get_target_kind ())
    {
    case seh_kind_mips:
    default:
      break;
    case seh_kind_arm:
      seh_arm_write_pdata ();
      break;
    case seh_kind_x64:
      seh_x64_write_xdata ();
      break;
    }
}

static void
seh_x64_make_prologue_element (int kind, int reg, bfd_vma off)
{
  seh_prologue_element *n;

  if (seh_ctx_cur == NULL)
    return;
  if (seh_ctx_cur->elems_count == seh_ctx_cur->elems_max)
    {
      seh_ctx_cur->elems = (seh_prologue_element *)
	xrealloc (seh_ctx_cur->elems,
		  ((seh_ctx_cur->elems_max + 8) * sizeof (seh_prologue_element)));
      seh_ctx_cur->elems_max += 8;
    }
  n = &seh_ctx_cur->elems[seh_ctx_cur->elems_count];
  memset (n, 0, sizeof (seh_prologue_element));
  n->kind = kind;
  n->reg = reg;
  n->offset = off;
  n->pc_symbol = make_seh_text_label (seh_ctx_cur, &(n->pc_addr));
  seh_ctx_cur->elems_count += 1;
}

static int
seh_x64_read_reg (const char *tok, int kind, int *regno)
{
  static const char *frame_regs[16] =
    { "cfa", "rcx", "rdx", "rbx", "rsp", "rbp","rsi","rdi",
      "r8","r9","r10","r11","r12","r13","r14","r15" };
  static const char *int_regs[16] =
    { "rax", "rcx", "rdx", "rbx", "rsp", "rbp","rsi","rdi",
      "r8","r9","r10","r11","r12","r13","r14","r15" };
  static const char *xmm_regs[16] =
    { "xmm0", "xmm1", "xmm2", "xmm3", "xmm4", "xmm5", "xmm6", "xmm7",
      "xmm8", "xmm9", "xmm10","xmm11","xmm12","xmm13","xmm14","xmm15" };
  static const char *mm_regs[16] =
    { "xmm0", "mm1", "mm2", "mm3", "mm4", "mm5", "mm6", "mm7",
      "xmm8", "mm9", "mm10","mm11","mm12","mm13","mm14","mm15" };
  const char **p = NULL;
  char name_end;
  char *symbol_name = NULL;
  int i;

  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  switch (kind)
    {
    case 0:
      p = frame_regs;
      break;
    case 1:
      p = int_regs;
      break;
    case 2:
      p = mm_regs;
      break;
    case 3:
      p = xmm_regs;
      break;
    default:
      abort ();
    }

  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    return 0;

  if (*input_line_pointer == '%')
    ++input_line_pointer;
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();

  for (i = 0; i < 16; i++)
    if (! strcasecmp (p[i], symbol_name))
      break;

  if (i == 16)
    as_warn (_("In %s we found the invalid register name %s.\n"),
	     tok, symbol_name);

  *input_line_pointer = name_end;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  if (*input_line_pointer == ',')
    ++input_line_pointer;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  *regno = i;
  return i != 16;
}

static int
seh_read_offset (const char *tok, bfd_vma *off)
{
  bfd_vma r, v = 0, base = 10;
  int had_one = 0;

  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  if (*input_line_pointer == '0')
    {
      ++input_line_pointer;
      had_one = 1;
      base = 8;
      switch ((*input_line_pointer))
	{
	case 'x':
	case 'X':
	  base = 16;
	  ++input_line_pointer;
	  break;
	case 'd':
	case 'D':
	  base = 10;
	  input_line_pointer++;
	  break;
	case 'o':
	case 'O':
	  base = 8;
	  input_line_pointer++;
	  break;
	}
    }
  while (*input_line_pointer != 0)
    {
      if (input_line_pointer[0] >= '0' && input_line_pointer[0] <='9')
	r = (bfd_vma) (input_line_pointer[0] - '0');
      else if (base == 16 && input_line_pointer[0] >= 'a' && input_line_pointer[0] <='f')
	r = (bfd_vma) ((input_line_pointer[0] - 'a') + 10);
      else if (base == 16 && input_line_pointer[0] >= 'A' && input_line_pointer[0] <='F')
	r = (bfd_vma) ((input_line_pointer[0] - 'A') + 10);
      else
	break;
      input_line_pointer++;
      v *= base;
      v += r;
      had_one = 1;
    }
  *off = v;
  if (had_one == 0)
    {
      as_warn (_("In %s we expect a number.\n"),
	       tok);
    }
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  if (*input_line_pointer == ',')
    ++input_line_pointer;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t')
    input_line_pointer++;
  return had_one != 0;
}

static void
obj_coff_seh_32 (int what)
{
  if (seh_ctx_cur == NULL)
    {
      as_fatal (_(".seh_eh requires to be in .seh_proc/.seh_endproc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  seh_ctx_cur->use_instruction_32 = (what ? 1 : 0);
  if (seh_get_target_kind () == seh_kind_arm)
    as_warn (_(".seh_%s32 is ignored for this target."), (what ? "" : "no"));
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_eh (int what ATTRIBUTE_UNUSED)
{
  if (seh_ctx_cur == NULL)
    {
      as_fatal (_(".seh_eh requires to be in .seh_proc/.seh_endproc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  if (seh_get_target_kind () == seh_kind_arm)
    {
      seh_ctx_cur->handler_written = 1;
      /* write block to .text if exception handler is set.  */
      seh_write_text_eh_data (seh_ctx_cur->handler_name, seh_ctx_cur->handler_data_name);
    }
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_handler (int what ATTRIBUTE_UNUSED)
{
  char *symbol_name;
  char name_end;

  if (seh_ctx_cur == NULL)
    {
      as_fatal (_(".seh_handler requires to be in .seh_proc/.seh_endproc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    {
      as_fatal (_(".seh_handler requires a handler lable name.\n"));
      demand_empty_rest_of_line ();
      return;
    }

  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();
  seh_ctx->handler_name = xstrdup (symbol_name);
  if (symbol_name[0] == '@')
    {
      if (strcasecmp (symbol_name, "@0") != 0 && strcasecmp (symbol_name, "@1") != 0
	  && strcasecmp (symbol_name, "@null") != 0)
	as_warn (_("Unknown constant value ,%s' for handler."), symbol_name);
    }
  *input_line_pointer = name_end;
  seh_ctx->handler_data_name = NULL;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  symbol_name = input_line_pointer;
  if (*input_line_pointer != '\n' && *input_line_pointer != 0)
    {
      name_end = get_symbol_end ();
      seh_ctx->handler_data_name = xstrdup (symbol_name);
      if (symbol_name[0] == '@')
	{
	  if (seh_get_target_kind () != seh_kind_x64)
	    as_fatal (_("For this target .seh_handler doesn't support constant user-data."));
	  else if (strcasecmp (symbol_name, "@unwind") != 0 &&
	           strcasecmp (symbol_name, "@except") != 0)
	    as_warn (_("For .seh_handler the constant ,%s' is ignored."), symbol_name);
	}
      *input_line_pointer = name_end;
    }
  if (seh_ctx_cur->handler_written)
    as_warn (_(".seh_handler is ignored as .seh_eh was seen before."));
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_scope (int what ATTRIBUTE_UNUSED)
{
  char *symbol_name,*beg = NULL,*end = NULL, *handl = NULL, *jmp = NULL;
  char name_end;

  if (seh_ctx_cur == NULL)
    {
      as_fatal (_(".seh_scope requires to be in .seh_proc/.seh_endproc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }

  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    {
      as_fatal (_(".seh_scope requires four symbol names.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();
  beg = xstrdup (symbol_name);
  *input_line_pointer = name_end;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    {
      as_fatal (_(".seh_scope requires three more symbol names.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();
  end = xstrdup (symbol_name);
  *input_line_pointer = name_end;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    {
      as_fatal (_(".seh_scope requires two more symbol names.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();
  handl = xstrdup (symbol_name);
  *input_line_pointer = name_end;
  if (*handl == '@')
    {
      if (strcasecmp (handl, "@0") != 0 && strcasecmp (handl, "@1") != 0
	  && strcasecmp (handl, "@null") != 0)
	as_warn (_("Unknown constant for handler ,%s'."), handl);
    }

  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    {
      as_fatal (_(".seh_scope requires one more symbol names.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();
  jmp = xstrdup (symbol_name);
  *input_line_pointer = name_end;
  if (*jmp == '@')
    {
      if (strcasecmp (jmp, "@0") != 0 && strcasecmp (handl, "@null") != 0)
	as_warn (_("Unknown constant for jump ,%s'."), jmp);
    }

  if (seh_get_target_kind () != seh_kind_x64)
    as_warn (_(".seh_scope is ignored for this target."));
  else
    seh_x64_makescope_elem (seh_ctx_cur, beg, end, handl, jmp);
  if (beg)
    free (beg);
  if (end)
    free (end);
  if (handl)
    free (handl);
  if (jmp)
    free (jmp);
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_proc (int what ATTRIBUTE_UNUSED)
{
  char *symbol_name;
  char name_end;

  if (seh_ctx_cur != NULL)
    {
      as_warn (_(".seh_proc has to be closed by .seh_endprog\n"));
      obj_coff_seh_endproc (0);
    }

  if (*input_line_pointer == 0 || *input_line_pointer == '\n')
    {
      as_fatal (_(".seh_proc requires function lable name.\n"));
      demand_empty_rest_of_line ();
      return;
    }

  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  symbol_name = input_line_pointer;
  name_end = get_symbol_end ();

  if (seh_ctx == NULL)
    seh_ctx_root = seh_ctx = (seh_context *) xmalloc (sizeof (seh_context));
  else
    {
      seh_ctx->next = (seh_context *) xmalloc (sizeof (seh_context));
      seh_ctx = seh_ctx->next;
    }
  seh_ctx_cur = seh_ctx;
  memset (seh_ctx, 0, sizeof (seh_context));

  seh_ctx->func_name = xstrdup (symbol_name);
  *input_line_pointer = name_end;
  while (*input_line_pointer == ' ' || *input_line_pointer == '\t' || *input_line_pointer == ',')
    input_line_pointer++;
  seh_ctx->start_symbol = make_seh_text_label (seh_ctx_cur, &(seh_ctx_cur->start_addr));
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_endproc  (int what ATTRIBUTE_UNUSED)
{
  if (seh_ctx_cur == NULL)
    {
      as_warn (_(".seh_endprog without prior .seh_proc (ignored)\n"));
      demand_empty_rest_of_line ();
      return;
    }
  seh_ctx->end_symbol = make_seh_text_label (seh_ctx, &(seh_ctx->end_addr));
  seh_ctx->xdata_first = seh_make_xlbl_name (seh_ctx);
  make_function_entry_pdata (seh_ctx);
  seh_ctx_cur = NULL;
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_push  (int what)
{
  int reg = 0;
  int kind = -1;

  if (seh_ctx_cur == NULL)
    {
      as_warn (_(".seh_push used outside of .seh_proc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  /* What 0:reg, 1:pushframe.  */
  switch (what)
    {
    case 0:
      if (seh_x64_read_reg (".seh_push", 1, &reg))
	kind = UWOP_PUSH_NONVOL;
      else
	as_warn (_(".seh_pushreg expects register argument."));
      break;
    case 1:
      kind = UWOP_PUSH_MACHFRAME;
      break;
    default:
      abort ();
    }
  if (seh_get_target_kind () != seh_kind_x64)
    as_warn (_(".seh_save... is ignored for this target.\n"));
  else if (kind != -1)
    seh_x64_make_prologue_element (kind, reg, 0);
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_save  (int what)
{
  int reg;
  bfd_vma off;
  int kind;
  int ok = 1;

  /* what 0:reg, 1:mm, 2:xmm.  */
  switch (what)
    {
    case 0:
      ok &= seh_x64_read_reg (".seh_savereg", 1, &reg);
      kind = UWOP_SAVE_NONVOL;
      break;
    case 1:
      ok &= seh_x64_read_reg (".seh_savemm", 2, &reg);
      kind = UWOP_SAVE_XMM;
      break;
    case 2:
      ok &= seh_x64_read_reg (".seh_savexmm", 3, &reg);
      kind = UWOP_SAVE_XMM128;
      break;
    default:
      abort ();
    }
  ok &= seh_read_offset (".seh_save", &off);
  if (seh_ctx_cur == NULL)
    {
      as_warn (_(".seh_save used outside of .seh_proc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  if (seh_get_target_kind () != seh_kind_x64)
    as_warn (_(".seh_save... is ignored for this target.\n"));
  else
    seh_x64_make_prologue_element (kind, reg, off);
  demand_empty_rest_of_line ();
}

static void
obj_coff_seh_endprologue (int what ATTRIBUTE_UNUSED)
{
  if (seh_ctx_cur == NULL)
    {
      as_warn (_(".seh_endprologue used outside of .seh_proc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  if (seh_ctx_cur->endprologue_symbol != NULL)
    as_warn (_(".seh_endprologue used more then once in .seh_proc block.\n"));
  else
    seh_ctx_cur->endprologue_symbol = make_seh_text_label (seh_ctx_cur, &seh_ctx_cur->endprologue_addr);
}

static void
obj_coff_seh_stack_alloc (int what ATTRIBUTE_UNUSED)
{
  bfd_vma size;

  if (seh_ctx_cur == NULL)
    {
      as_warn (_(".seh_stackalloc used outside of .seh_proc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  if (seh_read_offset (".seh_stackalloc", &size))
    {
      if (seh_get_target_kind () != seh_kind_x64)
	as_warn (_(".seh_stackalloc is ignored for this target.\n"));
      else
	seh_x64_make_prologue_element (UWOP_ALLOC_LARGE, 0, size);
    }
}

static void
obj_coff_seh_setframe (int what ATTRIBUTE_UNUSED)
{
  int reg;
  int ok = 1;
  bfd_vma off;

  ok &= seh_x64_read_reg (".seh_setframe", 0, &reg);
  ok &= seh_read_offset (".seh_setframe", &off);
  if (seh_ctx_cur == NULL)
    {
      as_warn (_(".seh_setframe used outside of .seh_proc block.\n"));
      demand_empty_rest_of_line ();
      return;
    }
  if (ok)
    {
      seh_ctx_cur->framereg = reg;
      seh_ctx_cur->frameoff = off;
    }
  if (seh_get_target_kind () != seh_kind_x64)
    as_warn (_(".seh_setframe is ignored for this target.\n"));
  demand_empty_rest_of_line ();
}

/* Misc function helpers.  */
static void
seh_reloc (bfd *abfd, bfd_size_type address, int which_howto, int symidx)
{
  if (relcount >= relsize - 1)
    {
      relsize += 10;
      if (reltab)
	reltab = xrealloc (reltab, relsize * sizeof (arelent));
      else
	reltab = xmalloc (relsize * sizeof (arelent));
    }
  reltab[relcount].address = address;
  reltab[relcount].addend = 0;
  reltab[relcount].howto = bfd_reloc_type_lookup (abfd, which_howto);
  reltab[relcount].sym_ptr_ptr = symtab + symidx;
  relcount++;
}

static void
save_relocs (asection *sec)
{
  int i;

  sec->relocation = reltab;
  sec->reloc_count = relcount;
  sec->orelocation = xmalloc ((relcount + 1) * sizeof (arelent *));
  for (i = 0; i < relcount; i++)
    sec->orelocation[i] = sec->relocation + i;
  sec->orelocation[relcount] = 0;
  sec->flags |= SEC_RELOC;
  reltab = 0;
  relcount = relsize = 0;
}

static void
seh_symbol_init (bfd *abfd, unsigned int added)
{
  unsigned int oldcount;

  oldcount = bfd_get_symcount (abfd);
  symptr = oldcount;
  symtab = xmalloc ((oldcount + added + 6) * sizeof (asymbol *));
  if (oldcount > 0)
    memcpy (symtab, bfd_get_outsymbols (abfd), sizeof (asymbol *) * oldcount);
}

static int
seh_symbol (bfd *abfd, const char *n1, const char *n2, const char *n3,
            asection *sec, int flags, int addr)
{
  asymbol *sym;
  char *name = xmalloc (strlen (n1) + strlen (n2) + strlen (n3) + 1);
  int ret = symptr;

  strcpy (name, n1);
  strcat (name, n2);
  strcat (name, n3);
  sym = bfd_make_empty_symbol (abfd);
  sym->name = name;
  sym->section = sec;
  sym->flags = flags;
  sym->value = addr;
  symtab[symptr++] = sym;
  return ret;
}

static asection *
quick_section (bfd *abfd, const char *name, int flags, int align)
{
  asection *sec;
  asymbol *sym;

  sec = seh_make_section2 (name, flags);
  bfd_set_section_alignment (abfd, sec, align);
  /* Remember to undo this before trying to link internally!  */

  sym = bfd_make_empty_symbol (abfd);
  symtab[symptr++] = sym;
  sym->name = sec->name;
  sym->section = sec;
  sym->flags = BSF_LOCAL;
  sym->value = 0;

  return sec;
}

static seh_kind
seh_get_target_kind (void)
{
  if (!stdoutput)
    return seh_kind_unknown;
  switch (bfd_get_arch (stdoutput))
    {
    case bfd_arch_arm:
    case bfd_arch_powerpc:
    case bfd_arch_sh:
      return seh_kind_arm;
    case bfd_arch_i386:
      switch (bfd_get_mach (stdoutput))
	{
	case bfd_mach_x86_64:
	case bfd_mach_x86_64_intel_syntax:
	  return seh_kind_x64;
	default:
	  break;
	}
      /* FALL THROUGH.  */
    case bfd_arch_mips:
      return seh_kind_mips;
    case bfd_arch_ia64:
      /* Should return seh_kind_x64.  But not implemented yet.  */
      return seh_kind_unknown;
    default:
      break;
    }
  return seh_kind_unknown;
}

static void
seh_emit_rva (const char *name)
{
  char *p = (char *) xmalloc (strlen (name) + 1);
  char *s = input_line_pointer;

  strcpy (p, name);
  input_line_pointer = p;
  s_rva (4);
  input_line_pointer = s;
}

static void
seh_emit_long (const char *name)
{
  char *p = (char *) xmalloc (strlen (name) + 1);
  char *s = input_line_pointer;

  strcpy (p, name);
  input_line_pointer = p;
  cons (4);
  input_line_pointer = s;
}

static void
seh_make_globl (char *sym_name)
{
  char *s = input_line_pointer;

  input_line_pointer = sym_name;
  s_globl (4);
  input_line_pointer = s;
}

static segT
seh_make_section2 (const char *section_name, unsigned flags)
{
  char *name;
  segT sec;

  name = xmalloc (strlen (section_name) + 1);
  strcpy (name, section_name);

  sec = subseg_new (name, (subsegT) 0);
  bfd_set_section_flags (stdoutput, sec,
			 ((SEC_ALLOC | SEC_LOAD | SEC_READONLY | SEC_DATA | flags)
			  & bfd_applicable_section_flags (stdoutput)));

  return sec;
}

static segT
seh_make_section (void)
{
  static segT seg_pdata = NULL;
  segT sec = NULL;

  if (!seg_pdata)
    seg_pdata = seh_make_section2 (".pdata", 0);
  sec = seg_pdata;
  return sec;
}

static char *
seh_make_xlbl_name (seh_context *c)
{
  size_t len = strlen (".seh_xlbl_") + strlen (c->func_name) + 9 + 1;
  char *ret = (char*) xmalloc (len);

  if (!ret)
    as_fatal (_("Out of memory for xdata lable for %s"), c->func_name);
  else
    sprintf (ret, ".seh_xlbl_%s_%x", c->func_name, + c->xlbl_count);
  c->xlbl_count += 1;
  return ret;
}

static char *
make_seh_text_label (seh_context *c, symbolS **addr)
{
  char *sym_name;
  size_t len = strlen (".seh_tlbl_") + strlen (c->func_name) + 9 + 1;

  sym_name = (char *) xmalloc (len);
  if (!sym_name)
    as_fatal (_("Allocating memory for SEH's text symbol for %s failed"), c->func_name);
  sprintf (sym_name, ".seh_tlbl_%s_%x", c->func_name, c->tlbl_count);
  c->tlbl_count += 1;
  if (addr)
    {
      seh_make_globl (sym_name);
      *addr = colon (sym_name);
    }
  return sym_name;
}

/* x64 secific functions.  */

static void
seh_fill_pcsyms (const seh_context *c, char **names, int *idx)
{
  size_t i;
  int count = 1;
  valueT start_off = resolve_symbol_value (c->start_addr);
  valueT un_off;
  seh_prologue_element *e = c->elems;

  names[0] = c->start_symbol;
  idx[0] = 0;
  if (c->elems_count == 0)
    return;
  for (i = 0; i < c->elems_count; i++)
    {
      un_off = resolve_symbol_value (e[i].pc_addr);
      if ((un_off - start_off) > 255)
	{
	  names[count] = e[i].pc_symbol;
	  idx[count] = (int) i;
	  count++;
	  start_off = un_off;
	}
    }
}

static int
seh_needed_unwind_info (seh_context *c)
{
  size_t i;
  int count = 1;
  valueT start_off = resolve_symbol_value (c->start_addr);
  valueT un_off;
  seh_prologue_element *e = c->elems;

  if (c->elems_count == 0)
    return count;
  for (i = 0; i < c->elems_count; i++)
    {
      un_off = resolve_symbol_value (e[i].pc_addr);
      if ((un_off - start_off) > 255)
	{
	  count++;
	  start_off = un_off;
	}
    }
  return count;
}

static size_t
seh_getelm_data_size (const seh_context *c, int elm_start, int elm_end)
{
  size_t ret = PEX64_UWI_SIZEOF_UWCODE_ARRAY (elm_end - elm_start);

  while (elm_start < elm_end)
    {
      switch (c->elems[elm_start].kind)
	{
        case UWOP_PUSH_NONVOL:
	case UWOP_PUSH_MACHFRAME:
	  ret += 2;
	  break;
	case UWOP_SAVE_NONVOL:
	case UWOP_SAVE_XMM:
	case UWOP_SAVE_XMM128:
	  if ((c->elems[elm_start].offset & 7) != 0 ||
	      ((c->elems[elm_start].offset / 8) > 0xffff))
	    ret += 6;
	  else
	    ret += 4;
	  break;
	case UWOP_ALLOC_LARGE:
	  ret += 4;
	  break;
        default:
	  break;
	}
      elm_start++;
    }
  return ret;
}

static size_t
seh_getsize_of_unwind_entry (seh_context *c, int elm_start, int elm_end, int bechain)
{
  size_t ret = seh_getelm_data_size(c, elm_start, elm_end);

  c->count_syms += 1;
  if (bechain)
    {
      ret += 4 + 4;
      c->count_syms += 1;
      c->count_reloc += 1;
    }
  else
    {
      ret += 4;
      if (c->handler_name != NULL)
	{
	  if (c->handler_data_name != NULL
	      && c->handler_data_name[0] != '@')
	    {
	      ret += 4;
	      c->count_syms += 2;
	      c->count_reloc += 2;
	    }
	  else
	    {
	      ret += 8 + (c->scope_count * 4) * 4;
	      c->count_syms += (c->scope_count * 4) + 1;
	      c->count_reloc += (c->scope_count * 4) + 1;
	    }
	}
    }
  return ret;
}

static void
seh_make_unwind_entry (const seh_context *c, char *name, int elm_start, int elm_end, int bechain,
		       unsigned char *data, size_t *poffs, int no)
{
  size_t off = *poffs;
  size_t it;
  valueT start_off = resolve_symbol_value (c->start_addr);
  valueT end_prologue;
  size_t uwcodes = seh_getelm_data_size(c, elm_start, elm_end);
  unsigned int flag = UNW_FLAG_NHANDLER;
  int idx;

  if (c->handler_name != NULL)
    {
      flag = UNW_FLAG_EHANDLER;
      if (c->handler_data_name != NULL && c->handler_data_name[0] != '@')
	flag = UNW_FLAG_FHANDLER;
      else if (c->handler_data_name != NULL &&
	       strcasecmp (c->handler_data_name, "@unwind") == 0)
	flag = UNW_FLAG_UHANDLER;
    }
  if (!c->endprologue_addr)
    end_prologue = start_off;
  else
    end_prologue = resolve_symbol_value (c->endprologue_addr);
  seh_symbol (c->abfd, name, "", "", c->section, BSF_GLOBAL, (int) off);
  data[off++] = (1 | ((bechain ? UNW_FLAG_CHAININFO : flag) << 3));
  if (elm_start != 0)
    start_off = (valueT) c->elems[elm_start].offset;
  end_prologue -= start_off;
  if (end_prologue > 255)
    end_prologue = 255;
  data[off++] = (unsigned char) end_prologue;
  data[off++] = (unsigned char) (uwcodes / 2);
  data[off] = (unsigned char) c->framereg;
  data[off++] |= (unsigned char) ((c->frameoff / 16) << 4);
  off += uwcodes;
  if (bechain)
    {
      char n[100];

      sprintf (n,"%x", no);
      idx = seh_symbol (c->abfd, ".xdata_fct", c->func_name, n, UNDSEC, BSF_GLOBAL, (int) off);
      seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
      off += 4;
    }
  else if (c->handler_name != NULL)
    {
      if (flag == UNW_FLAG_FHANDLER)
	{
	  if (strcasecmp (c->handler_name, "@1") == 0)
	    bfd_put_32 (c->abfd, (bfd_vma) 1, &data[off]);
	  else if (c->handler_name[0] != '@')
	    {
	      idx = seh_symbol (c->abfd, c->handler_name, "", "", UNDSEC, BSF_GLOBAL, 0);
	      seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
	    }
	  off += 4;
	  idx = seh_symbol (c->abfd, c->handler_data_name, "", "", UNDSEC, BSF_GLOBAL, 0);
	  seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
	  off += 4;
	}
      else if (flag == UNW_FLAG_UHANDLER || flag == UNW_FLAG_EHANDLER)
	{
	  if (strcasecmp (c->handler_name, "@1") == 0)
	    bfd_put_32 (c->abfd, (bfd_vma) 1, &data[off]);
	  else if (c->handler_name[0] != '@')
	    {
	      idx = seh_symbol (c->abfd, c->handler_name, "", "", UNDSEC, BSF_GLOBAL, 0);
	      seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
	    }
	  off += 4;
	  bfd_put_32 (c->abfd, (bfd_vma) c->scope_count, &data[off]);
	  off += 4;
	  for (it = 0; it < c->scope_count; it++)
	    {
	      idx = seh_symbol (c->abfd, c->scopes[it].begin_addr, "", "", UNDSEC, BSF_GLOBAL, 0);
	      seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
	      off += 4;
	      idx = seh_symbol (c->abfd, c->scopes[it].end_addr, "", "", UNDSEC, BSF_GLOBAL, 0);
	      seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
	      off += 4;
	      if (c->scopes[it].handler_addr[0] == '@')
		{
		  if (strcasecmp (c->scopes[it].handler_addr, "@1") == 0)
		    bfd_put_32 (c->abfd, (bfd_vma) 1, &data[off]);
		}
	      else
		{
		  idx = seh_symbol (c->abfd, c->scopes[it].handler_addr, "", "", UNDSEC, BSF_GLOBAL, 0);
		  seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
		}
	      off += 4;
	      if (c->scopes[it].jump_addr[0] == '@')
		{
		  if (strcasecmp (c->scopes[it].jump_addr, "@1") == 0)
		    bfd_put_32 (c->abfd, (bfd_vma) 1, &data[off]);
		}
	      else
		{
		  idx = seh_symbol (c->abfd, c->scopes[it].jump_addr, "", "", UNDSEC, BSF_GLOBAL, 0);
		  seh_reloc (c->abfd, off, BFD_RELOC_RVA, idx);
		}
	      off += 4;
	    }
	}
    }
  *poffs = off;
}

static size_t
seh_getsize_unwind_data (seh_context *c)
{
  int need = seh_needed_unwind_info (c);
  int i;
  char **names = (char **) xmalloc (sizeof (char *) * need);
  char **pc_syms = (char **) xmalloc (sizeof (char *) * need);
  int *elm_start = (int *) xmalloc (sizeof (int) * (need + 1));
  size_t xdata_sz = 0;

  seh_fill_pcsyms (c, pc_syms, elm_start);
  elm_start[need] = c->elems_count;

  xdata_sz += ((12 * (size_t) need));
  c->count_syms += 5 * need;
  xdata_sz += (seh_getsize_of_unwind_entry (c, elm_start[0], elm_start[1], 1 != need) + 7) & ~7;
  for (i = 1; i < need; i++)
    xdata_sz += (seh_getsize_of_unwind_entry (c, elm_start[i], elm_start[i + 1], 1 != need) + 7) & ~7;

  /* Create lable names for .xdata unwind info.  */
  names[0] = c->xdata_first;
  for (i = 1; i < need; i++)
    names[i] = seh_make_xlbl_name (c);
  c->xdata_names = names;
  c->xdata_pcsyms = pc_syms;
  c->xdata_elm_start = elm_start;
  c->xdata_sz = xdata_sz;
  return xdata_sz;
}

static void
seh_create_unwind_data (seh_context *c, unsigned char *data, size_t offs)
{
  int need = seh_needed_unwind_info (c);
  int i;
  char **names = c->xdata_names;
  char **pc_syms = c->xdata_pcsyms;
  int *elm_start = c->xdata_elm_start;

  for (i = 1; i < need; i++)
    seh_make_function_entry_xdata (c, pc_syms[i], c->end_symbol, names[i], data, &offs, i);

  /* Generate the function entry. Remark, that just
     first is in .pdata section and already emitted.  */
  seh_make_unwind_entry (c, c->xdata_first, elm_start[0], elm_start[1], 1 != need, data, &offs, 1);
  for (i = 1; i < need; i++)
    seh_make_unwind_entry (c, names[i], elm_start[i], elm_start[i + 1], (i + 1) != need, data, &offs, i + 1);

  for (i = 1; i < need; i++)
    free (names[i]);
  free (names);
  free (pc_syms);
  free (elm_start);
  c->xdata_names = NULL;
  c->xdata_pcsyms = NULL;
  c->xdata_elm_start = NULL;
}

static void
seh_make_function_entry_xdata (seh_context *c, char *pc_start, char *pc_end, char *pc_xdata, unsigned char *data, size_t *poffs,int no)
{
  bfd_vma addr = (bfd_vma) *poffs;
  int idx;
  char s[100];

  if (!data)
    return;
  sprintf (s,"%x",no);
  seh_symbol (c->abfd, ".xdata_fct",c->func_name, s, c->section, BSF_GLOBAL, (int) poffs[0]);
  idx = seh_symbol (c->abfd, pc_start,"","", UNDSEC, BSF_GLOBAL,0);
  seh_reloc (c->abfd, addr, BFD_RELOC_RVA, idx);
  idx = seh_symbol (c->abfd, pc_end,"","", UNDSEC, BSF_GLOBAL,0);
  seh_reloc (c->abfd, addr + 4, BFD_RELOC_RVA, idx);
  idx = seh_symbol (c->abfd, pc_xdata,"","", UNDSEC, BSF_GLOBAL,0);
  seh_reloc (c->abfd, addr + 8, BFD_RELOC_RVA, idx);
  poffs[0] += 12;
}

static seh_scope_elem *
seh_x64_makescope_elem (seh_context *c, const char *begin, const char *end,
			const char *handler, const char *jmp)
{
  seh_scope_elem *r;

  if (!end || !begin)
    return NULL;
  if (c->scope_count >= c->scope_max)
    {
      seh_scope_elem *h = (seh_scope_elem *) xmalloc (sizeof (seh_scope_elem) * (c->scope_max + 8));
      memset (h, 0, sizeof (seh_scope_elem) * (c->scope_max + 8));
      if (c->scopes != NULL)
	memcpy (h, c->scopes, sizeof (seh_scope_elem) * c->scope_max);
      if (c->scopes != NULL)
	free (c->scopes);
      c->scopes = h;
      c->scope_max += 8;
    }
  r = &c->scopes[c->scope_count++];
  r->begin_addr = xstrdup (begin);
  r->end_addr = xstrdup (end);
  r->handler_addr = (!handler ? NULL : xstrdup (handler));
  r->jump_addr = (!jmp ? NULL : xstrdup (jmp));
  return r;
}
