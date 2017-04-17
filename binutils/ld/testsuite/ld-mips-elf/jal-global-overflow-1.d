#name: MIPS JAL to global symbol overflow 1
#source: jal-global-overflow.s
#as: -EB -32
#ld: -EB -Ttext 0x1fffd000 -e 0x1fffd000
#error: \A[^\n]*: In function `foo':\n
#error:   \(\.text\+0x2000\): relocation truncated to fit: R_MIPS_26 against `abar'\n
#error:   [^\n]*: In function `bar':\n
#error:   \(\.text\+0x4000\): relocation truncated to fit: R_MIPS_26 against `afoo'\Z
