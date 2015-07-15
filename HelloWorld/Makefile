# path to RETRO68
RETRO68=../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-unknown-elf
CC=$(RETRO68)/bin/m68k-unknown-elf-gcc
CXX=$(RETRO68)/bin/m68k-unknown-elf-g++
MAKEAPPL=$(RETRO68)/bin/MakeAPPL

LDFLAGS=-lRetroConsole

HelloWorld.bin HelloWorld.APPL HelloWorld.dsk: HelloWorld.flt
	$(MAKEAPPL) -c HelloWorld.flt -o HelloWorld

HelloWorld.flt: hello.o
	$(CXX) $< -o $@ $(LDFLAGS)	# C++ used for linking because RetroConsole needs it
