# Binutils Patches for Retro68

This (AI-generated) document describes the changes applied to binutils (currently 2.46) to support the
Retro68 toolchain targeting classic Mac OS (m68k and PowerPC/XCOFF).

---

## 1. Enable the PowerPC XCOFF target unconditionally

### What it does
The upstream `bfd/targets.c` wraps the `powerpc_xcoff_vec` target vector in
`#if 0` because it shares the same BFD magic number as RS/6000 and was
therefore disabled by default to avoid conflicts.  Retro68 needs this target
always available for the `powerpc-apple-macos` cross-compiler.

### Files changed
| File | Change |
|------|--------|
| `binutils/bfd/targets.c` | Changes `#if 0` to `#if 1` around the `powerpc_xcoff_vec` entry in `_bfd_target_vector[]`. |
| `binutils/bfd/config.bfd` | In the `powerpc-*-macos*` case, adds `targ_cflags=-DAIX_WEAK_SUPPORT` and `targ_selvecs=powerpc_xcoff_vec` (in addition to the already-present `targ_defvec`). |

### Re-applying to a newer binutils
Find the `powerpc_xcoff_vec` entry in `bfd/targets.c` and change its guard
from `#if 0` to `#if 1`.  In `bfd/config.bfd`, locate the
`powerpc-*-macos*` entry and add the two lines.

---

## 2. GAS: m68k-macos assembler format and AIX weak support

### What it does
- Registers ELF as the output format for `m68k-*-macos*` targets in the GAS
  target configuration (upstream only handled `m68k-*-elf*` and
  `m68k-*-sysv4*`).
- Extends the `AIX_WEAK_SUPPORT` preprocessor define (needed for the
  `C_WEAKEXT` symbol class used in XCOFF) to also cover `ppc-*-macos*`
  targets, not just AIX 5+ targets.

### Files changed
| File | Change |
|------|--------|
| `binutils/gas/configure.tgt` | Adds `m68k-*-macos*)  fmt=elf ;;` entry. |
| `binutils/gas/configure.ac` | Extends the `ppc-*-aix[5-9].*` pattern to also match `ppc-*-macos*` for `AC_DEFINE(AIX_WEAK_SUPPORT, 1, ...)`. |
| `binutils/gas/configure` | Generated `configure` updated to match. |

### Re-applying to a newer binutils
In `gas/configure.tgt`, add the `m68k-*-macos*` line adjacent to the other
`m68k-*-elf*` entries.  In `gas/configure.ac`, extend the `ppc-*-aix[5-9].*`
pattern to include `| ppc-*-macos*` and regenerate `configure`.

---

## 3. LD: custom linker script for `ppcmacos`

### What it does
The upstream `ld/emulparams/ppcmacos.sh` used the generic `aix` linker script
(`SCRIPT_NAME=aix`).  This is replaced with a new `ppcmacos` script that:

- Defines sections in the correct order for a classic Mac OS XCOFF executable:
  `.pad`, `.text`, `.data` (including the TOC and constructor table), `.bss`,
  `.loader`, and `.debug`.
- Aligns the text segment at `0x10000000 + SIZEOF_HEADERS`.
- Aligns the data segment to page boundaries relative to text.
- Includes `${CONSTRUCTING+CONSTRUCTORS}` in `.data` so that C++ global
  constructors and destructors are linked in.
- Does **not** import the `gdbserver` tool from the build system (see
  configure change below).

### Files changed
| File | Change |
|------|--------|
| `binutils/ld/emulparams/ppcmacos.sh` | Changes `SCRIPT_NAME=aix` to `SCRIPT_NAME=ppcmacos`. |
| `binutils/ld/scripttempl/ppcmacos.sc` | New file. The full linker script template (75 lines). |
| `binutils/configure` | Removes `gdbserver` from `host_tools` (prevents an unneeded build dependency). |

