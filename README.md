Retro68
=======

A GCC-based cross-compilation environment for 68K and PowerPC Macs.
Why? Because there is no decent C++17 Compiler targeting Apple's System 6.
If that's not a sufficient reason for you, I'm sure you will find
something more useful elsewhere.

If you are crazy enough to try it out, please say hello at 
wolfgang.thaller@gmx.net.

Installing/Building
-------------------

The Retro68 git repository uses submodules; be sure to use the `--recursive` option to `git clone` or use

    git submodule update --init

after cloning. To get the latest changes, use

    git pull
    git submodule update


Note: There is now experimental support for the [Nix Package Manager](www.nixos.org). If you're a nix user, skip ahead to the [Using Retro68 with Nix](#using-retro68-with-nix) section.

### Prerequisites

- Linux, Mac OS X or Windows (via Cygwin)
- boost
- CMake 3.9 or later
- GCC dependencies: GMP 4.2+, MPFR 2.3.1+ and MPC 0.8.0+
- bison version 3.0.2 or later
- ruby version 2.1 or later
- flex
- texinfo
- Recommended: Apple Universal Interfaces (version 3.x; version 3.4 is tested)
- An ancient Mac and/or an emulator.

For Ubuntu Linux, the following should help a bit:

    sudo apt-get install cmake libgmp-dev libmpfr-dev libmpc-dev libboost-all-dev bison flex texinfo ruby

For Arch Linux, this should do the trick:

    sudo pacman -S --needed cmake gmp mpfr libmpc boost bison flex texinfo ruby

On a Mac, get the homebrew package manager and:

    brew install boost cmake gmp mpfr libmpc bison texinfo

You can also run Retro68 on a PowerMac G4 or G5 running Mac OS 10.4 (Tiger).
In that case, get the tigerbrew package manager and

    brew install gcc cmake gmp mpfr libmpc bison texinfo
    brew install boost --c++11

### Apple Universal Interfaces vs. Multiversal Interfaces

To compile code for the Mac, you need header files and libraries describing
the APIs. There are two choices: Apple's Universal Interfaces, or the
brand-new open source reimplementation, the Multiversal Interfaces.

The Multiversal Interfaces are included with Retro68 out of the box, and they
are free software. However, they are incomplete and may still contain serious
bugs. Missing things include Carbon, MacTCP, OpenTransport, Navigation Services,
and basically everything introduced after System 7.0.

The Universal Interfaces used to be a free download from Apple. However,
they have taken the site off-line and the license agreement does not allow
redistribution, which is why it's not included in this repository.
The concept of fair use might cover keeping it available for reasons of historical
interest, or it might not. I am not a lawyer.

If you find a copy of Apple's Universal Interfaces, you can put it
inside the InterfacesAndLibraries directory in the source tree, and 
Version 3.4 has received the most testing, but any 3.x version could theoretically
work. The exact directory layout inside the InterfacesAndLibraries directory does
not matter. It will be picked up automatically when Retro68 is built.

The Universal Interfaces were also included with Apple's free-to-download
Macintosh Programmer's Workshop (MPW; redistribution is not officially allowed, either)
and with Metrowerks CodeWarrior.

One of the most easily found downloads is the MPW 3.5 Golden Master release,
usually in a file named *MPW-GM.img.bin* or *mpw-gm.img_.bin*. At the time of
this writing, this can be found at:

    http://macintoshgarden.org/apps/macintosh-programmers-workshop
    https://www.macintoshrepository.org/1360-macintosh-programmer-s-workshop-mpw-3-0-to-3-5
    https://staticky.com/mirrors/ftp.apple.com/developer/Tool_Chest/Core_Mac_OS_Tools/MPW_etc./MPW-GM_Images/MPW-GM.img.bin
    
You will need a Mac or a Mac emulator (with DiscCopy) to read that file.

### Windows Compilation using Cygwin

You can compile Retro68 on Windows using via a Cygwin terminal. When installing
Cygwin, select the following packages in the Cygwin Setup program (as per the dependencies 
listed above):

