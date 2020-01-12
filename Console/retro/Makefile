# path to RETRO68
RETRO68=../../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-apple-macos
CC=$(RETRO68)/bin/m68k-apple-macos-gcc
CXX=$(RETRO68)/bin/m68k-apple-macos-g++
REZ=$(RETRO68)/bin/Rez
AR=$(RETRO68)/bin/m68k-apple-macos-gcc-ar

LDFLAGS=
RINCLUDES=$(PREFIX)/RIncludes
REZFLAGS=-I$(RINCLUDES)


libConsole.a: Console.o ConsoleWindow.o InitConsole.o
	$(AR) rcs $@ $? 

.PHONY: clean
clean:
	rm -f Console.o ConsoleWindow.o InitConsole.o
