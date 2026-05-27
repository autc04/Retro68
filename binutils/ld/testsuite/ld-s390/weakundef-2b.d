#source: weakundef-2.s
#as: -m64
#ld: -m elf64_s390 -dT 8GB.ld --no-pie --emit-relocs --no-error-rwx-segments --no-relax
#objdump: -dzrj.text
#error: tmpdir/weakundef-2.o: in function `foo':\n
#error: \(\.text\+0xe\): relocation truncated to fit: R_390_PLT32DBL against undefined symbol `wu'\n?
#error: \(\.text\+0x20\): relocation truncated to fit: R_390_PLT32DBL against undefined symbol `wu'\n?
