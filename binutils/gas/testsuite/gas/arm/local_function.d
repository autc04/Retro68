#objdump: -r
#name: Relocations against local function symbols
# This test is only valid on ELF based ports.
#not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd *-*-riscix* *-*-vxworks

.*:     file format.*

RELOCATION RECORDS FOR \[.text\]:
OFFSET   TYPE              VALUE 
00000000 R_ARM_(CALL|PC24)        bar
