# Design: `.eh_frame` FDE garbage collection for custom output sections (`.codeNNNNN`)

> **AI-generated.** This document was produced with the assistance of an AI
> language model and may contain inaccuracies. It describes the change as
> implemented on 2026-10-04.

- **Date:** 2026-10-04
- **Status:** implemented (2026-10-04)
- **Area:** `binutils/bfd/` (linker); consumers: `Elf2Mac/`, `libretro/`

## Summary

With `-Wl,-gc-sections`, GNU ld discards unused sections. For `.eh_frame` this
has two levels: whole input sections of dropped objects are swept away as
usual, and, within a kept input section, FDEs for functions whose code was
discarded are meant to be removed by
`_bfd_elf_discard_section_eh_frame` (which also merges duplicate CIEs and
recompacts the section).

That second step only ran for input sections mapped to an **output section
named `.eh_frame`**. Retro68's linker script instead places `KEEP(*(.eh_frame))`
inside each `.codeNNNNN` output section (one per loadable segment), so the
discard pass never ran and dead FDEs were kept.

This change makes `bfd_elf_discard_info` also process already-parsed `.eh_frame`
inputs that are mapped to an output section whose name is not `.eh_frame`,
grouped by output section. It is gated on `--gc-sections`. Non-GC links and the
standard dedicated-`.eh_frame` layout are unaffected.

This is the *second* half of the fix for the "duplicate `.eh_frame` relocation"
bug. The first half (already committed, see `BINUTILS-PATCHES.md` §12) stopped
`_bfd_elf_eh_frame_section_offset` from corrupting relocation offsets in the
"parsed but never discarded" state; this half removes the dead FDEs that state
was about.

## Background

`bfd_elf_discard_info` calls `_bfd_elf_parse_eh_frame` and
`_bfd_elf_discard_section_eh_frame` for the inputs of the output section found
by `bfd_get_section_by_name (output_bfd, ".eh_frame")`. With
`--gc-sections`, `bfd_elf_gc_sections` has already parsed every input
`.eh_frame` (to mark FDE relocations), setting
`sec_info_type = SEC_INFO_TYPE_EH_FRAME`, but the discard pass is skipped when
no output section is named `.eh_frame`. The result was the inconsistent
"parsed but never discarded" state fixed in §12.

Two other facts matter:

- The edit step, `_bfd_elf_write_section_eh_frame`, is dispatched from
  `elf_link_input_bfd` by the *input* section's `sec_info_type`, **not** by the
  output section name. So once the discard pass has set `removed`,
  `new_offset`, `rawsize` and `sec->size`, the contents are compacted and the
  dead fields' relocations are neutralised automatically.
- retro68 GCC emits `.eh_frame` inputs with no per-object zero terminator. The
  concatenated group in a `.codeNNNNN` is terminated solely by the script's
  `LONG(0)` (see `Elf2Mac/LdScript.cc`).

## Decisions

1. **Fix in bfd, not in Elf2Mac or the script.** The liveness decision needs
   `bfd_elf_reloc_symbol_deleted_p`, which depends on the linker's discarded
   sections; that information is gone by the time Elf2Mac runs. ld merges
   output sections by name, so a script-only solution cannot give the inputs a
   nested `.eh_frame` output section.
2. **Select the extra inputs by `sec_info_type == SEC_INFO_TYPE_EH_FRAME`,**
   not by name. During a GC link these are exactly the inputs that were parsed
   but not discarded. This avoids feeding non-`.eh_frame` inputs (e.g. `.text`)
   to `_bfd_elf_parse_eh_frame`, and it leaves the non-`.eh_frame` contents of
   the output section alone.
3. **Gate on `info->gc_sections`.** Without GC there is nothing to remove, and
   non-GC output stays byte-for-byte identical.
4. **Scope CIE merging per output section.** `find_merged_cie` uses one
   link-global hash table (`eh_info.u.dwarf.cies`). In Retro68 each `.codeNNNNN`
   becomes a separately loadable segment, and the runtime registers each
   segment's `.eh_frame` separately with `__register_frame_info`
   (`libretro/MultiSegApp.c`). An FDE must not reference a CIE in another
   segment, so the table is deleted before each output section's group.
