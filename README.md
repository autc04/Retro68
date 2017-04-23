Retro68
=======

A GCC-based cross-compilation environment for 68K and PowerPC Macs.
Why? Because there is no decent C++11 Compiler targeting Apple's System 6.
If that's not a sufficient reason for you, I'm sure you will find
something more useful elsewhere.

If you are crazy enough to try it out, please say hello at 
wolfgang.thaller@gmx.net.

Installing/Building
-------------------

### Prerequisites

- Linux or Mac OS X
- boost
- CMake 2.8
- GCC dependencies: GMP 4.2+, MPFR 2.3.1+ and MPC 0.8.0+
- bison version 3.0.2 or later
- Apple Universal Interfaces (version 3.x; version 3.4 is tested)
- An ancient Mac and/or an emulator.

For Ubuntu Linux, the following should help a bit:

    sudo apt-get install cmake libgmp-dev libmpfr-dev libmpc-dev libboost-all-dev bison

On a Mac, get the homebrew package manager and:

    brew install cmake gmp mpfr libmpc boost bison

In theory, you can also run Retro68 on a PowerMac G4 or G5 running Mac OS 10.4 (Tiger).
In that case, get the tigerbrew package manager and

    brew install gcc cmake

### Apple Universal Interfaces

Before you can build Retro68, you need to find a copy of Apple's Universal Interfaces
and put it inside the InterfacesAndLibraries directory in the source tree.
Version 3.4 has received the most testing, but any 3.x version could theoretically
work.
The exact directory layout inside the InterfacesAndLibraries directory does
not matter. The resource forks of the files are not required.

The Universal Interfaces used to be a free download from Apple. However,
they have taken the site off-line and the license agreement does not allow
redistribution, which is why it's not included in this repository.
The concept of fair use might cover keeping it available for reasons of historical
interest, or it might not. I am not a lawyer.

The Universal Interfaces were also included with Apple's free-to-download
Macintosh Programmer's Workshop (MPW; redistribution is not officially allowed, either)
and with Metrowerks CodeWarrior.

One of the most easily found downloads is the MPW 3.5 Golden Master release,
usually in a file named mpg-gm.img_.bin. At the time of this writing, this can be
found at:

    http://macintoshgarden.org/apps/macintosh-programmers-workshop
    https://www.macintoshrepository.org/1360-macintosh-programmer-s-workshop-mpw-3-0-to-3-5

    
You will need a Mac or a Mac emulator (with DiscCopy) to read that file.


If all else fails, the package is somewhere in this huge (4.7GB) snapshot of
Apple's FTP site at Internet Archive:
    
    https://archive.org/details/ftpsites_developer.apple.com



### Compiling Retro68

Once you have all the prerequisites, execute these commands from the top level
of the Retro68 directory:

    cd ..
    mkdir Retro68-build
    cd Retro68-build
    sh ../Retro68/build-toolchain.sh 

The toolchain will be installed in the "toolchain" directory inside
the build directory.

Sample programs
---------------

Sample programs are built in several formats:
- On Macs: Real Mac Applications (`ApplicationName.APPL`)
- Elsewhere: `ApplicationName.APPL`, `.rsrc/ApplicationName.APPL`, `.finf/ApplicationName.APPL` (BasiliskII/Sheepshaver compatible)
- MacBinary files (`ApplicationName.bin`)
- Raw HFS disk image (`ApplicationName.dsk`, containing `ApplicationName`)

Look under `Retro68-build/build-target/` (68K),
`Retro68-build/build-target-ppc/` (PowerPC Classic) and
`Retro68-build/build-target-carbon/` (PowerPC Carbon) for the compiled examples.

Components
----------

Retro68 is an aggegation of various existing free software
projects with a few components added.


Third Party Components:
- binutils 2.25.1
- gcc 5.2.0
- newlib 2.10.1 (inside the gcc directory)
- elf2flt (from the ucLinux project's CVS)
- hfsutils 3.2.6

Retro68-Specific Components:
- ResourceFiles library
- Rez
- PEFTools (MakePEF and MakeImport)
- MakeAPPL
- libretro
- TestApps - a few tiny test programs
- Sample Programs: Raytracer, HelloWorld, Launcher, Dialog

### binutils

Two new target platforms:
- `m68k-apple-macos`, based on the `m68k-unknown-elf` target
- `powerpc-apple-macos`, based on the `powerpc-ibm-aix` target

The powerpc target has a few hacks to make weak symbols work as expected.

### gcc

Various patches and hacks:
- New target platforms `m68k-apple-macos` and `powerpc-apple-macos`.
- support `"\pPascal String Literals"``

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

### elf2flt

Converts from ELF to a much simpler binary format.
Minor patch: provide symbols around .init and .fini sections

### hfsutils:

No changes.

### MakeAPPL

Reads a FLAT executable as output by elf2flt and converts it to
a MacBinary file containing a classic Macintosh application.

### ResourceFiles

A C++ Library for manipulating resource forks.

### Rez

A reimplementation of Apple's Rez resource compiler. Reads `.r` files
containing textual resource descriptions and compiles them to binary
resource files.

### PEFTools

- `MakePEF`, a tool to convert xcoff files to Apple's PEF format.
- `MakeImport`, a tool to create an xcoff import stub library from a PEF-format library.

### prepare-headers.sh:

Apply any necessary patches to Apple's headers; currently, this only modifies `ConditionalMacros.h`.

### ImportLibraries

Import Libraries in XCOFF format. Based on the list of symbols in Apple's import
libraries. Generated using the `MakeImport` tool.

### libretro

Contains startup code (handles relocations on 68K) and implementations
for some standard library functions.

### Console

Contains a library that implements basic text console functionality.

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


License
-------

The original parts of Retro68 are licensed under GPL3+, as are
most other parts. Some parts are licensed GPL2+ or with more
liberal licenses. Check the copyright notices in the individual
files.
