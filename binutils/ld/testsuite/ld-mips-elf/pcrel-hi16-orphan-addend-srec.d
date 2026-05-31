#name: MIPS orphan PCHI16 relocation addend srec
#source: ../../../gas/testsuite/gas/mips/pcrel-hi16-orphan-addend.s
#as: -mno-pdr -mips32r6 -no-warn
#ld: --oformat=srec -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 -T mips-hi16-orphan-addend.ld
#warning_output: pcrel-hi16-orphan-addend-srec.l
#objdump: -mmips:isa32r6 -j .sec1 -D --prefix-addresses --show-raw-insn
#dump: pcrel-hi16-orphan-addend.d
