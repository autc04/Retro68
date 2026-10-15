---
name: retro68-launchapp-test-apps
description: Build a 68K Mac application that runs as an automated test through LaunchAPPL, and understand how the host captures the app's output. Use this when you need to run a Retro68 68K app end-to-end (e.g. to validate an Interface or glue change), when an app "hangs" or times out under LaunchAPPL, or when you need to get text out of a Mac app back to the terminal.
---

# Running Retro68 apps as automated tests with LaunchAPPL

## Key idea: output goes through a file called `out`

A classic Mac app has no stdout. LaunchAPPL bridges this with a file
convention (see `LaunchAPPL/Client/Launcher.cc` and
`LaunchAPPL/Client/StreamBasedLauncher.cc`):

1. `Launcher` creates an empty file named **`out`** next to the application.
2. The app is transferred to the Mac and run; the app is expected to **append
   its results to `out`** in its own directory and then **quit**.
3. When the app exits, LaunchAPPL reads the `out` file back and `DumpOutput()`
   writes its contents to the host's stdout.

Consequences:

- A test app must **terminate**. An app that opens a window and sits in a
  `GetNextEvent` loop will just hit the timeout. A plain (non-CONSOLE) app that
  returns from `main` after writing `out` is ideal.
- Write results the same way `AutomatedTests/Test.h` does: open `out` with
  `PBHOpenSync` (`ioVRefNum = 0`, `ioDirID = 0`), `PBWriteSync` from EOF, close,
  and `PBFlushVolSync`. Note that `PBWriteSync`/`PBCloseSync`/`PBFlushVolSync`
  take a `ParamBlockRec*`, while `PBHOpen*` take an `HParamBlockRec*` — use two
  block variables or cast carefully.

## Config and invocation

LaunchAPPL reads `~/.LaunchAPPL.cfg`, which may configure **any** combination of
emulators/environments (minivmac, executor, classic, carbon, serial, tcp, ssh,
shared, …) and may designate any one of them as the default. The actual setup is
specific to the machine you are on: it may use different emulators, real
hardware, or a headless server, and it may not be available at all times.

So, before running anything:

- Find out what is configured with `LaunchAPPL --list-emulators`.
- **Honour the user's preference**: run `LaunchAPPL <app>` without `-e` and let
  the configured default decide. Only pass `-e <name>` when you have a specific
  reason to override it.
- If no emulator is configured/available, if the run cannot connect or times
  out, or if you are simply unsure which emulator/environment is appropriate,
  **ask the user** — don't pick one yourself or silently switch connections.

```
LaunchAPPL --list-emulators               # what is configured on this machine
LaunchAPPL --timeout=60 path/to/App.bin   # uses the configured default
LaunchAPPL -e <name> --timeout=60 path/to/App.bin   # override, only if intended
```

- `--timeout=60` matters on slow emulators and real hardware.
- Resource requirements depend on the connection: a TCP launch needs a running
  `LaunchAPPLServer` on the far end (port 1984) and, in a network-restricted
  sandbox, raw-socket/unsandboxed access (HTTP-proxy host allowlists cannot
  grant loopback or IP literals); a serial launch needs a port/cable; and so on.
  Do not assume a particular transport — read `~/.LaunchAPPL.cfg`.

## Building the test app

**CMake** (see `AutomatedTests/CMakeLists.txt` for the pattern). Configure with
`-DCMAKE_TOOLCHAIN_FILE=build/build-host/cmake/intree.toolchain.cmake`, then:

```cmake
add_application(MyTest mytest.c)           # no CONSOLE for a toolbox app
add_test(NAME M68K.MyTest COMMAND ${LAUNCH_APPL} --timeout=10 MyTest.bin)
set_tests_properties(M68K.MyTest PROPERTIES PASS_REGULAR_EXPRESSION "OK")
```

(`AutomatedTests/CMakeLists.txt` additionally pins the launch method explicitly
via `--list-emulators`, so a test suite doesn't depend on the default; for a
one-off manual run, prefer the configured default and pass `-e <name>` only if
needed.)

`add_application` produces `MyTest.bin` (MacBinary, ready for LaunchAPPL).

**Manual** (quick throwaway), from the project root with the toolchain on PATH:

```
CC=build/toolchain/bin/m68k-apple-macos-gcc
REZ=build/toolchain/bin/Rez
RINC=build/toolchain/m68k-apple-macos/RIncludes

$CC -c mytest.c -o mytest.o -O -Wall
$CC mytest.o -o mytest.code.bin
$REZ -I"$RINC" --copy mytest.code.bin "$RINC/Retro68APPL.r" \
     -t APPL -c '????' -o mytest.bin --cc mytest.APPL --cc mytest.dsk
```

Then run it through LaunchAPPL as described above (e.g.
`LaunchAPPL --timeout=60 mytest.bin`).

## Writing a good test app

- Log one result per line (`"3 HSetFInfo: err=0"`), so a failing line is easy to
  spot and easy to assert on with `PASS_REGULAR_EXPRESSION`.
- To exercise code that must not depend on stack residue (uninitialised
  param-block fields, etc.), poison the stack just before each call and run each
  case twice — once with `0x0000`, once with a non-zero pattern. See the
  `repro-uninitialised-struct-read` skill if it is installed.
- When the bug is only observable under conditions the configured
  emulator/hardware can't provide (a volume format it doesn't support, an older
  OS, etc.), say so in the output and fall back to inspecting the generated
  code; don't pretend the runtime test covered it.

## Gotchas

- Most OS symbol names in the 68k toolchain are upper-cased (`nm`, `objdump -d`,
  `objdump -t`, linker messages all show `HOPEN`, `GETWDINFO`, `GETHANDLESIZE`).
- The app's current directory on the Mac is the folder it was launched from, so
  a relative `"out"` naturally lands next to the app. If a test creates scratch
  files, give them unique names or delete/recreate them each run — the launch
  folder is reused between runs.
- `PBOpenWDSync`-by-name is surprising: opening a disk WD by name returns the
  *parent* directory ID in `ioWDDirID`, not the named directory's. Use
  `PBGetCatInfoSync` (`CInfoPBRec.dirInfo.ioDrDirID`) to resolve a directory ID
  by name.
