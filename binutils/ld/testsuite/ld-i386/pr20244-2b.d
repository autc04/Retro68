#source: pr20244-2.s
#as: --32
#ld: -m elf_i386 -z noseparate-code
#objdump: -s -j .got.plt
#notarget: i?86-*-nacl* x86_64-*-nacl*

.*: +file format .*

Contents of section .got.plt:
 80490b0 00000000 00000000 00000000           ............    
