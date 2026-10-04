# Design: Atomic runtime helpers (`__atomic_*` / `__sync_*`) for classic Mac OS

> **AI-generated.** This document was produced with the assistance of an AI
> language model and may contain inaccuracies. It describes the single-threaded
> `__atomic_*` and `__sync_*` runtime helpers as implemented on 2026-10-04.

- **Date:** 2026-10-04
- **Status:** implemented (2026-10-04)
- **Area:** `libretro/` (runtime), `AutomatedTests/`

## Summary

**This is a single-threaded implementation.** It assumes the classic-Mac-OS
cooperative execution model, in which a task is only switched out at an explicit
blocking call. It does not support code that runs concurrently on more than one
CPU — in particular it does not support applications that use the PowerPC /
Carbon **Multiprocessing Services** (`MPLibrary`, preemptive tasks), and it is
not a substitute for real libatomic on a preemptive system. See *Non-goals*.

GCC emits calls to out-of-line `__atomic_*` (and legacy `__sync_*`) functions
for atomic operations it cannot perform inline. No such library existed for the
classic Mac OS targets (`m68k-*-macos`, `powerpc-*-macos`), so any use of
`std::atomic<>` failed to link — including `std::atomic<T>::is_lock_free()`,
which always calls `__atomic_is_lock_free`, even when every operation on the
type is inlined.

`libretro/atomic.c` now provides those functions. It is compiled into
`retrocrt`, which is already force-linked into every application by the target
specs, so no linker flags or GCC changes are needed.

Classic Mac OS is a cooperatively scheduled, single-threaded system: a task is
only switched out at an explicit blocking call, so a plain read-modify-write
sequence cannot be interleaved with another task. The helpers are therefore
ordinary C expressions with no locking, no critical sections and no
interrupt masking, and the memory-order arguments are ignored (the relevant
fences are no-ops on 68K and compile inline to `sync` on PowerPC).

They are **not** usable from interrupt handlers. Interrupt handlers may only use
naturally aligned loads and stores of at most four bytes, which GCC emits inline
and which never reach this file.

## Pre-existing behavior

`gcc/libatomic/configure.tgt` has no case for the Retro68 target triples, so
both `m68k-*-macos*` and `powerpc-*-macos*` fall through to the final `*)` case
and set `UNSUPPORTED=1`. No libatomic is built or installed. The compiler still
emits `__atomic_*` (and legacy `__sync_*`) calls for operations the CPU cannot
do inline. Measured with the built `m68k-apple-macos` compiler (the default m68k
multilib is 68000):

| Operation (naturally aligned) | 68000 | 68020 / 68040 | classic PowerPC |
|---|---|---|---|
| load / store 1, 2, 4 | inline | inline | inline |
| load / store 8 | `_8` helper | `_8` helper | `_8` helper |
| exchange, CAS, fetch_* 1, 2, 4 | helper | inline (`cas`) | 4 inline (`lwarx`/`stwcx.`); 1, 2 helper |
| exchange, CAS, fetch_* 8 | helper | helper | helper |
| `test_and_set` (`atomic_flag`) | inline (`tas`) | inline (`tas`) | `_1` helper |
| non-power-of-two / unaligned / struct | generic helper | generic helper | generic helper |

Byte and halfword `lbarx`/`stbcx.` only exist on POWER8, and 64-bit
`ldarx`/`stdcx.` need a 64-bit CPU, so classic PowerPC needs the helpers even
for `std::atomic<char>` and `std::atomic_flag`. The `is_lock_free()` runtime
query is needed on every target.

## Decisions

1. **Implement in `libretro`, not in GCC's libatomic.** `retrocrt` is already
   in `LIB_SPEC`/`LIBGCC_SPEC`/`LINK_GCC_C_SEQUENCE_SPEC` for all three
   configurations (68K, classic PPC, Carbon), so the helpers are available
   without adding `-latomic` or patching the driver specs. Enabling libatomic
   would have required editing `libatomic/configure.tgt`, adding a per-target
   `host-config.h`/`lock.c`, and wiring `-latomic` into the macos specs, and
   would have to be re-applied on every GCC upgrade.