5. **Do not apply the dedicated-output alignment/padding pass** to these
   sections. That pass pads each non-last input of the output section up to the
   output alignment; here the output section also contains `.text` and
   `.gcc_except_table`, so it would be wrong. It is unnecessary anyway:
   `_bfd_elf_discard_section_eh_frame` rounds each input's new size to 4, and
   GCC's `.eh_frame` inputs are 4-aligned.
6. **Keep the `rawsize == 0` guard from §12.** It remains the safety net for any
   parsed input that still does not reach the discard pass (e.g. excluded or
   unusual cases).

### Alternatives considered

- **Merge CIEs globally anyway.** Simplest, but produces cross-segment CIE
  pointers that break per-segment registration (dangling after unload). Not
  safe for multi-segment apps.
- **Have ld pass the list of eh_frame output sections to bfd.** Cleaner
  separation but adds ld/bfd API surface for no functional gain.
- **Separate `.eh_frame` output section + Elf2Mac relayout.** Contradicts the
  segment layout and drags in the dedicated-output alignment semantics.
- **Post-process in Elf2Mac.** Requires re-deriving liveness after the fact;
  fragile.

## Implementation

`binutils/bfd/elflink.c`:

- New static helper `discard_eh_frame_inputs (info, o, &eh_changed)` runs the
  discard pass for the already-parsed `.eh_frame` inputs of one output section
  `o`, returning `-1`/`0`/`1` and setting `*eh_changed`.
- `bfd_elf_discard_info` remembers the dedicated `.eh_frame` output in
  `eh_frame_out`, and after the existing block runs a `changed`-accumulating
  loop:

  ```c
  bool any_eh_changed = false;
  if (info->gc_sections)
    for (o = output_bfd->sections; o != NULL; o = o->next)
      {
        ... skip eh_frame_out, SEC_EXCLUDE, inputs without any EH_FRAME input ...
        htab_delete (eh_info.u.dwarf.cies); eh_info.u.dwarf.cies = NULL;
        r = discard_eh_frame_inputs (info, o, &eh_changed);
        if (r < 0) return -1;
        if (r > 0) changed = 1;
        if (eh_changed) any_eh_changed = true;
      }
  /* once, after every input has its new_offset set */
  if (any_eh_changed)
    elf_link_hash_traverse (..., _bfd_elf_adjust_eh_frame_global_symbol, NULL);
  ```

No changes were needed in `_bfd_elf_discard_section_eh_frame`,
`_bfd_elf_write_section_eh_frame`, or `_bfd_elf_eh_frame_section_offset`: they
were already output-name agnostic.

`_bfd_elf_adjust_eh_frame_global_symbol` walks the whole symbol table and uses
each symbol's own section to compute the delta, so it must run exactly once —
not per output section, which would apply the delta twice (and would use
`new_offset == 0` for sections not yet processed).

## Risks and open items

- **Cross-segment CIE merging** is the failure mode that per-output-section
  scoping prevents. In Retro68's script the Runtime segment (`.code00001`) is
  emitted first and is always resident, and all segments normally share a
  byte-identical CIE, so a link-global merge would be absorbed there and happen
  not to fault; the scoping is the conservative choice that does not rely on
  that. Fully isolating the hazard needs a CIE that occurs only in two
  *unloadable* segments and is first seen in the one that later gets unloaded.
  The unwinder parses lazily on m68k (`ATOMIC_FDE_FAST_PATH` is off: no
  `__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4`), so a test must actually unwind, not
  just start up.
- **Reliance on the script's `LONG(0)`.** All per-input terminators are removed
  for output sections whose last input is not `.eh_frame`; the terminator is
  then provided by the script. This is true for the current script; a script
  that omitted it would produce an unterminated table.
- **`.gcc_except_table` is not garbage-collected.** Removing FDEs drops the
  references to dead LSDA tables, but the tables themselves remain. That is the
  pre-existing TODO in `elf-eh-frame.c` (drop unused `.gcc_except_table`
  entries) and is out of scope here.
