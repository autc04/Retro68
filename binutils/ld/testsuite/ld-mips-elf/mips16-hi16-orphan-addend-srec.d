#name: MIPS16 orphan HI16 relocation addends srec
#source: mips-hi16-orphan-addend.s
#as: -mno-pdr -mips1 -mips16 -no-warn
#ld: --oformat=srec -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 --defsym=var3=0x56789abc -T mips-hi16-orphan-addend.ld
#warning_output: mips16-hi16-orphan-addend-srec.l
#objdump: -mmips:16 -j .sec1 -D --prefix-addresses --show-raw-insn
#dump: mips16-hi16-orphan-addend.d
