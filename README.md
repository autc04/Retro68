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
- Glasgow Haskell Compiler (GHC) 
- GCC dependencies: GMP 4.2+, MPFR 2.3.1+ and MPC 0.8.0+
- Apple Universal Interfaces (tested with version 3.1 - see below)
- An ancient Mac and/or an emulator.

For Ubuntu Linux, the following should help a bit:

    sudo apt-get install cmake ghc libgmp-dev libmpfr-dev libmpc-dev

On a Mac, get the homebrew package manager and:

    brew install cmake gmp mpfr libmpc

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
- gcc 4.7.0 with some Retro68-specific hacks
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
- added a Microsoft-style 'stdcall' calling convention.
  What we really want is a 'pascal' calling convention, but that's harder
  to implement, and the MS one is close enough.

### newlib

Standard C library. Currently unmodified. The missing platform-dependent
bits haven't been added, instead they are found in 'libretro'.

### elf2flt

Converts from ELF to a much simpler binary format.
Minor patch: provide symbols around .init and .fini sections

### hfsutils:

Included for convenience. No changes.

### ASFilter:

The most evil hack. Installs a replacement for m68k-unknown-elf-as that
replaces all instructions of the form

    jsr __magic_inline_1234_5678_9ABC

by
    
    dc.w 0x1234
    dc.w 0x5678
    dc.w 0x9abc

### PrepareHeaders.hs

A small Haskell program that parses header files (specifically, Apple's
Universal Headers), understands inline declarations and translates
them to a form that gcc already understands.

For OS Traps (parameters in registers), static inline functions
with inline assembly are generated.

For Toolbox Traps (pascal calling convention), the stdcall calling
convention and the __magic_inline hack described above are used.


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

