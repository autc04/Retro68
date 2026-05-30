#name: R_MIPS16_HI16 and R_MIPS16_LO16 relocs srec
#source: ../../../gas/testsuite/gas/mips/mips16-hilo.s
#source: mips-hilo.s
#as: -march=mips3
#objdump: -mmips:16 -j .sec1 -D
#ld: --oformat=srec -Tmips-hilo.ld -e 0x500000 -N
#dump: mips16-hilo.d
