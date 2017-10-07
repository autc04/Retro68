#name: microMIPS link branch to unaligned symbol
#as: -EB -n32 -march=from-abi
#ld: -EB -Ttext 0x1c000000 -e 0x1c000000
#source: ../../../gas/testsuite/gas/mips/unaligned-branch-micromips-2.s
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x100a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1012\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x101a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x102a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1032\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x103a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1062\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1072\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1082\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1088\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1088\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x108e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x108e\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1094\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1094\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x109a\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10a0\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10a0\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10a6\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10a6\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10ac\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10ac\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10b2\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10ca\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10d6\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x10e2\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10e8\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10e8\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10ee\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10ee\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10f4\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x10f4\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x10fa\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1100\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1100\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1106\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1106\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x110c\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x110c\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1112\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x112a\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1136\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1142\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1146\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1146\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x114a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x114a\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x114e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x114e\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1152\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1156\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1156\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x115a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x115a\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x115e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x115e\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1162\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1172\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x117a\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x1182\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1186\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1186\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x118a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x118a\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x118e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x118e\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1192\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x1196\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x1196\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x119a\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x119a\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x119e\): Cannot convert a branch to JALX for a non-word-aligned address\n
#error:   \(\.text\+0x119e\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x11a2\): Unsupported branch between ISA modes\n
#error:   \(\.text\+0x11b2\): Branch to a non-instruction-aligned address\n
#error:   \(\.text\+0x11ba\): Branch to a non-instruction-aligned address\Z
