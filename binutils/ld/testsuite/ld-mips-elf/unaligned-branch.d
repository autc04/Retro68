#name: MIPS branch to unaligned symbol
#source: unaligned-branch.s
#source: unaligned-text.s
#as: -EB -32 -mips32r6
#ld: -EB -Ttext 0x10000000 -e 0x10000000
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x14\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x24\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x28\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x30\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x38\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x3c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x44\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x4c\): Branch to a non-instruction-aligned address\Z
