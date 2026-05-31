# GCC Patches for Retro68

This document describes the changes applied to GCC 12.2.0 (and tracked via
`gcc-12.2.0-diff.patch`) to produce the Retro68 cross-compiler targeting
classic Mac OS (m68k and PowerPC).  The patch is large, but the functional
changes fall into a handful of clearly-scoped areas.  Build-system boilerplate
updates (automake 1.15→1.16, autoconf copyright bumps, `aclocal.m4` churn,
`Makefile.in` regeneration) are noted briefly but not detailed, because they
need to be re-generated rather than re-applied by hand.

---

## 1. New target: `m68k-*-macos`

### What it does
Adds a complete new GCC target triple `m68k-*-macos` for compiling classic
Macintosh 68k applications using the ELF-based toolchain that the rest of
Retro68 provides.

### Files changed / added
| File | Change |
|------|--------|
| `gcc/gcc/config.gcc` | Adds `m68k-*-macos*` stanza: sets default CPU to 68020, includes `m68k-none.h`, `m68kelf.h`, `m68kemb.h`, and the new `m68k-macos.h`; adds pragma object `m68k-mac-pragmas.o`. |
| `gcc/gcc/config/m68k/m68k-macos.h` | New file. Defines `LIBGCC_SPEC`, `LINK_SPEC`, `LIB_SPEC`, `CPP_SPEC` (`-Wno-trigraphs`), and `TARGET_OS_CPP_BUILTINS` (defines `macintosh` / `Macintosh`). |
| `gcc/gcc/config/m68k/t-macos` | New makefile fragment. Compiles `m68k-mac-pragmas.c` and restricts multilib to pre-68060/cpu32/fido CPUs. |
| `gcc/gcc/config/m68k/t-m68k` | Adds multilib CPU exclusions (same as above) and includes `m68k-passes.def` via `PASSES_EXTRA`. |
| `gcc/libgcc/config.host` | Adds `m68k-*-macos` host entry: sets `extra_parts` to `crtbegin.o`/`crtend.o` and includes the float-lib makefile fragment. |

### Re-applying to a newer GCC
Search `config.gcc` for the existing `m68k-*-elf*` block and add an analogous
`m68k-*-macos*` block immediately before or after it.  The new header file
`m68k-macos.h` and makefile fragments (`t-macos`, changes to `t-m68k`) can be
copied verbatim.  The `libgcc/config.host` entry mirrors the `m68k-*-elf*`
entry – copy and adapt it.

---

## 2. New target: `powerpc-apple-macos`

### What it does
Adds a GCC target for compiling PowerPC Mac OS (pre-X) applications using
AIX/XCOFF object format.

### Files changed / added
| File | Change |
|------|--------|
| `gcc/gcc/config.gcc` | Adds `powerpc-apple-macos*` stanza: includes `rs6000/xcoff.h`, `rs6000/macos.h`; uses `collect2`, AIX thread model, `rs6000/t-macos` makefile. |
| `gcc/gcc/config/rs6000/macos.h` | New file (~320 lines). Sets `DEFAULT_ABI ABI_AIX`, configures XCOFF, defines `TARGET_OS_CPP_BUILTINS` (defines `macintosh`, `Macintosh`, `__ppc__`, `__POWERPC__`, `__NATURAL_ALIGNMENT__`), sets `LINK_SPEC`, `LIB_SPEC`, `LIBGCC_SPEC` (with `-carbon` multilib variant), integer type sizes, DWARF section names, and EH data format. |
| `gcc/gcc/config/rs6000/t-macos` | New (mostly-comment) makefile fragment. |
| `gcc/gcc/config/rs6000/rs6000.opt` | Adds the `-carbon` driver option used in `LIBGCC_SPEC`. |
| `gcc/gcc/config/rs6000/rs6000.cc` | Adds the `pascal` function attribute to the RS/6000 attribute table. Also fixes a crash in `rs6000_xcoff_declare_object_name` by guarding `symtab_node::get_create` with a null check. |
| `gcc/libgcc/config.host` | Adds `powerpc-*-macos` entry using `t-fdpbit` and `rs6000/t-ibm-ldouble`. |
| `gcc/libgcc/config/rs6000/cxa_finalize.c` | Fixes a compilation error: changes return type of `catomic_compare_and_exchange_bool_acq` from `boolean_t` to `int`. |

