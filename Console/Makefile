# path to RETRO68
RETRO68=../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-apple-macos
CC=$(RETRO68)/bin/m68k-apple-macos-gcc
CXX=$(RETRO68)/bin/m68k-apple-macos-g++
REZ=$(RETRO68)/bin/Rez

LDFLAGS=retro/libConsole.a 
RINCLUDES=$(PREFIX)/RIncludes
REZFLAGS=-I$(RINCLUDES)

ConsoleTest.bin ConsoleTest.APPL ConsoleTest.dsk: ConsoleTest.code.bin
	$(REZ) $(REZFLAGS) \
		--copy "ConsoleTest.code.bin" \
		"$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o ConsoleTest.bin --cc ConsoleTest.APPL --cc ConsoleTest.dsk


ConsoleTest.code.bin: ConsoleTest.o
	$(CXX) $< -o $@ $(LDFLAGS)	# C++ used for linking because RetroConsole needs it

.PHONY: clean
clean:
	rm -f ConsoleTest.bin ConsoleTest.APPL ConsoleTest.dsk ConsoleTest.code.bin ConsoleTest.code.bin.gdb ConsoleTest.o
