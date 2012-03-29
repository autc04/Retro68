PREFIX=/media/LinuxHD/wolfgang/Projects/Retro68-build/toolchain
CC=${PREFIX}/bin/m68k-unknown-elf-gcc
LD=${PREFIX}/bin/m68k-unknown-elf-ld
AR=${PREFIX}/bin/m68k-unknown-elf-ar

CFLAGS=-O
OBJS=glue.o malloc.o syscalls.o start.o

all: retrocrt.o libretro.a

libretro.a: ${OBJS}
	${AR} cqs $@ ${OBJS}

retrocrt.o: ${OBJS}
	${LD} -r -o $@ ${OBJS}

.PHONY: install
install: retrocrt.o 
	cp $< ${PREFIX}/m68k-unknown-elf/lib/