2. **Single-threaded semantics.** Because task switches are cooperative, plain
   read-modify-write is atomic with respect to other tasks. No locks, no
   interrupt-disabling critical sections, no per-architecture layer. This
   deliberately excludes preemptive concurrency, including the PowerPC / Carbon
   Multiprocessing Services.
3. **Memory-order arguments are ignored.** On a single CPU the only meaningful
   ordering is at the compiler level, which is already enforced by the fact
   that these are out-of-line function calls. The compiler's own fences expand
   inline (`nop` on 68K, `sync`/`lwsync` on PowerPC) and never call back here.
4. **Not interrupt-safe.** The helpers are explicitly out of contract for
   interrupt handlers. Only the operations GCC emits inline — aligned loads and
   stores of at most four bytes — may be used from interrupt context. This was
   a deliberate scope decision, not an oversight.
5. **`__asm__` labels instead of the reserved names.** GCC recognises the
   unsuffixed and size-suffixed `__atomic_*` identifiers as built-ins, so
   defining them directly produces `-Wbuiltin-declaration-mismatch` warnings.
   As GNU libatomic does, the implementations use internal C identifiers and
   attach the required symbols with `__asm__` labels.
6. **Conservative `is_lock_free`.** `__atomic_is_lock_free` delegates to the
   compiler's `__atomic_always_lock_free`, which reports true exactly for the
   sizes the compiler emits inline. libretrocrt is built once with the default
   68000 multilib even for 68020/68040 applications, so the answer may report
   false for a size that a later CPU would inline. Under-reporting is permitted
   and safe; over-reporting would wrongly imply signal-handler safety.

## Integration

`atomic.c` is added to the existing `retrocrt` target
(`libretro/CMakeLists.txt`):

```
add_library(retrocrt
    malloc.c
    syscalls.c
    consolehooks.c
    atomic.c
    ${ARCH_FILES}
)
```

Consequences:

- No change to any linker spec: `retrocrt` is already linked into every
  application, for 68K (`-lretrocrt`), classic PPC (`-lretrocrt`) and Carbon
  (`-lretrocrt-carbon`).
- One source file serves all three configurations; there is no
  per-architecture code. It uses only `stdint.h`, `stddef.h`, `stdbool.h` and
  `string.h`.
- `libretrocrt.a` is produced once per CMake configuration and is shared by all
  m68k multilibs (compiled for the default 68000), so the implementation must
  not assume 68020-only instructions. It does not.

## Function list

`N` is the object size in bytes, one of `{1, 2, 4, 8}`; `T` is the matching
`uintN_t`. The signatures and semantics are fixed by GCC/libstdc++.

| Function | Behaviour |
|---|---|
| `T __atomic_load_N(T *ptr, int model)` | Return the current value of `*ptr`. |
| `void __atomic_store_N(T *ptr, T value, int model)` | Write `value` to `*ptr`. |
| `T __atomic_exchange_N(T *ptr, T value, int model)` | Write `value` to `*ptr`; return the old value. |
| `bool __atomic_compare_exchange_N(T *ptr, T *expected, T desired, int success_model, int failure_model)` | If `*ptr == *expected`, write `desired` and return `true`; otherwise write the actual `*ptr` into `*expected` and return `false`. GCC drops the `weak` argument before calling. |
| `bool __atomic_test_and_set_N(T *ptr, int model)` | Write the target's true value (`__GCC_ATOMIC_TEST_AND_SET_TRUEVAL`) to `*ptr`; return whether `*ptr` was previously non-zero. Only `N == 1` is emitted; `N > 1` operates on the first byte, as in libatomic. |
| `T __atomic_fetch_{add,sub,and,or,xor,nand}_N(T *ptr, T value, int model)` | Apply the operation to `*ptr`; return the old value. |
| `T __atomic_{add,sub,and,or,xor,nand}_fetch_N(T *ptr, T value, int model)` | Apply the operation to `*ptr`; return the new value. |
| `void __atomic_load(size_t n, void *ptr, void *ret, int model)` | Copy `n` bytes from `*ptr` into `ret`. |
| `void __atomic_store(size_t n, void *ptr, void *value, int model)` | Copy `n` bytes from `value` into `*ptr`. |
| `void __atomic_exchange(size_t n, void *ptr, void *value, void *ret, int model)` | Copy `n` bytes from `value` into `*ptr` and the old contents into `ret`. |
| `bool __atomic_compare_exchange(size_t n, void *ptr, void *expected, void *desired, int success_model, int failure_model)` | Byte-compare `*ptr` with `expected`; on match copy `desired` into `*ptr` and return `true`, otherwise copy `*ptr` into `expected` and return `false`. |
| `bool __atomic_is_lock_free(size_t n, void *ptr)` | Report whether operations of size `n` are implemented with lock-free instructions. |