- **`Elf2Mac`/runtime have never seen an edited `.eh_frame`.** The edit is
  structural only (FDEs/CIEs removed, section compacted); for non-PIC
  executables the `absptr`→`pcrel` conversions are gated on `bfd_link_pic`, so
  field encodings are unchanged. Still, the edited tables need a real unwind
  test, not just a startup test.
- **`R_*_NONE` placeholders.** Neutralised relocations are anchored at the
  previous relocation's offset, so several may share an offset. `Elf2Mac` skips
  them (`SerializeRelocs` only sees relocations whose symbol index is non-zero),
  and the loader ignores `R_68K_NONE`. The `SerializeRelocs` duplicate abort
  therefore does not fire (verified: the link succeeds).

## Validation performed

Reproducer: the Executor gtest app linked with `-Wl,-gc-sections`, using the
in-tree toolchain and `RETRO68_REAL_LD` pointing at the rebuilt `ld-new`.

| Build | `.code00003` size | `.eh_frame` region | CIEs | FDEs | real relocs | real+real dup offsets |
|---|---|---|---|---|---|---|
| original (pre-§12) | 0x8da54 | – | – | – | – | 20 (the bug) |
| §12 only (offsets fixed, no discard) | 0x8da54 | 130108 | 130 | 2840 | 13027 | 0 |
| §12 + this change | 0x815d8 | 79808 | 2 | 1360 | 12886 | 0 |

- The section and `.eh_frame` region shrink by ~50 KB; 1480 FDEs and 128 CIEs
  are removed, and 141 relocations of removed FDEs become `R_*_NONE` (the real
  count never increases).
- The edited table parses cleanly: exactly one terminator, and every FDE's
  `CIE_delta` resolves to a CIE inside the same `.codeNNNNN` (no cross-segment
  CIE references).
- `Elf2Mac` links successfully (its `SerializeRelocs` duplicate abort does not
  fire) and the packaged app starts and runs instead of trapping at `pc 0x0`.
- Non-GC link regression: unchanged (17378 relocations, 0 duplicates, same
  section sizes), because the new loop is `gc_sections`-gated.
- Standard dedicated-`.eh_frame` links: the new loop skips the `.eh_frame`
  output section and finds no other parsed inputs, so they are unaffected.

### Multi-segment exception test

`AutomatedTests/MultiSegExceptions.cc` (with `MultiSegExceptions2.cc` and
`MultiSegExceptions.segmap`) adds the `M68K.MultiSegExceptions` ctest case. A
throwing function lives in a separate segment; the test throws and catches
(a) inside the main segment, (b) in the separate segment with the catch in the
main segment, (c) in the main segment after unloading that segment, and (d) in
that segment again after reloading it. `MultiSegExceptions2.cc` also defines an
unused throwing function so that the discard pass has to remove an FDE from that
segment's `.eh_frame`.

Result: the test passes, and a static parse of the resulting `.gdb` shows every
`__EH_FRAME_BEGIN__*` region terminated exactly once with
`cross_segment_cie = 0`, and the unused function's FDE removed (the throwing
segment ends up with one CIE and one FDE).

Caveat, as noted under Risks: this test does not fail without the CIE scoping,
because the Runtime segment is emitted first, is always resident, and carries a
byte-identical CIE.

The existing `M68K.Exceptions` and `M68K.Segments` cases, relinked with the
patched linker, still pass (each run individually; the test harness has an
unrelated tendency to hang when several cases are run in one `ctest`
invocation).

Still to do: a variant that isolates the scoping hazard (two unloadable
segments carrying a CIE that appears in no always-resident segment), and a
larger multi-segment sample.

## Consumer-side notes

These are properties of the consumers that any change in this area has to keep
in mind (distilled from the original investigation; they are not specific to
the test machine).

