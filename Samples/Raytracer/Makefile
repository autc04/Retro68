# Makefile for standalone building of Raytracer example
# Double-check RETRO68 variable below and run 'make'.

# path to RETRO68
RETRO68=../../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-unknown-elf
CC=$(RETRO68)/bin/m68k-unknown-elf-gcc
CXX=$(RETRO68)/bin/m68k-unknown-elf-g++
REZ=$(RETRO68)/bin/Rez
MAKEAPPL=$(RETRO68)/bin/MakeAPPL

CXXFLAGS=-std=c++11
LDFLAGS=-Wl,-gc-sections -lm
RINCLUDES=$(PREFIX)/RIncludes
REZFLAGS=-I$(RINCLUDES)

all: Raytracer.bin Raytracer2.bin FixedBenchmark.bin
.PHONY: all clean

clean:
	rm -f Raytracer.bin Raytracer.APPL Raytracer.dsk Raytracer.flt Raytracer.flt.gdb
	rm -f Raytracer2.bin Raytracer2.APPL Raytracer2.dsk Raytracer2.flt Raytracer2.flt.gdb
	rm -f FixedBenchmark.bin FixedBenchmark.APPL FixedBenchmark.dsk FixedBenchmark.flt FixedBenchmark.flt.gdb
	rm -f fixed.o raytracer.o raytracer2.o fixedbenchmark.o

Raytracer.bin Raytracer.APPL Raytracer.dsk: Raytracer.flt
	$(REZ) $(REZFLAGS) \
		-DFLT_FILE_NAME="\"Raytracer.flt\"" "$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o Raytracer.bin --cc Raytracer.APPL --cc Raytracer.dsk

Raytracer.flt: raytracer.o
	$(CC) $^ -o $@ $(LDFLAGS)
	
Raytracer2.bin Raytracer2.APPL Raytracer2.dsk: Raytracer2.flt
	$(REZ) $(REZFLAGS) \
		-DFLT_FILE_NAME="\"Raytracer2.flt\"" "$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o Raytracer2.bin --cc Raytracer2.APPL --cc Raytracer2.dsk

Raytracer2.flt: raytracer2.o fixed.o
	$(CXX) $^ -o $@ $(LDFLAGS)
	
FixedBenchmark.bin FixedBenchmark.APPL FixedBenchmark.dsk: FixedBenchmark.flt
	$(REZ) $(REZFLAGS) \
		-DFLT_FILE_NAME="\"FixedBenchmark.flt\"" "$(RINCLUDES)/Retro68APPL.r" \
		-t "APPL" -c "????" \
		-o FixedBenchmark.bin --cc FixedBenchmark.APPL --cc FixedBenchmark.dsk

FixedBenchmark.flt: fixedbenchmark.o fixed.o
	$(CXX) $^ -o $@ -lRetroConsole $(LDFLAGS)

fixed.o: fixed.h
raytracer2.o: fixed.h
fixedbenchmark.o: fixed.h