### Re-applying to a newer binutils
Copy `ppcmacos.sc` into `ld/scripttempl/`.  Change `SCRIPT_NAME` in
`ld/emulparams/ppcmacos.sh`.  The `configure` change (removing `gdbserver`)
should be verified against the current `configure.ac` and regenerated if
necessary.

---

## 4. LD/objdump: `AIX_WEAK_SUPPORT` for `powerpc-*-macos`

### What it does
The `AIX_WEAK_SUPPORT` flag enables proper handling of the `C_WEAKEXT`
symbol class in XCOFF object files.  Upstream only enabled it for AIX 5+
targets; Retro68 also needs it for `powerpc-*-macos`.

### Files changed
| File | Change |
|------|--------|
| `binutils/binutils/configure.ac` | Extends the `powerpc*-aix[5-9].*` pattern to include `| powerpc-*-macos` for the `OBJDUMP_DEFS="-DAIX_WEAK_SUPPORT"` assignment. |
| `binutils/binutils/configure` | Generated `configure` updated to match. |

### Re-applying to a newer binutils
In `binutils/configure.ac`, find the `OBJDUMP_DEFS` AIX pattern and extend
it to include `powerpc-*-macos`, then regenerate `configure`.

---

## 5. BFD/XCOFF: weak symbol handling fixes

### What it does
Several related fixes in the XCOFF linker to handle `bfd_link_hash_undefweak`
and `C_AIX_WEAKEXT` symbols correctly when linking Mac OS PowerPC executables:

### 5a. Do not report unresolved weak symbols as errors
`bfd/coff-rs6000.c` (`xcoff_ppc_relocate_section`): adds a check
`h->root.type != bfd_link_hash_undefweak` to the condition that reports an
undefined-symbol error.  Weak undefined symbols are allowed to remain
unresolved; they resolve to zero.

### 5b. Handle `undefweak` as zero in relocation
Same function: adds an `else if (h->root.type == bfd_link_hash_undefweak)`
branch that sets `sec = 0` and `val = 0`, matching the ELF convention that
a weak undefined symbol has value zero.

### 5c. Do not zero the size of `C_AIX_WEAKEXT` common sections
`bfd/xcofflink.c` (`xcoff_link_add_symbols`): when adding a common symbol to
the hash table, the original code unconditionally set `csect->size = 0`.  For
`C_AIX_WEAKEXT` symbols this must be preserved (see `AutomatedTests/LocalStatic.cc`).
Two guarded sites: once for the initial common-section creation, and once in the
duplicate-symbol resolution path where a `defweak` symbol should not trigger
the size zeroing.

### 5d. Do not propagate `XCOFF_WAS_UNDEFINED` through weak descriptor
`bfd/xcofflink.c` (`xcoff_mark_symbol`): when a descriptor's source symbol
is marked `XCOFF_WAS_UNDEFINED`, the flag was unconditionally propagated to
the descriptor.  Adds a guard so the flag is only propagated when the descriptor
is not `bfd_link_hash_undefweak`.

### 5e. Mark entry-point symbol before the static-section pass
`bfd/xcofflink.c` (`bfd_xcoff_size_dynamic_sections`): moves the
`xcoff_mark_symbol_by_name(entry, XCOFF_ENTRY)` call to *before* the
`else` branch that processes non-relocatable links, ensuring the entry-point
symbol is always marked with `XCOFF_ENTRY` regardless of link mode.

### Files changed
All changes are in `binutils/bfd/coff-rs6000.c` and `binutils/bfd/xcofflink.c`.

### Re-applying to a newer binutils
Each of these is a small, targeted change.  Locate the functions by name
(`xcoff_ppc_relocate_section`, `xcoff_link_add_symbols`, `xcoff_mark_symbol`,
`bfd_xcoff_size_dynamic_sections`) and apply the individual hunks.  The
`xcoff_link_add_symbols` changes reference `C_AIX_WEAKEXT`; verify the
constant name has not changed.

---

## 6. BFD/XCOFF: keep constructor and exception-table sections