- bison
- cmake
- flex
- gcc-core
- gcc-g++
- libboost-devel
- libgmp-devel
- libmpc-devel
- libmpfr-devel
- make
- texinfo
- zlib-devel

Additional dependencies will be automatically installed.

Note that compilation via Cygwin is around 3X slower than other platforms.

### Compiling Retro68

Once you have all the prerequisites, execute these commands from the top level
of the Retro68 directory:

    mkdir ../Retro68-build
    cd ../Retro68-build
    ../Retro68/build-toolchain.bash

The toolchain will be installed in the "toolchain" directory inside
the build directory. All the commands are in `toolchain/bin`, so you might want
to add that to your `PATH`.

If you're building this on a PowerMac running Mac OS X 10.4, tell the build script
to use the gcc you've installed via tigerbrew:

    ../Retro68/build-toolchain.bash --host-cxx-compiler=g++-7 --host-c-compiler=gcc-7

### Build options and recompiling

Building all of Retro68 involves building binutils and gcc... twice, so it
takes quite a while. 

You can pass the `--no-68k`, `--no-ppc` or `--no-carbon`
flags to `build-toolchain` to limit yourself to the old Macs you're really
interested in (note that `--no-ppc` implies `--no-carbon`).

After the initial build, you can use the `--skip-thirdparty` option in order to
skip gcc and binutils and just compile the Retro68-specific tools, libraries and
sample programs.
The `build-host`, `build-target`, `build-target-ppc` and `build-target-carbon`
directories are CMake build directories generated from the top-level `CMakeLists.txt`,
so you can also `cd` to one of these and run `make` separately if you've made changes.

Using Retro68 with Nix
----------------------

