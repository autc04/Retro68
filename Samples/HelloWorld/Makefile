# path to RETRO68
RETRO68=../../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-unknown-elf
CC=$(RETRO68)/bin/m68k-unknown-elf-gcc
CXX=$(RETRO68)/bin/m68k-unknown-elf-g++
REZ=$(RETRO68)/bin/Rez

LDFLAGS=-lRetroConsole
RINCLUDES=$(PREFIX)/RIncludes
REZFLAGS=-I$(RINCLUDES)

HelloWorld.bin HelloWorld.APPL HelloWorld.dsk: HelloWorld.flt
	$(REZ) $(REZFLAGS) \
		-DFLT_FILE_NAME="\"HelloWorld.flt\"" "$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o HelloWorld.bin --cc HelloWorld.APPL --cc HelloWorld.dsk


HelloWorld.flt: hello.o
	$(CXX) $< -o $@ $(LDFLAGS)	# C++ used for linking because RetroConsole needs it

.PHONY: clean
clean:
	rm -f HelloWorld.bin HelloWorld.APPL HelloWorld.dsk HelloWorld.flt HelloWorld.flt.gdb hello.o
