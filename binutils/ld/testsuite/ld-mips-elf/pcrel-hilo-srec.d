#name: MIPSr6 PCHI16/PCLO16 relocations srec
#as: -mno-pdr
#ld: -e 0 --defsym=baz=0xfedcba98 -T pcrel-hilo.ld --oformat=srec
#objdump: -m mips:isa64r6 -D -j .sec1
#source: ../../../gas/testsuite/gas/mips/pcrel-hilo.s
#dump: pcrel-hilo.d