### Re-applying to a newer GCC
- Add the `powerpc-apple-macos*` block to `config.gcc` modelled on the AIX block.
- Copy `macos.h` and `t-macos` into `gcc/config/rs6000/`.
- Add the `-carbon` option to `rs6000.opt`.
- In `rs6000.cc`, add the `pascal` entry to `rs6000_attribute_table[]` and
  apply the null-check fix in `rs6000_xcoff_declare_object_name`.
- Fix `cxa_finalize.c` (`boolean_t` → `int`).

---

## 3. `pascal` calling convention support (m68k)

### What it does
Implements the classic Mac OS Pascal calling convention for 68k targets:
- Arguments are pushed left-to-right (caller pushes first argument first).
- The **callee** cleans the stack on return (using `rtd` on 68020+, or a
  manual sequence on earlier chips).
- The return value of non-void Pascal functions is written into a slot
  that the *caller* pre-allocates on the stack before the arguments (the
  slot is placed before the first argument; the callee stores the result
  there before returning).
- Pascal function names are uppercased in the assembler output (standard
  Mac OS convention) via `m68k_mangle_decl_assembler_name`.
- Declared with `__attribute__((pascal))` or via the `pascal` macro defined
  in `TARGET_OS_CPP_BUILTINS` as `__attribute__((__pascal__))`.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.h` | Adds `IS_PASCAL_FUNC` macro hooking into the generic call machinery. Extends `CUMULATIVE_ARGS` from a plain `int` to a struct (`bytes`, `index`, `total_count`, `regparam`, `arg_regs[]`). Changes `INIT_CUMULATIVE_ARGS` to call the new `m68k_init_cumulative_args`. Adds `pascal` to `TARGET_OS_CPP_BUILTINS`. Adds `M68K_SYMBOLIC_CALL_BSRW_C` enum value. Marks `a6`/`a5` as fixed registers (index 13/14 in `FIXED_REGISTERS` and `CALL_USED_REGISTERS`). Changes `d2` to call-used. |
| `gcc/gcc/config/m68k/m68k.cc` | Implements `m68k_init_cumulative_args`, `m68k_is_pascal_func`, `m68k_return_pops_args` (returns `size` for `pascal` functions), `m68k_mangle_decl_assembler_name` (uppercases names of pascal functions), `m68k_function_arg_padding` (always `PAD_UPWARD`). Disables `TARGET_PROMOTE_PROTOTYPES` (commented out). |
| `gcc/gcc/calls.cc` | `initialize_argument_information`: adds `reverse_args` parameter; when true, iterates arguments in forward order instead of reverse, so pascal functions have arguments pushed left-to-right. `expand_call`: calls `IS_PASCAL_FUNC`, pre-allocates return-value slot on stack, disables tail-call optimisation, reads return value back from stack after the call. |
| `gcc/gcc/function.cc` | `assign_parms_augmented_arg_list`: reverses `fnargs` array for pascal functions so that the first declared parameter is processed last (matching left-to-right push order). `expand_function_end`: writes the return value to the pre-allocated stack slot for pascal functions. |
| `gcc/gcc/config/m68k/m68k.md` | Adds `call_pop` / `call_value_pop` expanders and corresponding `*call_pop` / `*symbolic_call_value_pop_jsr` / `*symbolic_call_value_pop_bsr` insns that emit `jsr`/`bsr` with a combined stack-pointer adjustment (for callee-pops-args). Updates the `return` pattern to emit `rtd #N` (68020+) or a manual load/jump sequence (for older chips) when `crtl->args.pops_args` is set. |

