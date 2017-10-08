#name: MIPS16 link branch to unaligned symbol (ignore branch ISA)
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000 --ignore-branch-isa
#source: ../../../gas/testsuite/gas/mips/unaligned-branch-mips16-2.s
#error:   [^\n]*: In function `foo':\n
#error:   \(\.text\+0x1008\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x100e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1014\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1020\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1026\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x102c\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x104a\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1056\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1068\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x106e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1074\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1080\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1086\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x108c\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10aa\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10b6\): Branch to a non-instruction-aligned address\Z
