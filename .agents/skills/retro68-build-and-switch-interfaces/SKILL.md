---
name: retro68-build-and-switch-interfaces
description: Navigate the Retro68 out-of-tree build in ./build and switch the toolchain between Apple's universal interfaces and the open-source multiversal interfaces. Use this when building or rebuilding the toolchain, when a build seems to use the "wrong" headers (e.g. Multiverse.h missing), when linking fails with undefined references to GETPTRSIZE/GETHANDLESIZE after changing interfaces, or whenever you need to build a 68K Mac app against multiversal (the interfaces that carry multiversal/custom/glue.c).
---

# Retro68 build tree and interface switching

## Scope

Most of this skill is general Retro68 build knowledge, but several steps below
(multiversal generation, switching interfaces, rebuilding `libretrocrt` because
of `GetHandleSize`/`GetPtrSize`) are specific to working with the **interfaces /
`multiversal`**. If you are testing a change to a *different*
component — gcc, binutils, or a host tool used for code generation — use this
skill for the build-tree and interface mechanics, but don't assume the
multiversal-specific steps apply; usually they don't.

All paths below are relative to the **Retro68 repository root** (the directory
containing `.envrc` and `CMakeLists.txt`).

## Environment / PATH (optional)

If the repository is opened under nix + direnv (`.envrc` contains `use flake`),
`build/toolchain/bin` is added to `PATH` automatically. Treat this as
**optional**: someone building in a plain local environment will not have that
setup, so either add `build/toolchain/bin` to `PATH` yourself or call the tools
by relative path, e.g. `build/toolchain/bin/m68k-apple-macos-gcc`.

## If there is no `build/` tree yet

This skill assumes the toolchain is already built. To build it from scratch,
follow `README.md`; the entry point is `build-toolchain.bash`, which refuses to
run from the source directory and expects a separate build directory that becomes
the `build/`-style root (receiving `toolchain/`, `build-host/`, `build-target/`,
`build-target-ppc/`, `build-target-carbon/`, …).

## Layout you need to know

- `build/` is **git-ignored** (`/build` in `.gitignore`). Everything below is a
  build artifact; edits there do not show up in `git status`, and you can
  regenerate freely (but consider that a `gcc` rebuild takes a lot of time).
- `build/toolchain/` — the installed toolchain. `build/toolchain/bin` holds
  `m68k-apple-macos-gcc`, `m68k-apple-macos-objdump`, `Rez`, `LaunchAPPL`,
  `ConvertObj`, `MakeImport`, etc. Also `build/toolchain/m68k-apple-macos/`
  (the sysroot: `include`, `lib`, `RIncludes`).
- `build/build-host/` — host CMake tree; contains the in-tree toolchain files
  `build/build-host/cmake/intree.toolchain.cmake` (and `…ppc`, `…carbon`).
- `build/build-target/` — 68K target CMake tree. This is where `libretrocrt`,
  the Console library, the automated tests, the sample apps, and the LaunchAPPL
  Server (for 68K) are built.
- `build/build-target-ppc/`, `build/build-target-carbon/` — the PPC and Carbon
  target trees.
- `build/toolchain/multiversal/` — generated multiversal headers/libs
  (`CIncludes`, `RIncludes`, `src`, `obj`, `lib68k`, `libppc`).
- `build/toolchain/universal/` — Apple's Interfaces & Libraries, prepared at
  build time from `InterfacesAndLibraries/`. These are not part of the
  repository for copyright reasons, so a user may or may not have supplied them.

## Which interfaces are active

The sysroot *symlinks into* one interface tree:

```
build/toolchain/m68k-apple-macos/include/*  -> ../../universal/CIncludes/*   (or ../../multiversal/…)
build/toolchain/m68k-apple-macos/lib/*.a    -> ../../universal/lib68k/*      (or ../../multiversal/lib68k/*)
build/toolchain/RIncludes/*                 -> ../universal/RIncludes/*      (or ../multiversal/…)
```

Check which one is active with:

```
ls -la build/toolchain/m68k-apple-macos/lib/libInterface.a
```

`…/universal/lib68k/libInterface.a` means universal; `…/multiversal/…` means
multiversal. There is no `Multiverse.h` in the universal tree — its absence is a
reliable sign the toolchain is on universal.

## Switching interfaces

```
bash interfaces-and-libraries.sh build/toolchain --universal
bash interfaces-and-libraries.sh build/toolchain --multiversal
```