### What it does
`bfd/xcofflink.c` (`xcoff_link_add_symbols`): when a symbol whose name starts
with `_GLOBAL__` (the GCC convention for constructor/destructor registration
functions and exception-frame entries) is encountered, its csect is marked
`SEC_KEEP` so that the XCOFF garbage-collector does not discard it.

A second loop in `bfd_xcoff_size_dynamic_sections` then explicitly calls
`xcoff_mark` on all sections with `SEC_KEEP` set, ensuring they are included
in the final output even when `--gc-sections` is in effect.

### Files changed
| File | Change |
|------|--------|
| `binutils/bfd/xcofflink.c` | Adds the `_GLOBAL__` name prefix check setting `SEC_KEEP`, and the `SEC_KEEP` mark loop. |

### Re-applying to a newer binutils
Find `xcoff_link_add_symbols` and `bfd_xcoff_size_dynamic_sections`; apply
the two hunks in sequence.

---

## 7. ELF GC: keep `.macsbug` sections adjacent to their function

### What it does
During ELF section garbage collection (`bfd/elflink.c`, `_bfd_elf_gc_mark`),
after marking a section as live, checks whether the *next* section in the
section list has a name equal to the current section's name plus `.macsbug`.
If so, that section is also marked live.

This ensures that per-function MacsBug symbol records (which GCC places in
`.text.funcname.macsbug` sections when `-ffunction-sections` is active) are
not stripped by the linker's `--gc-sections` pass.

### Files changed
| File | Change |
|------|--------|
| `binutils/bfd/elflink.c` | Adds a name-comparison block in `_bfd_elf_gc_mark` after the `group_sec` check. |

### Re-applying to a newer binutils
Locate `_bfd_elf_gc_mark` in `bfd/elflink.c`.  After the group-section
recursion block and before "Look through the section relocs", insert the
new block.  The logic is: compare section names character by character, and
if the current name is a prefix of the next section's name and the suffix is
exactly `.macsbug`, mark the next section.

---

## 8. BFD/XCOFF: long filename in auxiliary records

### What it does
Fixes a buffer-overrun / incorrect read in `bfd/coff-rs6000.c`
(`_bfd_xcoff_swap_aux_in`) when a `C_FILE` auxiliary entry has more than one
auxiliary record (i.e. the filename is longer than `FILNMLEN` bytes and
spans multiple aux entries).

The fix: when `numaux > 1` and the current aux-entry index (`indx`) is 0,
copy `numaux * sizeof(AUXENT)` bytes instead of just `FILNMLEN` bytes.
The original unconditional `memcpy(…, FILNMLEN)` is retained for the normal
single-aux-entry case.

### Files changed
| File | Change |
|------|--------|
| `binutils/bfd/coff-rs6000.c` | Replaces the `memcpy` in the `else` branch of the `C_FILE`/`x_n.x_n.x_zeroes` check with a conditional copy. |

### Re-applying to a newer binutils
Locate `_bfd_xcoff_swap_aux_in` and the `else` branch of the filename read;
apply the length-conditional logic.

---

## 9. objdump: pretty-print `C_FILE` auxiliary entries

### What it does
Adds a `C_FILE` branch to `coff_print_aux` in `bfd/coffcode.h` that prints
the filename stored in the auxiliary entry, resolving the string-table offset
if necessary (the `x_zeroes` field indicates whether the name is inline or
referenced by offset into the COFF string table).

Without this, objdump prints raw hex bytes for `C_FILE` auxiliaries, making
XCOFF object dumps very hard to read.

### Files changed
| File | Change |
|------|--------|
| `binutils/bfd/coffcode.h` | Adds a `C_FILE` case at the top of `coff_print_aux` for RS6000COFF targets. |

### Re-applying to a newer binutils
In `bfd/coffcode.h`, find `coff_print_aux` and the existing `#ifdef RS6000COFF_C`
guard; insert the new `C_FILE` block immediately after the guard.

---

## 10. `zlib/zutil.h`: remove dead Metrowerks `fdopen` workaround

