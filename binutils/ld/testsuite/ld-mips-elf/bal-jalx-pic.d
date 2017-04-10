#name: MIPS BAL/JALX in PIC mode
#source: ../../../gas/testsuite/gas/mips/branch-addend.s
#as: -EB -32
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000 -shared
#error: \A[^\n]*: In function `bar':\n
#error:   \(\.text\+0x1014\): Unsupported branch between ISA modes\Z