That is 73 `__atomic_*` symbols: 16 per size (load, store, exchange,
compare_exchange and the 12 fetch/op-fetch pairs) × 4 sizes, plus 4
`test_and_set` forms, 4 generic size entry points and `is_lock_free`.

### Legacy `__sync_*` built-ins

`T` is again `uintN_t`. These take no memory-order argument and are full
barriers by definition. They exist for older code in general, and specifically
for `libbacktrace` (which backs `std::stacktrace` in `libstdc++exp`, the reason
this family was added). GCC emits the fetch/op-fetch and compare-and-swap
families as libcalls; `__sync_synchronize`, `__sync_lock_test_and_set` and
`__sync_lock_release` are always expanded inline on these targets but are
provided anyway for completeness.

| Function | Behaviour |
|---|---|
| `T __sync_fetch_and_{add,sub,and,or,xor,nand}_N(T *ptr, T value)` | Apply the operation to `*ptr`; return the old value. |
| `T __sync_{add,sub,and,or,xor,nand}_and_fetch_N(T *ptr, T value)` | Apply the operation to `*ptr`; return the new value. |
| `bool __sync_bool_compare_and_swap_N(T *ptr, T oldval, T newval)` | If `*ptr == oldval`, store `newval` and return `true`; otherwise return `false`. |
| `T __sync_val_compare_and_swap_N(T *ptr, T oldval, T newval)` | If `*ptr == oldval`, store `newval`; return the previous value. |
| `T __sync_lock_test_and_set_N(T *ptr, T value)` | Store `value`; return the previous value. |
| `void __sync_lock_release_N(T *ptr)` | Store zero. |

Note the symbol spelling: `__sync_fetch_and_add_N` (old value) versus
`__sync_add_and_fetch_N` (new value).

That is 64 `__sync_*` symbols (16 per size × 4 sizes), 137 symbols in total
across both families.

`__atomic_thread_fence`, `__atomic_signal_fence`, `__sync_synchronize` and the
C11 `atomic_flag_*` functions are not provided as out-of-line functions: the
compiler expands all of these inline on these targets, and C++
`std::atomic_flag` does not call the C11 functions.

## Implementation

The sized families are generated with macros. Each function is declared with an
`__asm__` label for its public symbol and then defined under an internal
`retro68_atomic_*` name:

```c
#define RETRO68_FETCH_OP(SZ, TYPE, OP, NAME)                                    \
  TYPE retro68_atomic_fetch_##NAME##_##SZ (TYPE *, TYPE, int)                   \
      __asm__ ("__atomic_fetch_" #NAME "_" #SZ);                               \
  TYPE retro68_atomic_fetch_##NAME##_##SZ (TYPE *ptr, TYPE value, int model)    \
  {                                                                             \
    (void) model;                                                               \
    TYPE old = *ptr;                                                            \
    *ptr = (TYPE) (OP (old, value));                                            \
    return old;                                                                 \
  }                                                                             \
  ...
```

`RETRO68_DEFINE_SIZE(SZ, TYPE)` instantiates the load/store, exchange,
compare-exchange and fetch families for `(1, uint8_t)`, `(2, uint16_t)`,
`(4, uint32_t)` and `(8, uint64_t)`. The `nand` operation is `~((a) & (b))`,
matching `gcc/libatomic/fnand_n.c`; the result is cast back to `TYPE`, which
also handles the integer promotion of the narrow types.

The generic-size functions are plain `memcpy`/`memcmp` wrappers, which is
sufficient on a single-threaded system and correctly handles unaligned objects,
odd sizes and types larger than eight bytes.

