#name: pr19977 microMIPS -r
#source: pr19977-r.s
#source: ../../../gas/testsuite/gas/mips/pr19977.s
#as: -mmicromips -march=mips64r2
#objdump: -dr
#ld: -r
#notarget: mips*el-ps2-elf*
#dump: pr19977-r.d
