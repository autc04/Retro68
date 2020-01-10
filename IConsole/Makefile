# path to RETRO68
RETRO68=../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-apple-macos
CC=$(RETRO68)/bin/m68k-apple-macos-gcc
CXX=$(RETRO68)/bin/m68k-apple-macos-g++
REZ=$(RETRO68)/bin/Rez

LDFLAGS=retro/libIConsole.a 
RINCLUDES=$(PREFIX)/RIncludes
REZFLAGS=-I$(RINCLUDES)

IConsoleTest.bin IConsoleTest.APPL IConsoleTest.dsk: IConsoleTest.code.bin
	$(REZ) $(REZFLAGS) \
		--copy "IConsoleTest.code.bin" \
		"$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o IConsoleTest.bin --cc IConsoleTest.APPL --cc IConsoleTest.dsk


IConsoleTest.code.bin: IConsoleTest.o
	$(CXX) $< -o $@ $(LDFLAGS)	# C++ used for linking because RetroConsole needs it

.PHONY: clean
clean:
	rm -f IConsoleTest.bin IConsoleTest.APPL IConsoleTest.dsk IConsoleTest.code.bin IConsoleTest.code.bin.gdb IConsoleTest.o
