#source: dummy.s
#as: --32
#ld: -m elf_i386 -T pr21884-nacl.t -b binary
#objdump: -b binary -s
#target: i?86-*-nacl* x86_64-*-nacl*

.*:     file format binary

Contents of section .data:
#pass