`__atomic_is_lock_free` is a `switch` over the literal sizes calling
`__atomic_always_lock_free` (which requires compile-time-constant arguments).

`__atomic_test_and_set_1` writes `__GCC_ATOMIC_TEST_AND_SET_TRUEVAL` (128 on
68K, 1 on PowerPC) and returns whether the previous value was non-zero; the
wider forms forward to it through a `uint8_t *`.

The legacy `__sync_*` family is generated by analogous macros
(`RETRO68_SYNC_FETCH_OP`, `RETRO68_SYNC_COMPARE_EXCHANGE`, `RETRO68_SYNC_LOCK`,
instantiated by `RETRO68_DEFINE_SYNC_SIZE`). They reuse the same `RETRO68_OP_*`
operations but take no memory-order argument and attach `__sync_*` asm labels
(`__sync_fetch_and_*`, `__sync_*_and_fetch`, `__sync_bool_compare_and_swap_*`,
`__sync_val_compare_and_swap_*`, `__sync_lock_*`).

## Interrupt-time guidance

The C++ standard only guarantees signal-handler safety for lock-free atomic
operations; on classic Mac OS, interrupt handlers (VBL, Time Manager, deferred
tasks, asynchronous I/O completion, system-extension code) are the analogue of
asynchronous signal handlers. The rules for this implementation are:

- **Safe from interrupt handlers:** naturally aligned loads and stores of at
  most four bytes. GCC emits these inline and they never call into `atomic.c`.
  On 68K, `atomic_flag::test_and_set`/`clear` are also inline (`tas`) and safe.
- **Not safe from interrupt handlers:** everything routed through `atomic.c` —
  64-bit operations on all targets, and 1/2/4-byte read-modify-write on 68000
  and (for 1/2-byte) on classic PowerPC. These are multi-instruction sequences
  and an interrupt between the read and the write is visible.
- **Recommended handoff pattern:** the task publishes work and sets a flag with
  an aligned three- or four-byte `release` store; the interrupt handler observes
  it with an aligned `acquire` load and stores its result the same way; the task
  reads the result. Avoid read-modify-write on shared variables across the
  task/interrupt boundary.

## Non-goals

- Interrupt-handler-safe read-modify-write (see above).
- Multi-threaded, preemptive or SMP correctness. The implementation assumes
  cooperative single-threading. In particular it does **not** support
  applications that use the PowerPC / Carbon **Multiprocessing Services**
  (`MPLibrary`, preemptive tasks), which can run on more than one CPU. It is
  not a substitute for real libatomic on a preemptive system.
- The 16-byte sized `__atomic_*_16` / `__sync_*_16` entry points (these targets
  have no 16-byte integer mode, and GCC never emits them). The generic
  `__atomic` entry points still handle `n == 16`.
- The C11 `atomic_flag_*` functions (C++ `std::atomic_flag` does not call them).

## Deferred

- **Lock-free narrow atomics on classic PowerPC.** The 1- and 2-byte operations
  could be implemented with word-sized `lwarx`/`stwcx.` read-modify-write of the
  containing aligned word, as GNU libatomic does, making them genuinely
  lock-free and interrupt-safe. This first iteration deliberately uses straight
  C code instead.
- **Enabling GCC's libatomic.** Not required for this use case, but an option
  if a future target needs accurate per-multilib lock-free reporting.
- **Multithreaded support.** A future target with preemptive scheduling would
  need real atomic primitives (interrupt masking or hardware CAS) rather than
  this implementation.

## Implementation notes

- `libretrocrt.a` is shared by all m68k multilibs and compiled for 68000, so
  `is_lock_free` under-reports on 68020/68040 (safe direction).
- The `model` arguments are accepted and ignored. Calls are already compiler
  barriers, and the architecture fences are no-ops or inline.
- `test_and_set` writes the target's true value so that the in-tree inline
  (`tas`, which sets bit 7) and out-of-line paths agree on "set" being
  non-zero.
