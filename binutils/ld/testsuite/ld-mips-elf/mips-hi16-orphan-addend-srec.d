#name: MIPS orphan HI16 relocation addends srec
#source: mips-hi16-orphan-addend.s
#as: -mno-pdr -mips1 -no-warn
#ld: --oformat=srec -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 --defsym=var3=0x56789abc -T mips-hi16-orphan-addend.ld
#warning_output: mips-hi16-orphan-addend-srec.l
#objdump: -mmips:3000 -j .sec1 -D --prefix-addresses --show-raw-insn
#dump: mips-hi16-orphan-addend.d