If you are not using the [Nix Package Manager](https://www.nixos.org), please skip this section. But maybe you should be using it ;-).

Nix is a package manager that runs on Linux and macOS, and NixOS is a Linux distribution based on it.
Try the [Determinate Nix Installer](https://install.determinate.systems/) for the best installation experience.

[TODO: docs on using the binary cache to avoid builds]

Once you've got `nix` installed, and without checking out the Retro68 repository, you can run

    nix develop github:autc04/Retro68#m68k

from the Retro68 directory to get a shell with the compiler tools targeting
68K Macs available in the path, and `CC` and other environment variables already
set up for you. You can then `cd` to one of the example directories or to your
own project and use `cmake` to build it.

Likewise, use

    nix develop github:autc04/Retro68#powerpc

... to get an environment targeting PowerPC Macs.

If you have a local checkout of Retro68, you can replace `github:autc04/Retro68` by the path
to that local checkout, e.g., run `nix develop .#m68k` from inside the Retro68 directory.

You can also use the `nix build` command to build packages. As always with `nix`,
the result will be somewhere in a subdirectory of `/nix/store`, with a symlink
named `result` placed in the directory where you invoked the command.

| Command                                                            | What                                      |
|--------------------------------------------------------------------|-------------------------------------------|
| `nix build github:autc04/Retro68#samples-m68k`                     | Sample programs for 68K                   |
| `nix build github:autc04/Retro68#samples-powerpc`                  | Sample programs for PowerPC               |
| `nix build github:autc04/Retro68#pkgsCross.m68k.zlib`              | zlib library, cross-compiled for 68K Macs |
| `nix build github:autc04/Retro68#pkgsCross.m68k.`*packagename*     | cross-compile *packagename* to 68K        |
| `nnix build github:autc04/Retro68#pkgsCross.powerpc.`*packagename* | cross-compile *packagename* to PowerPC    |

You can attempt to cross-compile *any* package from the `nixpkgs` collection. Unless the
package contains a very portable library, the command will of course fail. Please don't
report bugs, please report successes instead!


Using Retro68 with Docker
-------------------------

Whenever commits are merged into the Retro68 git repository, a build pipeline is triggered to
create a container image which is then pushed to the Retro68 package repository as
`ghcr.io/autc04/retro68`. This image contains the complete 68K and PPC toolchains ready for
use for either local development or as part of CI pipeline. The command line below shows an
example invocation of Retro68 to build the `Samples/Raytracer` app:

```
$ git clone --depth 1 https://github.com/autc04/Retro68.git
$ cd Retro68
$ docker run --rm -v $(pwd):/root -i ghcr.io/autc04/retro68 /bin/bash <<"EOF"
    cd Samples/Raytracer
    rm -rf build && mkdir build && cd build
    cmake .. -DCMAKE_TOOLCHAIN_FILE=/Retro68-build/toolchain/m68k-apple-macos/cmake/retro68.toolchain.cmake
    make
EOF
```

The container image is configured by default to use the multiversal interfaces, but it is
possible to use the universal interfaces by passing a path to either a local file or a URL
that points to a Macbinary DiskCopy image containing the "Interfaces&Libraries" directory
from MPW.

Using the universal interfaces from a local file:

```
$ docker run --rm -v $(pwd):/root -v $(pwd)/MPW-GM.img.bin:/tmp/MPW-GM.img.bin \
  -e INTERFACES=universal -e INTERFACESFILE=/tmp/MPW-GM.img.bin \
  -i ghcr.io/autc04/retro68 /bin/bash <<"EOF"
    cd Samples/Raytracer
    rm -rf build && mkdir build && cd build
    cmake .. -DCMAKE_TOOLCHAIN_FILE=/Retro68-build/toolchain/m68k-apple-macos/cmake/retro68.toolchain.cmake
    make
EOF
```

Using the universal interfaces from a URL:

```
$ docker run --rm -v $(pwd):/root \
  -e INTERFACES=universal -e INTERFACESFILE=https://mysite.com/MPW-GM.img.bin \
  -i ghcr.io/autc04/retro68 /bin/bash <<"EOF"
    cd Samples/Raytracer
    rm -rf build && mkdir build && cd build
    cmake .. -DCMAKE_TOOLCHAIN_FILE=/Retro68-build/toolchain/m68k-apple-macos/cmake/retro68.toolchain.cmake
    make
EOF
```

Note that `entrypoint.sh` checks to see if the universal interfaces are installed into
`/Retro68/toolchain/universal` first before attempting to access the file or URL specified
by INTERFACESFILE. This means that it is possible to use caching or another volume so that
the universal interfaces are only processed once to speed up builds e.g.

```
$ docker run --rm -v $(pwd):/root \
  -v $(pwd)/universal:/Retro68-build/toolchain/universal \
  -e INTERFACES=universal -e INTERFACESFILE=https://mysite.com/MPW-GM.img.bin \
  -i ghcr.io/autc04/retro68 /bin/bash <<"EOF"
    cd Samples/Raytracer
    rm -rf build && mkdir build && cd build
    cmake .. -DCMAKE_TOOLCHAIN_FILE=/Retro68-build/toolchain/m68k-apple-macos/cmake/retro68.toolchain.cmake
    make
EOF
```

and then on subsequent runs:

```
$ docker run --rm -v $(pwd):/root \
  -v $(pwd)/universal:/Retro68-build/toolchain/universal \
  -e INTERFACES=universal \
  -i ghcr.io/autc04/retro68 /bin/bash <<"EOF"
    cd Samples/Raytracer
    rm -rf build && mkdir build && cd build
    cmake .. -DCMAKE_TOOLCHAIN_FILE=/Retro68-build/toolchain/m68k-apple-macos/cmake/retro68.toolchain.cmake
    make
EOF
```


Sample programs
---------------

Sample programs are built in several formats:
- On Macs: Real Mac Applications (`ApplicationName.APPL`)
- Elsewhere: `ApplicationName.APPL`, `.rsrc/ApplicationName.APPL`, `.finf/ApplicationName.APPL` (BasiliskII/Sheepshaver compatible)
- MacBinary files (`ApplicationName.bin`)
- Raw HFS disk image (`ApplicationName.dsk`, containing `ApplicationName`)
- AppleDouble file pairs (`ApplicationName.ad`, `%ApplicationName.ad`, Executor compatible)

Look under `Retro68-build/build-target/` (68K),
`Retro68-build/build-target-ppc/` (PowerPC Classic) and
`Retro68-build/build-target-carbon/` (PowerPC Carbon) for the compiled examples,
especially under the `Samples` subdirectory.

Components
----------

Retro68 is an aggegation of various existing free software
projects with a few components added.


Third Party Components:
- binutils 2.31.1
- gcc 9.1.0
- newlib 3.0.0 (inside the gcc directory)
- libelf from elfutils-0.170
- hfsutils 3.2.6

Retro68-Specific Components:
- ResourceFiles library
- Rez
- PEFTools (MakePEF and MakeImport)
- Elf2Mac
- LaunchAPPL
- libretro
- TestApps - a few tiny test programs
- AutomatedTests
- Sample Programs: Raytracer, HelloWorld, Launcher, Dialog

### binutils

Two new target platforms:
- `m68k-apple-macos`, based on the `m68k-unknown-elf` target
- `powerpc-apple-macos`, based on the `powerpc-ibm-aix` target

The powerpc target has a few hacks to make weak symbols work as expected.
The elf target has a hack to protect MacsBug symbols from -gc-sections.

### gcc

Various patches and hacks:
- New target platforms `m68k-apple-macos` and `powerpc-apple-macos`.
- support `"\pPascal String Literals"`

68K specific:
- Changed register usage.
- Change the way 1-byte and 2-byte parameters are passed.
- added a pascal calling convention (`pascal` or `__attribute__((__pascal__))`)
- added `__attribute__((__raw_inline__(word1, word2, word3)))` to emulate `ONEWORDINLINE` and friends
- added `__attribute__((regparam("...")))` to specify custom register calling conventions
- added `#pragma parameter` to specify custom register calling conventions
- added support for the `= { 0x1234 }` syntax for inline machine code.

PowerPC specific:
- New flag -carbon that makes gcc link with `-lCarbonLib` instead of `-lInterfaceLib`

### newlib

Standard C library. Currently unmodified. The missing platform-dependent
bits haven't been added, instead they are found in 'libretro'.

### libelf

A library for convenient access to ELF files, taken from the elfutils-0.170
package. Or rather, brutally ripped out of it, hacked to compile on non-linux
platforms (<endian.h> is not a standard header file), and made to build with
cmake instead of autotools. Much simpler now.

### hfsutils

No changes.

### ResourceFiles

A C++ Library for manipulating resource forks.

### Rez

A reimplementation of Apple's Rez resource compiler. Reads `.r` files
containing textual resource descriptions and compiles them to binary
resource files.

### Elf2Mac

A wrapper around the linker for 68K programs; it supplies a linker script,
invokes the linker, and converts the resulting ELF binary to a Mac APPL with
one or more segments, or to a flat file which can be converted to a code resource
using Rez.

### LaunchAPPL

A tool for lauching compiled Mac applications via various emulators.

### ConvertObj

Reads a MPW 68K Object file (`*.o`) and converts it to input for the 
GNU assembler (`powerpc-apple-macos-as`). Well, as long as the .o file does not
use global variables or non-local function calls. Used to import glue code from
MPW's `Interface.o` library.

### PEFTools

Tools supporting the Apple's PEF format, the Preferred Executable Format
for PowerPC Macs.

- `MakePEF`, a tool to convert xcoff files to PEF.
- `MakeImport`, a tool to create an xcoff import stub library from a PEF-format library.

### prepare-headers.sh:

Apply any necessary patches to Apple's headers.

### ImportLibraries

Import Libraries in XCOFF format. Based on the list of symbols in Apple's import
libraries. Generated using the `MakeImport` tool.

### libretro

Contains startup code (handles relocations on 68K) and implementations
for some standard library functions.

### Console

Contains a library that implements basic text console functionality.

### AutomatedTests

An automated test suite that can be run using `ctest` and `LaunchAPPL`.

### Sample Program: Hello World

The binary is in Retro68-build/build-target/Samples/HelloWorld/.

### Sample Program: Raytracer

Calculates a nice 3D image, pixel by pixel.
There are two versions: raytracer.c is a straightforward
plain C implementation using floating point arithmetic.

Raytracer2 makes use of C++ features; it also uses
fixed point arithmetic instead of floating point
(operator overloading FTW).

The binaries are in Retro68-build/build-target/Samples/Raytracer/.

### Sample Program: Launcher

A utility program for using Retro68 together with the minivmac emulator.
Waits for a disk(image) to be inserted, and if it contains a single application, launches it.
After the application exits, the disk is ejected again.
This way, you can just drag a .dsk file generated by Retro68 on a minivmac Window to run your application.

Intended for System 6 without Multifinder.

### Sample Program: Dialog

Shows a simple and useless dialog box. Demonstrates how to use Rez, the resource compiler.
The binary is in Retro68-build/build-target/Samples/Dialog/.

### Sample Program: WDEF

On the one hand, this is an example for a very basic multi window application with menus and desk accessories.
On the other hand, it shows how to write code resources like WDEF window definition procedures.

License
-------

The original parts of Retro68 are licensed under [GPL3+](./COPYING), as are
most other parts. Some parts are licensed GPL2+ or with more
liberal licenses. The *libretro* runtime library is licensed under GPL3+ with the
GCC runtime exception (see [COPYING.RUNTIME](./COPYING.RUNTIME), so there are no licensing restrictions
on programs compiled with Retro68.
Check the copyright notices in the individual files for details.


LaunchAPPL and the Test Suite
-----------------------------

`LaunchAPPL` is a tool included with Retro68 intended to make launching the
compiled Mac applications easier. Its use is optional, so you may skip reading
this section.

Currently, LaunchAPPL supports the following methods for launching Mac applications:

* classic - launch in the Classic environment on PowerPC Macs up to Tiger (10.4)
* carbon - launch as a Carbon app on PowerPC Macs and via Rosetta on Intel Macs up to Snow Leopard (10.6)
* minivmac - launch using the Mini vMac emulator
* executor - launch using Executor
* ssh - Invoke the `LaunchAPPL` tool remotely via ssh
* serial - Connect to a real Mac running the `LaunchAPPLServer` application via a null modem cable
* tcp - Connect to a real Mac running the `LaunchAPPLServer` application via a completely insecure TCP connection
* shared - Communicate with `LaunchAPPLServer` via files in a shared folder

If you're running on a Mac that's old enough to use the `classic` or `carbon` backends,
they will work out of the box, just launch an application as follows
(assuming you've added `Retro68-build/toolchain/bin` to your `PATH`):

    LaunchAPPL -e classic Retro68-build/build-target/Samples/Raytracer/Raytracer2.bin
    LaunchAPPL -e carbon Retro68-build/build-target-carbon/Samples/Raytracer/Raytracer2.bin

To specify either environment as a default, or to configure one of the other emulators,
copy the file `Retro68/LaunchAPPL/LaunchAPPL.cfg.example` to `~/.LaunchAPPL.cfg`
and edit to taste (documentation is provided in comments).

**CONTRIBUTION OPPORTUNITY** - This tool can easily be extended with further backends,
so make it work with your favourite emulator. Just add new subclasses for the
`LaunchMethod` and `Launcher` classes, they're documented.

### The Test Suite

The directory `AutomatedTests` contains an automated test suite that runs via
`LaunchAPPL`. It's currently only relevant if you want to hack on the low-level
parts of Retro68.

The test suite will be configured automatically on sufficiently old Macs.
Everywhere else, first configure `LaunchAPPL` (see above). 
    
To run the tests, invoke `ctest` in the `Retro68-build` directory, or in one
of the `build-target`, `build-target-ppc` or `build-target-carbon` directories.

    ctest

You can also use the cmake variable `RETRO68_LAUNCH_METHOD` to override the LaunchAPPL default
for specific platforms:

    cmake . -DRETRO68_LAUNCH_METHOD=minivmac
