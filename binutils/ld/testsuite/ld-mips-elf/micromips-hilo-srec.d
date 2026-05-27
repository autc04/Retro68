#name: R_MICROMIPS_HI16 and R_MICROMIPS_LO16 relocs srec
#source: ../../../gas/testsuite/gas/mips/mips-hilo.s
#source: mips-hilo.s
#as: -mmicromips -march=mips64r2
#objdump: -m mips:micromips -j .sec1 -D
#ld: --oformat=srec -Tmips-hilo.ld -e 0x500000 -N
#notarget: mips*el-ps2-elf*
#dump: micromips-hilo.d
