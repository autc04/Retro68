# Makefile for standalone building of Raytracer example
# Double-check RETRO68 variable below and run 'make'.

# path to RETRO68
RETRO68=../../Retro68-build/toolchain

PREFIX=$(RETRO68)/m68k-unknown-elf
CC=$(RETRO68)/bin/m68k-unknown-elf-gcc
CXX=$(RETRO68)/bin/m68k-unknown-elf-g++
MAKEAPPL=$(RETRO68)/bin/MakeAPPL

CXXFLAGS=-std=c++11
LDFLAGS=-Wl,-gc-sections -lm

all: Raytracer.bin Raytracer2.bin FixedBenchmark.bin
.PHONY: all clean

clean:
	rm -f Raytracer.bin Raytracer.APPL Raytracer.dsk Raytracer.flt Raytracer.flt.gdb
	rm -f Raytracer2.bin Raytracer2.APPL Raytracer2.dsk Raytracer2.flt Raytracer2.flt.gdb
	rm -f FixedBenchmark.bin FixedBenchmark.APPL FixedBenchmark.dsk FixedBenchmark.flt FixedBenchmark.flt.gdb
	rm -f fixed.o raytracer.o raytracer2.o fixedbenchmark.o

Raytracer.bin Raytracer.APPL Raytracer.dsk: Raytracer.flt
	$(MAKEAPPL) -c Raytracer.flt -o Raytracer

Raytracer.flt: raytracer.o
	$(CC) $^ -o $@ $(LDFLAGS)
	
Raytracer2.bin Raytracer2.APPL Raytracer2.dsk: Raytracer2.flt
	$(MAKEAPPL) -c Raytracer2.flt -o Raytracer2

Raytracer2.flt: raytracer2.o fixed.o
	$(CXX) $^ -o $@ $(LDFLAGS)
	
FixedBenchmark.bin FixedBenchmark.APPL FixedBenchmark.dsk: FixedBenchmark.flt
	$(MAKEAPPL) -c FixedBenchmark.flt -o FixedBenchmark

FixedBenchmark.flt: fixedbenchmark.o fixed.o
	$(CXX) $^ -o $@ -lRetroConsole $(LDFLAGS)

fixed.o: fixed.h
raytracer2.o: fixed.h
fixedbenchmark.o: fixed.h

