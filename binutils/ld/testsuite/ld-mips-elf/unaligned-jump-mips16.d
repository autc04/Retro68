#name: MIPS16 link jump to unaligned symbol
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#source: ../../../gas/testsuite/gas/mips/unaligned-jump-mips16-2.s
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x100e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1014\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x101a\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1020\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1026\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x102c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x103e\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1044\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x104a\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1050\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1056\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x105c\): Cannot convert a jump to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x106e\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x107a\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x107a\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1080\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x1086\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1092\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x1092\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x1098\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x109e\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x109e\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x10a4\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x10aa\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x10aa\): Unsupported JALX to the same ISA mode\n
#error:   \(\.text\+0x10b0\): Jump to a non-word-aligned address\n
#error:   \(\.text\+0x10b6\): Unsupported JALX to the same ISA mode\Z
