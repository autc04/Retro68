#name: MIPSr6 link branch to unaligned symbol 2
#as: -EB -n32 -mips64r6
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#source: ../../../gas/testsuite/gas/mips/unaligned-branch-r6-4.s
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x101c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1024\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x102c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1034\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x103c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1044\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x104c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1054\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x105c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x107c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1084\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x108c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1094\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x109c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10a4\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10ac\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10b4\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10bc\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10f4\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10fc\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1104\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1124\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x112c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1134\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x113c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1144\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x114c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1154\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x115c\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1164\): Branch to a non-instruction-aligned address\Z