### Re-applying to a newer GCC
- The changes to `m68k.h` (`CUMULATIVE_ARGS` struct, `IS_PASCAL_FUNC`,
  `INIT_CUMULATIVE_ARGS`, `TARGET_OS_CPP_BUILTINS`, register masks) must be
  re-applied; check for nearby context lines because other parts of `m68k.h`
  may have shifted.
- In `m68k.cc`, add the new functions (`m68k_init_cumulative_args`,
  `m68k_is_pascal_func`, `m68k_mangle_decl_assembler_name`,
  `m68k_function_arg_padding`) and the `pascal`/`regparam`/`raw_inline`
  entries in `m68k_attribute_table`.
- The `calls.cc` changes are architecture-independent; look for the
  `initialize_argument_information` signature and `expand_call` body.  The
  `reverse_args` parameter must be threaded through the call.
- The `function.cc` argument reversal and return-value store are also
  architecture-independent; guard them with `#ifdef IS_PASCAL_FUNC`.
- The new insn patterns in `m68k.md` (`call_pop`, `call_value_pop` and their
  internal `*` variants) can be inserted after the existing `call` patterns.

---

## 4. `regparam` calling convention (register-parameter passing)

### What it does
Implements `__attribute__((regparam("D0,A0,...")))` to pass function arguments
in specified registers, matching the Mac OS `#pragma parameter` convention.
This is required to call Toolbox traps that receive parameters in specific
registers.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.h` | `CUMULATIVE_ARGS` struct carries `regparam` flag, `arg_regs[]`, and `index`. |
| `gcc/gcc/config/m68k/m68k.cc` | `m68k_init_cumulative_args` parses the `regparam` attribute string or looks up a `pragma_parameter_directives` table. `m68k_function_arg` returns the register RTX when `cum->regparam` is set. `m68k_function_value` returns the register specified by `arg_regs[0]` when `regparam` is active. |
| `gcc/gcc/config/m68k/m68k-mac-pragmas.c` | New file. Implements `#pragma parameter FuncName [returnreg] (arg1reg, arg2reg, …)` parsing. Populates `pragma_parameter_directives` (a `std::map<string, vector<int>>`). Registers the pragma via `REGISTER_TARGET_PRAGMAS`. |
| `gcc/gcc/config/m68k/m68k.h` | `REGISTER_TARGET_PRAGMAS()` calls `m68k_register_pragmas()` (declared `extern`). |

### Re-applying to a newer GCC
The `m68k-mac-pragmas.c` file can be copied verbatim.  The hooks into
`m68k.h`/`m68k.cc` depend on the `CUMULATIVE_ARGS` struct already having been
extended (patch 3 above).  The `c_target_objs`/`cxx_target_objs` lines in
`config.gcc` must include `m68k-mac-pragmas.o` for all m68k targets (or at
least for the `m68k-*-macos` variant).

---

## 5. `raw_inline` attribute (inline Toolbox trap opcodes)