### What it does
Removes a block that defined `fdopen(fd, mode)` as `NULL` for old Metrowerks
CodeWarrior compilers on Mac OS.  This block is now dead code and confuses
modern compilers when `MACOS` or `TARGET_OS_MAC` is defined by the build
environment.

### Files changed
| File | Change |
|------|--------|
| `binutils/zlib/zutil.h` | Removes the `#ifndef Z_SOLO` / `fdopen` workaround block inside the `MACOS || TARGET_OS_MAC` guard. |

### Re-applying to a newer binutils
Locate the `#if defined(MACOS) || defined(TARGET_OS_MAC)` block in
`zlib/zutil.h` and remove the inner `fdopen` workaround (leave the
`OS_CODE 7` line).

---

## 11. BFD/XCOFF: restore `xcoff_obj_data` after `bfd_free_cached_info`

### What it does
In binutils 2.46, `xcoff_write_armap_big` calls `archive_iterator_begin` which
calls `member_layout_init`.  `member_layout_init` reads
`xcoff_data(member)->text_align_power` for dynamic XCOFF members to compute
page-alignment padding.

However, by the time `xcoff_write_armap_big` is called, `_bfd_compute_and_write_armap`
has already called `bfd_free_cached_info` on every archive member to free symbol
tables.  `_bfd_free_cached_info` sets `abfd->tdata.any = NULL` (via
`_bfd_generic_bfd_free_cached_info`), which zeroes `xcoff_obj_data` because
`tdata` is a union.  This causes a NULL-pointer dereference in
`member_layout_init` → segfault.

The fix adds `xcoff_bfd_free_cached_info` in `bfd/coff-rs6000.c` that saves
`xcoff_data(abfd)` before calling `_bfd_coff_free_cached_info` and restores
the pointer afterwards.  The underlying `xcoff_tdata` memory lives in the
BFD's `objalloc` and is only released when the BFD is closed, so restoring
the pointer is safe.

This bug did not exist in binutils 2.39 because `xcoff_write_armap_big`
did not call `archive_iterator_begin` in that version.

### Files changed
| File | Change |
|------|--------|
| `binutils/bfd/coff-rs6000.c` | Adds `xcoff_bfd_free_cached_info`; changes `#define _bfd_xcoff_bfd_free_cached_info` to use it instead of `coff_bfd_free_cached_info`. |

### Re-applying to a newer binutils
In `bfd/coff-rs6000.c`, find the `#define _bfd_xcoff_bfd_free_cached_info`
line and the `_bfd_xcoff_mkobject` function.  Insert `xcoff_bfd_free_cached_info`
immediately before `_bfd_xcoff_mkobject` and update the `#define` to reference it.

---

## Summary of patches to re-apply when upgrading binutils

| Priority | Area | Files | Complexity |
|----------|------|-------|------------|
| Essential | Enable XCOFF target | `bfd/targets.c`, `bfd/config.bfd` | Trivial |
| Essential | GAS m68k-macos format + AIX weak support | `gas/configure.tgt`, `gas/configure.ac` | Low |
| Essential | Custom `ppcmacos` linker script | `ld/emulparams/ppcmacos.sh`, `ld/scripttempl/ppcmacos.sc` | Low (new file) |
| Essential | XCOFF weak symbol fixes | `bfd/coff-rs6000.c`, `bfd/xcofflink.c` | Medium |
| Essential | Keep constructor/EH sections | `bfd/xcofflink.c` | Low |
| Essential | Restore xcoff_obj_data after free_cached_info | `bfd/coff-rs6000.c` | Low |
| Important | ELF GC: keep `.macsbug` sections | `bfd/elflink.c` | Low |
| Important | AIX_WEAK_SUPPORT for objdump | `binutils/configure.ac` | Trivial |
| Quality | Long filename in XCOFF aux records | `bfd/coff-rs6000.c` | Low |
| Quality | objdump C_FILE pretty-print | `bfd/coffcode.h` | Low |
| Quality | Remove dead `fdopen` workaround | `zlib/zutil.h` | Trivial |
