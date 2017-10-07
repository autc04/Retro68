#name: MIPS JALX to unaligned symbol with addend 3
#source: unaligned-jalx-addend-3.s
#source: unaligned-insn.s -mips16
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x0\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x8\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x18\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x20\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x28\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x30\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x38\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x40\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x48\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x50\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x58\): Cannot convert a branch to JALX for a non-word-aligned address\Z