### What it does
Allows a function to be *defined* as a sequence of 16-bit machine-code words
that are emitted literally when the function is called, rather than generating
a real call instruction.  This is how Mac OS Toolbox traps are declared: e.g.
`pascal void ExitToShell(void) = 0xA9F4;`.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.cc` | `output_call`: checks for `raw_inline` attribute on the callee; if found, emits `.short 0xNNNN, …` words directly into the assembler output instead of a `jsr`/`bsr`. `m68k_ok_for_sibcall_p`: returns false for `raw_inline` functions (cannot tail-call). `m68k_rawinline_p`: predicate testing whether a `SYMBOL_REF` refers to a `raw_inline` function. |
| `gcc/gcc/config/m68k/predicates.md` | Adds `rawinline_operand` predicate; adds it to `const_call_operand` so that calls to `raw_inline` symbols are accepted as valid call operands. |
| `gcc/gcc/c/c-parser.cc` | `c_parser_declaration_or_fndef`: when a `FUNCTION_DECL` is assigned an initialiser, calls `c_parser_inline_opcodes` instead of the normal initialiser path. `c_parser_inline_opcodes`: parses a brace-or-comma list of integer constants and attaches them as a `__raw_inline__` attribute. |
| `gcc/gcc/cp/parser.cc` | Same logic added to `cp_parser_init_declarator` (C++ parser). |
| `gcc/gcc/c/c-decl.cc` | Suppresses "function is initialized like a variable" error for this pattern. |
| `gcc/gcc/calls.cc` | `prepare_call_address`: skips the normal `funexp` preparation for calls to `raw_inline` functions (no `force_reg`, no mode conversion). |

### Re-applying to a newer GCC
The parser changes in `c-parser.cc` and `cp/parser.cc` are the trickiest to
re-apply because the surrounding code evolves across GCC versions.  The key
insertion point in `c-parser.cc` is inside `c_parser_declaration_or_fndef`,
where an initialiser is parsed for a function declarator – look for the
`start_init` call.  In `cp/parser.cc` look for `cp_parser_pure_specifier`.
The `output_call` changes in `m68k.cc` are self-contained and easy to re-apply.

---

## 6. Pascal string literals (`"\p..."`)

### What it does
Adds a `"\p"` string prefix that produces a Pascal-style length-prefixed
string: the first byte contains the string length, followed by the characters.
Both the C and C++ parsers are patched identically.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/c-family/c-common.h` | Adds `CTI_UCHAR_ARRAY_TYPE` enum value and `uchar_array_type_node` macro. |
| `gcc/gcc/c-family/c-common.cc` | Allocates `uchar_array_type_node` (array of `unsigned char`) in `c_common_nodes_and_builtins`; adds the corresponding `TREE_TYPE` case in `fix_string_type`. |
| `gcc/gcc/c-family/c-lex.cc` | In `lex_string`: detects `"\p` prefix, temporarily replaces `\p` with `\n` (a known-good escape) to let the normal string parser run, then overwrites byte 0 with the real string length. Sets `TREE_TYPE` to `uchar_array_type_node` for Pascal strings. |
| `gcc/gcc/c/c-parser.cc` | Same Pascal-string detection applied to `c_parser_string_literal`. |
| `gcc/gcc/cp/parser.cc` | Same Pascal-string detection applied to `cp_parser_string_literal`. |

### Re-applying to a newer GCC
The `c-common.h`/`c-common.cc` additions are straightforward – add the new
array type adjacent to `char_array_type_node`.  In `c-lex.cc`,
`c-parser.cc`, and `cp/parser.cc` look for the string-literal parsing loop
and the `CPP_STRING` `TREE_TYPE` assignment; insert the `\p`-detection block
immediately before the call to `cpp_interpret_string`.

---

## 7. MacsBug symbol output

### What it does
After each function's final `rts`/`rtd` instruction, emits a MacsBug-format
symbol record: a length byte (or two-byte length for names ≥ 32 chars) followed
by the function name ASCII bytes and a word-aligned padding short.  This allows
the MacsBug debugger to display symbolic function names.  When
`-ffunction-sections` is active the symbol is placed in a per-function
`.macsbug` section.

A global counter `retro68_hack_asm_rts_counter` tracks whether the last
emitted instruction was an `rts`/`rtd`; if not, an extra `rts` is prepended.

