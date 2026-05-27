#as -mabi=ilp32d:
#ld: -z norelro --hash-style=both -e0
#objdump: -dr
#skip: loongarch*-elf

.*:[    ]+file format .*


Disassembly of section .text:

.*
.*bl.*
.*pcaddu12i.*
.*addi.w.*
.*li.w.*
.*li.w.*
