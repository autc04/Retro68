#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS16 link branch to absolute expression 1 (n64)
#source: ../../../gas/testsuite/gas/mips/mips16-branch-absolute-1.s
#as: -EB -64 -march=from-abi
#ld: -EB -Ttext 0 -e foo
#dump: mips16-branch-absolute.d