The `ASM_DECLARE_FUNCTION_SIZE` macro in `m68k.h` hooks into the normal ELF
function-size emission point and calls `m68k_write_macsbug_name`.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.cc` | Adds `m68k_write_macsbug_name` (writes the MacsBug record to the assembler file). |
| `gcc/gcc/config/m68k/m68k.h` | Defines `ASM_DECLARE_FUNCTION_SIZE` to call `m68k_write_macsbug_name`. |
| `gcc/gcc/final.cc` | Defines and decrements `retro68_hack_asm_rts_counter` in `output_asm_insn`. Sets the counter to 2 in the `return` pattern output. |
| `gcc/gcc/config/m68k/m68k.md` | Sets `retro68_hack_asm_rts_counter = 2` before emitting the `rts`/`rtd` instruction. |
| `gcc/gcc/config/m68k/m68k-protos.h` | Declares `m68k_write_macsbug_name`. |
| `gcc/bfd/elflink.c` (binutils) | Keeps `.macsbug` sections from being GC'd (see BINUTILS-PATCHES.md). |

### Re-applying to a newer GCC
- In `final.cc`, declare `retro68_hack_asm_rts_counter` as a global `int` and
  decrement it inside `output_asm_insn`.
- In `m68k.md`, find the `return` define_insn and set the counter before the
  `rts`/`rtd` output.
- Copy `m68k_write_macsbug_name` to `m68k.cc` and its prototype to
  `m68k-protos.h`.
- Add `ASM_DECLARE_FUNCTION_SIZE` to `m68k.h` (or the target-specific header
  `m68k-macos.h`).

---

## 8. Computed-goto section placement (`m68k_unique_section`)

### What it does
Overrides `TARGET_ASM_UNIQUE_SECTION` to detect arrays of label pointers
(computed-goto jump tables) and place them in a named `.text.funcname.varname`
section, keeping them in the text segment where position-independent code can
reach them.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.cc` | Adds `m68k_unique_section` function; hooks it via `TARGET_ASM_UNIQUE_SECTION`. |

### Re-applying to a newer GCC
Copy the function and `#undef`/`#define` hook verbatim into `m68k.cc`.

---

## 9. PC-relative `bsr.w` call mode

### What it does
Adds a fifth `M68K_SYMBOLIC_CALL` variant `M68K_SYMBOLIC_CALL_BSRW_C` that
emits `bsr.w %c0` (word-displacement branch-to-subroutine with a 16-bit
offset).  This is activated automatically when `-msep-data` is in effect
(i.e. when `TARGET_PCREL` is set), replacing the default `bsr.l`.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.h` | Adds `M68K_SYMBOLIC_CALL_BSRW_C` to the enum. |
| `gcc/gcc/config/m68k/m68k.cc` | Sets `m68k_symbolic_call_var` to `BSRW_C` when `TARGET_PCREL`; adds the `"bsr%.w %c0"` string constant to the switch. Updates all `m68k_symbolic_call_var == BSR_C || BSR_P` checks to also include `BSRW_C`. |
| `gcc/gcc/config/m68k/m68k.md` | Adds `BSRW_C` to the guards of the BSR call patterns. |

### Re-applying to a newer GCC
Add the enum value and string constant, update the three-way `||` guards in
the condition and in `m68k_option_override`.

---

## 10. Register-save fix for PIC register in sep-data mode

### What it does
When `-msep-data` is active (`TARGET_SEP_DATA`), the PIC register is used for
a different purpose than standard `-fPIC`; suppresses the unconditional
save/restore of the PIC register that `m68k_save_reg` would otherwise force.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.cc` | In `m68k_save_reg`, conditions the PIC-register save on `!TARGET_SEP_DATA`. |

---

## 11. `combine-stack-adj` pass cloneable

### What it does
Makes `pass_stack_adjustments` cloneable (adds a `clone()` method) so that
it can be inserted multiple times in the pass pipeline.  This is needed
because the `m68k-passes.def` file inserts an additional CSA pass early
(after `pass_combine`) to eliminate redundant stack moves when calling
pascal functions.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/combine-stack-adj.cc` | Adds `virtual opt_pass *clone()` to `pass_stack_adjustments`. |
| `gcc/gcc/config/m68k/m68k-passes.def` | New file. Inserts `pass_stack_adjustments` after `pass_combine` (instance 1). |
| `gcc/gcc/config/m68k/t-m68k` | Adds `PASSES_EXTRA += $(srcdir)/config/m68k/m68k-passes.def`. |

### Re-applying to a newer GCC
Check whether `pass_stack_adjustments` still lacks a `clone()` method.  If
so, add it.  Copy `m68k-passes.def` verbatim.  Add `PASSES_EXTRA` to `t-m68k`.

---

## 12. RTL analysis / reload fixes for PUSH_ROUNDING

### What it does
Two fixes that work around m68k's unusual byte-push behaviour (the 68000
stack pointer always decrements by at least 2 bytes even for a byte push):

1. **`expr.cc`** (`find_args_size_adjust`): wraps `GET_MODE_SIZE` with
   `PUSH_ROUNDING(...)` for `PRE_INC`/`POST_INC`/`PRE_DEC`/`POST_DEC`
   addressing modes, and guards the whole block with `#ifdef PUSH_ROUNDING`.
   Without this, GCC miscomputes stack-frame sizes when byte values are pushed.

