#source: dummy.s
#as: --64
#ld: -m elf_x86_64 -T pr21884-nacl.t -b binary
#objdump: -b binary -s
#target: x86_64-*-nacl*

.*:     file format binary

Contents of section .data:
#pass
