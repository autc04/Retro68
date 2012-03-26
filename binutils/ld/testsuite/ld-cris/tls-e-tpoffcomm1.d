#source: start1.s
#source: tls-e-tpoffcomm1.s
#as: --no-underscore --em=criself -I$srcdir/$subdir
#ld: -m crislinux
#objdump: -d -s -h -t -r -p

# Make sure we can link a file with TPOFF relocs against common
# symbols.

.*:     file format elf32-cris

Program Header:
    LOAD off    0x0+ vaddr 0x0+80000 paddr 0x0+80000 align 2\*\*13
         filesz 0x0+a4 memsz 0x0+a4 flags r-x
    LOAD off    0x0+a4 vaddr 0x0+820a4 paddr 0x0+820a4 align 2\*\*13
         filesz 0x0+ memsz 0x0+ flags rw-
     TLS off    0x0+a4 vaddr 0x0+820a4 paddr 0x0+820a4 align 2\*\*2
         filesz 0x0+ memsz 0x0+8 flags r--
private flags = 0:

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         0+10  0+80094  0+80094  0+94  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .tbss         0+8  0+820a4  0+820a4  0+a4  2\*\*2
                  ALLOC, THREAD_LOCAL
SYMBOL TABLE:
0+80094 l    d  .text	0+ .text
0+820a4 l    d  .tbss	0+ .tbss
0+80098 l     F .text	0+c do_test
0+80094 g       .text	0+ _start
0+820a4 g       \*ABS\*	0+ __bss_start
0+ g       .tbss	0+4 foo
0+820a4 g       \*ABS\*	0+ _edata
0+820c0 g       \*ABS\*	0+ _end
0+4 g       .tbss	0+4 bar
#...
Disassembly of section .text:

00080094 <_start>:
   80094:	41b2                	moveq 1,\$r11
#...
00080098 <do_test>:
   80098:	2f0e f8ff ffff      	add.d 0xfffffff8,\$r0
   8009e:	2f1e fcff ffff      	add.d 0xfffffffc,\$r1