The script unlinks the current interface symlinks and relinks them to the other
tree. It prints harmless `powerpc-apple-macos/...: No such file or directory`
warnings when those PPC directories do not exist. The `--universal` /
`--multiversal` forms only relink headers and libraries; they do not rebuild
anything (see the `libretrocrt` section below).

## Regenerating multiversal (required after editing sources under `multiversal/`)

`glue.c` and the other files in `multiversal/custom/` are compiled into
`libInterface.a` by the generator, not by CMake:

```
cd multiversal
ruby make-multiverse.rb -G CIncludes -o ../build/toolchain/multiversal
```

Run this **from the `multiversal/` directory** (adjust `-o` if your build root
is named differently). It (re)writes
`build/toolchain/multiversal/{CIncludes,RIncludes,src,obj,lib68k}` and copies
`custom/*.c` into `src/` before compiling them. Functions the generated headers
declare `extern` are listed in `…/CIncludes/needs-glue.txt`; those must be
provided by `custom/glue.c`. If a `custom/*.c` file fails to compile, the
generator does **not** stop (it ignores the compiler's exit status) and the
resulting `libInterface.a` silently lacks that object — check that
`obj/<name>.o` exists for every `custom/*.c`.

For which `custom/*.c` land in which library, read
`multiversal/custom/libraries.yaml` and `multiversal/cincludes.rb`.

## CRITICAL: switching interfaces invalidates `libretrocrt`

`libretrocrt.a` is built against the *currently active* interface headers, and
the difference matters:

- Under **universal**, `GetHandleSize`/`GetPtrSize` are external library
  functions (provided by Apple's `Interface.o`).
- Under **multiversal**, they are inline traps (`0xA025`/`0xA021`).

So after switching interfaces you must rebuild the 68K target before linking any
app, or you will get errors like `undefined reference to GETHANDLESIZE` /
`GETPTRSIZE` (the 68k toolchain upper-cases symbol names).

Prefer rebuilding the whole target — it is quick and less likely to miss a
problem, and it relinks the Console library, the automated test apps, the sample
programs, and the LaunchAPPL Server, and installs `libretrocrt.a` for you:

```
cmake --build build/build-target --target install
```

(Use `build/build-target-ppc` or `build/build-target-carbon` when testing those
platforms.)

One pitfall: `make` decides by timestamps, so switching back to a tree whose
headers are *older* than the existing objects can look up-to-date and silently
skip the recompile. Force it with `touch libretro/*.c` (plus `touch` any other
sources that include the interface headers) or by adding `--clean-first` to the
`cmake --build` invocation.

A targeted rebuild is useful when you only care about the runtime library:

```
cmake --build build/build-target --target retrocrt
cp build/build-target/libretro/libretrocrt.a \
   build/toolchain/m68k-apple-macos/lib/libretrocrt.a
```

Do **not** `rm -rf build/build-target/libretro/CMakeFiles/retrocrt.dir` to force a
rebuild — that also deletes CMake's generated `build.make`, after which the
target fails with `No rule to make target '…/retrocrt.dir/build.make'`. If you
already did, re-run `cmake build/build-target` to regenerate, then build.

A quick sanity check that the toolchain is in a consistent state (writes into the
ignored `build/` tree):

```
printf 'int main(void){ return 0; }\n' > build/link-check.c
m68k-apple-macos-gcc build/link-check.c -o build/link-check.bin && echo LINK_OK
```

## Default link line

The 68k driver appends these by default (see `m68k-apple-macos-gcc -dumpspecs`):

```
--start-group -lc -lretrocrt -lInterface --end-group
```

So a plain `m68k-apple-macos-gcc foo.c -o foo.code.bin` already pulls in the C
runtime, the Retro68 runtime, and the interface library — you rarely need extra
`-l` flags.

## Building an app

Two options:

1. **CMake** (preferred, matches the samples): configure with
   `-DCMAKE_TOOLCHAIN_FILE=build/build-host/cmake/intree.toolchain.cmake`, then
   use `add_application(name file.c)` from `cmake/add_application.cmake`. This
   produces `name.bin` (MacBinary, ready for LaunchAPPL), `name.APPL`, and
   `name.dsk`.
2. **Manual**, for a quick throwaway (see the `retro68-launchapp-test-apps`
   skill for the `Rez` wrapping command).

## Restoring state

If you switched interfaces just to test something, switch back to whatever was
active before (check the symlink first) **and** rebuild the target in that
configuration. Leaving a universal-linked toolchain with a multiversal-built
`libretrocrt.a` (or vice versa) breaks ordinary app links.
