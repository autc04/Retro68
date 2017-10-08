#name: MIPS link jump to unaligned symbol
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#source: ../../../gas/testsuite/gas/mips/unaligned-jump-2.s
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x1004\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x101c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x101c\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1024\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x102c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1034\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1034\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x103c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1044\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x104c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x104c\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1054\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x105c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1064\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x107c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x107c\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1084\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x108c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1094\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1094\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x109c\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x10a4\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x10ac\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x10ac\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x10b4\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x10bc\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x10c4\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x10ec\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10f4\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10fc\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1104\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1104\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x111c\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1124\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x112c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1134\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1134\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x113c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1144\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x114c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x114c\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1154\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x115c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1164\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1164\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x117c\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\Z
