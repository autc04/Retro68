#name: R_MIPS_HI16 and R_MIPS_LO16 relocs srec (n64)
#source: ../../../gas/testsuite/gas/mips/mips-hilo-n64.s
#source: mips-hilo.s
#objdump: -m mips:4000 -j .sec1 -D
#ld: --oformat=srec -Tmips-hilo.ld -e 0x500000 -N
#dump: mips-hilo-n64.d
