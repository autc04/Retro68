#as: --64
#ld: --oformat elf32-i386 -m elf_x86_64
#objdump: -s -j .rodata

#...
Contents of section \.rodata:
 [0-9a-f]+ 02030041 42434400 +...ABCD. +
#pass
