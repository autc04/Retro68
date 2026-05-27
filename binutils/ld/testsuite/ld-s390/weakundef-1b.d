#source: weakundef-1.s
#as: -m64
#ld: -m elf64_s390 -dT 8GB.ld --emit-relocs --no-error-rwx-segments --no-relax
#objdump: -dzrj.text
#error: tmpdir/weakundef-1.o: in function `foo':\n
#error: \(\.text\+0xe\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x14\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x1a\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x20\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x26\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x2c\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x32\): relocation truncated to fit: R_390_PC32DBL against undefined symbol `wu'\n?
