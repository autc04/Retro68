Retro68
=======

A GCC-based cross-compilation environment for 68K Macs.
Why? Because there is no decent C++11 Compiler targetting Apple's System 6.
If that's not a sufficient reason for you, I'm sure you will find
someting more useful elsewhere.

If you are crazy enough to try it out, please say hello at 
wolfgang.thaller@gmx.net.

Prerequisites
-------------

- Linux or Mac OS X
- boost, if using gcc 4.8 or earlier to compile on Linux
- CMake 2.8
- GCC dependencies: GMP 4.2+, MPFR 2.3.1+ and MPC 0.8.0+
- Apple Universal Interfaces (tested with version 3.1 - see below)
- An ancient Mac and/or an emulator.

For Ubuntu Linux, the following should help a bit:

    sudo apt-get install cmake libgmp-dev libmpfr-dev libmpc-dev

On a Mac, get the homebrew package manager and:

    brew install cmake gmp mpfr libmpc

You can also run Retro68 on a PowerMac G4 or G5 running Mac OS 10.4 (Tiger).
In that case, get the tigerbrew package manager and

    brew install gcc cmake



Apple Universal Interfaces
--------------------------

The Universal Interfaces used to be a free download from Apple. However,
they have taken the site offline and the license agreement prohibits
redistribution, so this might be a bit hard to find nowadays.

You do need a version that still supports 68K Mac development.

The package might be somewhere in this huge snapshot of Apple's FTP site made
by the Internet Archive:
https://archive.org/details/ftpsites_developer.apple.com

If you have a Mac or some other way to read DiskCopy images, grab the MPW 3.5
image from:

http://macintoshgarden.org/apps/macintosh-programmer%E2%80%99s-workshop

and use the CIncludes directory from there.

Put the C header files into a directory called "CIncludes" at the top
level of the Retro68 directory.

Building
--------

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

Sample programs are built as MacBinary files (*.bin) and also
automatically wrapped into raw disk images (*.dsk).
Look under Retro68-build/build-target/ for the compiled binaries.

Overview
--------

Retro68 is an aggegation of various existing free software
projects with a few small key components added.


Third Party Components:
- binutils 2.20.1
- gcc 4.9.1 with some Retro68-specific hacks
- newlib 2.10.1 (inside the gcc directory)
- elf2flt (from the ucLinux project's CVS)
- hfsutils 3.2.6 (just for convenience)

Retro68-Specific Components:
- ASFilter
- PrepareHeaders.hs
- MakeAPPL
- libretro
- Sample Program: Raytracer
- Sample Program: App2

### binutils

Currently unmodified from the original. Configured for m68k-unknown-elf.

### gcc

Various patches and hacks, most importantly:
- Changed register usage.
- Change the way 1-byte and 2-byte parameters are passed.
- support `"\pPascal String Literals"``
- added a pascal calling convention (`pascal` or `__attribute__((__pascal__))`)
- added `__attribute__((__raw_inline__(word1, word2, word3)))` to emulate `ONEWORDINLINE` and friends
- added `__attribute__((regparam("...")))` to specify custom register calling conventions
- - added `#pragma parameter` to specify custom register calling conventions

### newlib

Standard C library. Currently unmodified. The missing platform-dependent
bits haven't been added, instead they are found in 'libretro'.

### elf2flt

Converts from ELF to a much simpler binary format.
Minor patch: provide symbols around .init and .fini sections

### hfsutils:

Included for convenience. No changes.

### prepare-headers.sh:

Apply any necessary patches to Apple's headers; currently, this only modifies `ConditionalMacros.h`.

### ASFilter:

An evil hack. Installs a replacement for m68k-unknown-elf-as that
runs a few regexps on generated assembly code. Two things are changed:

1. Replace occurrences of the RTD instruction, with something that is supported on 68000 as well. GCC currently generates this in `pascal` functions that you declare.
2. While we're at it, remove unnecessary duplicate RTS instructions from MacsBug symbol names.

### MakeAPPL

Reads a FLAT executable as output by elf2flt and converts it to
a MacBinary file containing a classic Macintosh application.

### libretro

Contains startup code (handles relocations) and implementations
for some standard library functions.

### Sample Program: App2

Simple test program, includes an implementation of a simple text
console window.

The binary is at Retro68-build/build-target/App2/Test.bin
in MacBinary format and also on a disk image named Test.dsk.

### Sample Program: Raytracer

Calculates a nice 3D image, pixel by pixel.
There are two versions: raytracer.c is a straightforward
plain C implementation using floating point arithmetic.

Raytracer2 makes use of C++ features; it also uses
fixed point arithmetic instead of floating point
(operator overloading FTW).

The binaries are in Retro68-build/build-target/Raytracer.
Both MacBinary (.bin) and disk image (.dsk) formats are built.

License
-------

The original parts of Retro68 are licensed under GPL3+, as are
most other parts. Some parts are licensed GPL2+ or with more
liberal licenses. Check the copyright notices in the individual
files.