2. **`reload1.cc`** (`elimination_effects`): marks a frame-pointer
   elimination as impossible when the access uses `POST_DEC`/`POST_INC`
   addressing (prevents incorrect frame-pointer elimination through
   push/pop sequences).

3. **`rtlanal.cc`** (`set_noop_p`): extends the memory-to-memory noop
   detection to recognise `(mem (post_inc r)) → (mem (pre_dec r))` as a
   noop (a push followed by a pop of the same register with PUSH_ROUNDING).

4. **`combine.cc`**: comments out a `gcc_assert` in `distribute_notes` that
   fires incorrectly when `ACCUMULATE_OUTGOING_ARGS` is false (which is the
   case for m68k).

### Re-applying to a newer GCC
These are relatively surgical changes.  In each file, search for the
surrounding function name.  The `combine.cc` assert may have been removed or
moved upstream; verify before applying.

---

## 13. `m68k_function_value` signature change

### What it does
Changes `m68k_function_value` to accept an `outgoing` boolean parameter
(matching the `TARGET_FUNCTION_VALUE` hook signature) and to look up
`regparam` register assignments for functions with that attribute.  Adds the
`TARGET_FUNCTION_VALUE` target hook definition, replacing the old
`FUNCTION_VALUE` macro.  Always returns D0 for ordinary functions (the
`#if 0` block of pointer-in-A0 logic is disabled but preserved for reference).

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/m68k/m68k.cc` | Extends `m68k_function_value` signature; updates `m68k_ok_for_sibcall_p` to call it directly. |
| `gcc/gcc/config/m68k/m68k.h` | Comments out the `FUNCTION_VALUE` macro; adds `TARGET_FUNCTION_VALUE` hook. |
| `gcc/gcc/config/m68k/m68k-protos.h` | Updates prototype. |
| `gcc/gcc/config/m68k/m68kemb.h` | Removes the `FUNCTION_VALUE` override (no longer needed since the hook supersedes the macro). |

### Re-applying to a newer GCC
Check whether the `TARGET_FUNCTION_VALUE` hook signature still matches; GCC
may have changed it.  Remove the `FUNCTION_VALUE` macro from both `m68k.h`
and `m68kemb.h`.

---

## 14. `libcpp` character constant warning suppression

### What it does
Suppresses a "multi-character character constant" warning for 4-character
constants (i.e. `'abcd'`-style OSType/FourCC literals that are pervasive in
Mac OS code).

### Files changed
| File | Change |
|------|--------|
| `gcc/libcpp/charset.cc` | In `narrow_str_to_charconst`, adds `&& i != 4` to the `warn_multichar` condition. |

### Re-applying to a newer GCC
A one-line change; find the `warn_multichar` condition and add the `i != 4`
guard.

---

## 15. `libgcc` compiled with `-ffunction-sections`

### What it does
Adds `-ffunction-sections` to `LIBGCC2_CFLAGS` so that each libgcc helper
function lands in its own ELF section.  This allows the linker to dead-strip
unused runtime helpers, which is important for small Mac applications.

### Files changed
| File | Change |
|------|--------|
| `gcc/libgcc/Makefile.in` | Appends `-ffunction-sections` to `LIBGCC2_CFLAGS`. |

### Re-applying to a newer GCC
Locate `LIBGCC2_CFLAGS` in `libgcc/Makefile.in` and append `-ffunction-sections`.

---

## 16. AArch64 Darwin host hooks

### What it does
Adds a minimal host hook file for AArch64 macOS build hosts (Apple Silicon).
This allows GCC to be *built* on Apple Silicon machines; the file simply
includes the standard Darwin host hook header.

### Files changed
| File | Change |
|------|--------|
| `gcc/gcc/config/aarch64/host-aarch64-darwin.c` | New file. |
| `gcc/gcc/config.host` | Adds `aarch64-*-darwin*` case pointing to the new file and `aarch64/x-darwin`. |

### Re-applying to a newer GCC
Check whether upstream GCC already added AArch64 Darwin host support;
if not, copy the file and the `config.host` entry.

---

## 17. Build system / tooling updates

These changes update generated or infrastructure files and must be
**re-generated** rather than applied literally when porting to a new GCC base:

- `gcc/compile`, `gcc/depcomp`, `gcc/missing`: script version bumps
  (2012 → 2018 era) and MSYS support additions.
- `gcc/libbacktrace/aclocal.m4`, `gcc/libcc1/aclocal.m4`,
  `gcc/libstdc++-v3/aclocal.m4`, `gcc/libstdc++-v3/Makefile.in`:
  automake 1.15.1 → 1.16.3 regeneration.
- `gcc/libcpp/configure`, `gcc/libcpp/configure.ac`: adds `setlocale` to
  `AC_CHECK_FUNCS`; fixes a `putc_unlocked` declaration check typo.
- `gcc/gcc/system.h`: reorders C++ standard-library includes so that
  `<string>` comes before `safe-ctype.h`; moves the `INCLUDE_STRING` guard to
  the correct location.  Fixes a Cygwin build issue with `fputs_unlocked`.
- `gcc/libcc1/libcc1plugin.cc`, `gcc/libcc1/libcp1plugin.cc`: use
  `#define INCLUDE_VECTOR` instead of `#include <vector>` directly.
