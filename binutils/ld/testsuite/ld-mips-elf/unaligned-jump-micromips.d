#name: microMIPS link jump to unaligned symbol
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#source: ../../../gas/testsuite/gas/mips/unaligned-jump-micromips-2.s
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x1012\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1018\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x101e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1026\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x102e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x102e\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1034\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1034\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x103a\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1042\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x104a\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x104a\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1050\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1050\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1056\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x105e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1066\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1066\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x106c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x106c\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1082\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x1088\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x108e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1096\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x109e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x109e\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10a4\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10a4\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10aa\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10b2\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10ba\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10ba\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10c0\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10c0\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10c6\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10ce\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10d6\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10d6\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10dc\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10dc\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10f2\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10f8\): Unsupported jump between ISA modes; consider recompiling with interlinking enabled\n
#error:   \(\.text\+0x10fe\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x111a\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1136\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1152\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1152\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x115a\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1162\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x1168\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x116e\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x118a\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x118a\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1192\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x119a\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x11a0\): Jump to a non-instruction-aligned address\n
#error:   \(\.text\+0x11a6\): Unsupported JALX to the same ISA mode\Z