- The `__asm__` labels were verified to produce the expected symbols on both
  ELF/m68k (`__atomic_load_4`, `__sync_fetch_and_add_4`) and XCOFF/PowerPC
  (`. __atomic_load_4` text label plus the `__atomic_load_4` descriptor),
  matching what the compiler emits at call sites.

## Files changed

| File | Change |
|------|--------|
| `libretro/atomic.c` | new: the `__atomic_*` and `__sync_*` helper implementations |
| `libretro/CMakeLists.txt` | adds `atomic.c` to the `retrocrt` target |
| `AutomatedTests/Atomic.cc` | new: runtime test for `std::atomic` and the `__sync_*` built-ins |
| `AutomatedTests/CMakeLists.txt` | registers the `Atomic` test with `PASS_REGULAR_EXPRESSION "OK"` |
| `docs/ai/2026-10-04-atomic-helpers.md` | this document |

## Tests

`AutomatedTests/Atomic.cc` is compiled and run for each target (68K default,
PowerPC, Carbon) like the other tests. It exercises:

- `std::atomic<int>`: store/load, `fetch_add`, `fetch_sub`, `exchange`,
  `compare_exchange_strong` (success and failure), `fetch_or`, `fetch_and`,
  `fetch_xor`.
- `std::atomic<long long>`: 64-bit store/load, `fetch_add`, exchange and CAS.
- `std::atomic<char>` and `std::atomic<short>`: narrow-width read-modify-write
  (the `_1`/`_2` helpers on 68000 and PowerPC).
- `std::atomic<int *>`: pointer `fetch_add`.
- `std::atomic_flag`: `test_and_set` / `clear`.
- `is_lock_free()`: called for both correctness of the symbol and
  self-consistency of the result.
- The legacy `__sync_*` built-ins: `__sync_fetch_and_add`,
  `__sync_add_and_fetch`, `__sync_bool_compare_and_swap`,
  `__sync_val_compare_and_swap`, and a 64-bit `__sync_fetch_and_add` that forces
  the helper on every CPU.

The test logs `OK` on success and `NO` otherwise; the CTest entry expects `OK`.

## Validation

Performed on 2026-10-04 in this repository:

- `m68k-apple-macos-gcc -std=c99 -Wall -Werror=return-type
  -Werror=strict-prototypes -Wno-multichar -O2 -c libretro/atomic.c` — clean,
  no warnings; 73 `__atomic_*` and 64 `__sync_*` text symbols produced (137).
- The PowerPC path was compiled with the in-tree `xgcc -B` PPC compiler using
  the built `as-new`; the file compiled cleanly and the XCOFF symbol test
  confirmed that an `__asm__` label yields the `. __atomic_load_4` /
  `__atomic_load_4` pair.
- `cmake --build build/build-target --target retrocrt` — rebuilt
  `libretrocrt.a`, which now defines all 137 symbols.
- `cmake --build build/build-target --target Atomic` — the test application
  compiled, linked through Elf2Mac, and the final MacBinary has no undefined
  `__atomic_*` or `__sync_*` symbols. The test object references the expected
  helpers (`__atomic_fetch_add_1/2/4/8`, `__atomic_compare_exchange_1/4/8`,
  `__atomic_exchange_4/8`, `__atomic_load_8`, `__atomic_store_8`,
  `__sync_bool_compare_and_swap_4`, `__sync_fetch_and_add_8`, …).

Not performed here: running the test under an emulator (no emulator is
installed in this environment). The CTest entry will exercise it wherever a
classic-Mac emulator is available.

## References

- `gcc/libatomic/` — ABI signatures, operation semantics (`fnand_n.c`,
  `cas_n.c`, `fop_n.c`, `gload.c`, `gstore.c`, `gexch.c`, `gcas.c`, `glfree.c`)
  and the `__asm__`-alias technique.
- `gcc/libatomic/configure.tgt` — why no libatomic exists for these targets.
- `gcc/gcc/config/m68k/sync.md`, `gcc/gcc/config/rs6000/sync.md` — which atomic
  operations each target implements inline.
- `gcc/gcc/config/m68k/m68k-macos.h`, `gcc/gcc/config/rs6000/macos.h` — the
  library specs that already link `retrocrt` into every application.
- `docs/ai/2026-10-04-atomic-helpers.md` — this document.