- `gcc/zlib/zutil.h`: removes dead `fdopen` workaround for old Metrowerks
  toolchain under `MACOS`/`TARGET_OS_MAC`.
- `gcc/newlib/libc/machine/powerpc/setjmp.S`: (not shown in excerpts above,
  likely a minor fix for PowerPC setjmp).

---

## Summary of patches to re-apply when upgrading GCC

| Priority | Area | Complexity |
|----------|------|------------|
| Essential | New target `m68k-*-macos` (`config.gcc`, `m68k-macos.h`, `t-macos`) | Low – mostly new files |
| Essential | New target `powerpc-apple-macos` (`config.gcc`, `macos.h`, `rs6000.cc`, `rs6000.opt`) | Medium |
| Essential | Pascal calling convention (`m68k.h`, `m68k.cc`, `calls.cc`, `function.cc`, `m68k.md`) | High |
| Essential | `regparam` attribute + `#pragma parameter` (`m68k.cc`, `m68k-mac-pragmas.c`) | Medium |
| Essential | `raw_inline` attribute (`c-parser.cc`, `cp/parser.cc`, `c-decl.cc`, `m68k.cc`, `predicates.md`) | Medium |
| Essential | Pascal string literals (`c-common.*`, `c-lex.cc`, `c-parser.cc`, `cp/parser.cc`) | Low |
| Important | MacsBug symbol output (`m68k.cc`, `m68k.h`, `final.cc`, `m68k.md`) | Medium |
| Important | PUSH_ROUNDING fixes (`expr.cc`, `reload1.cc`, `rtlanal.cc`, `combine.cc`) | Low |
| Important | `-ffunction-sections` for libgcc | Low |
| Quality | 4-char constant warning (`libcpp/charset.cc`) | Trivial |
| Quality | PC-relative `bsr.w` mode | Low |
| Quality | CSA pass cloneable + extra pass | Low |
| Build only | AArch64 Darwin host hooks | Low |
| Build only | Build system regeneration | Re-generate, not re-apply |
