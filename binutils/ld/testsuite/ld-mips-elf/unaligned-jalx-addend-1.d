#name: MIPS JALX to unaligned symbol with addend 1
#source: unaligned-jalx-addend-1.s
#source: unaligned-insn.s -mips16
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x[0-9a-f]+\): Cannot convert a jump to JALX for a non-word-aligned address\Z
