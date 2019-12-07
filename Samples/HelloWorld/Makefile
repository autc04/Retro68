# path to RETRO68
RETRO68=../../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-apple-macos
CC=$(RETRO68)/bin/m68k-apple-macos-gcc
CXX=$(RETRO68)/bin/m68k-apple-macos-g++
REZ=$(RETRO68)/bin/Rez

LDFLAGS=-lRetroConsole
RINCLUDES=$(PREFIX)/RIncludes
REZFLAGS=-I$(RINCLUDES)

HelloWorld.bin HelloWorld.APPL HelloWorld.dsk: HelloWorld.code.bin
	$(REZ) $(REZFLAGS) \
		--copy "HelloWorld.code.bin" \
		"$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o HelloWorld.bin --cc HelloWorld.APPL --cc HelloWorld.dsk


HelloWorld.code.bin: hello.o
	$(CXX) $< -o $@ $(LDFLAGS)	# C++ used for linking because RetroConsole needs it

.PHONY: clean
clean:
	rm -f HelloWorld.bin HelloWorld.APPL HelloWorld.dsk HelloWorld.code.bin HelloWorld.code.bin.gdb hello.o
