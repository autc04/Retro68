#name: AVR no DIFF relocs without link relax
#as: -mmcu=avrxmega2
#objdump: -r
#source: relax.s
#target: avr-*-*

.*:     file format elf32-avr

RELOCATION RECORDS FOR \[.text\]:
OFFSET   TYPE              VALUE 
00000000 R_AVR_CALL        .text