- Retro68 links ELF first (with `--emit-relocs`) and keeps it as the `.gdb`
  file; `Elf2Mac` converts the same ELF into the Mac-native `.code.bin` and the
  `CODE`/`RELA` resources. So the `.rela.codeNNNNN` output is what `Elf2Mac`
  consumes, and relocation-offset changes are visible to it directly.
- `Elf2Mac/Section.cc`:
  - `SetRela` silently drops relocations whose `r_offset` is outside
    `[sh_addr, sh_addr + sh_size - 4]` (there is a FIXME about "relocations
    beyond the end of the sections"). An offset bug can therefore show up as
    *missing* runtime relocations rather than as an error; check the
    `--emit-relocs` output when touching this code.
  - `GetRelocations` skips `R_*_NONE` (symbol index 0) and drops same-output-
    section `R_68K_PC32` (already resolved by ld), keeping `R_68K_32` and
    cross-section `R_68K_PC32`.
  - `ScanRelocs` resolves a section symbol + addend to the nearest real symbol;
    `FixRelocs` clears code references that come from the `.eh_frame` region
    (delimited by the `__EH_FRAME_BEGIN__NNNNN` marker) to *other* output
    sections.
- `Elf2Mac/Reloc.cc` `SerializeRelocs` encodes two delta streams terminated by a
  `0x00` byte. A duplicate offset, or an offset delta of zero, encodes as `0x00`
  and would silently truncate the stream — which is why an explicit duplicate
  abort was added. Hardening this encoding (length-prefixed streams or a
  non-zero terminator) is worthwhile but independent of the `.eh_frame` GC work.
- Runtime: `libretro/relocate.c` calls
  `__register_frame_info(&__EH_FRAME_BEGIN__, ...)`; `libretro/MultiSegApp.c`
  registers each segment's group on load and deregisters it on unload; libgcc's
  `unwind-dw2-fde.c` consumes a registered range as a linear CIE/FDE sequence
  terminated by a zero-length record.
- The two populations of "duplicate" relocation offsets seen in the original
  bug report are different: `R_*_NONE` placeholders anchored at the previous
  relocation's offset are intentional and inert, whereas two *real* relocations
  at one offset were the bug.

## Files changed

| File | Change |
|------|--------|
| `binutils/bfd/elflink.c` | New `discard_eh_frame_inputs` helper; `bfd_elf_discard_info` processes parsed `.eh_frame` inputs of non-`.eh_frame` output sections (GC only). |
| `BINUTILS-PATCHES.md` | New patch entry (§13). |
| `AutomatedTests/MultiSegExceptions.cc` | New multi-segment exception test (main segment). |
| `AutomatedTests/MultiSegExceptions2.cc` | Throwing functions for the separate segment, incl. an unused one. |
| `AutomatedTests/MultiSegExceptions.segmap` | Puts `MultiSegExceptions2.*` in its own segment. |
| `AutomatedTests/CMakeLists.txt` | Registers the `M68K.MultiSegExceptions` test. |

## Deferred / future work

- Enable the same processing for non-GC links (consistent CIE merging).
- GC `.gcc_except_table` (LSDA) entries for discarded functions.
- Attempt an upstream-shaped version that locates `.eh_frame` inputs without
  the output-section name restriction.

## References

- `BINUTILS-PATCHES.md` §12 (the `rawsize == 0` guard) and §13 (this change).
- `binutils/bfd/elflink.c`: `bfd_elf_gc_sections`, `bfd_elf_discard_info`,
  `discard_eh_frame_inputs`.
- `binutils/bfd/elf-eh-frame.c`: `_bfd_elf_parse_eh_frame`,
  `_bfd_elf_discard_section_eh_frame`, `find_merged_cie`,
  `_bfd_elf_eh_frame_section_offset`, `_bfd_elf_write_section_eh_frame`.
- `Elf2Mac/LdScript.cc` (the `__EH_FRAME_BEGIN__NNNNN` / `LONG(0)` layout),
  `Elf2Mac/Section.cc`, `Elf2Mac/Reloc.cc`.
- `libretro/relocate.c` (`__register_frame_info`), `libretro/MultiSegApp.c`
  (per-segment registration).
