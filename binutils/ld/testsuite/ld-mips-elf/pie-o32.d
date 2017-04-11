#source: pie.s
#as: -mabi=32 -EB
#ld: -melf32btsmip -pie
#readelf: -d

Dynamic section at offset 0x178 contains 17 entries:
  Tag * Type * Name/Value
 0x00000004 \(HASH\) * 0x228
 0x00000005 \(STRTAB\) * 0x284
 0x00000006 \(SYMTAB\) * 0x244
 0x0000000a \(STRSZ\) * 28 \(bytes\)
 0x0000000b \(SYMENT\) * 16 \(bytes\)
 0x70000035 \(MIPS_RLD_MAP_REL\) * 0x10110
 0x00000015 \(DEBUG\) * 0x0
 0x00000003 \(PLTGOT\) * 0x102c0
 0x70000001 \(MIPS_RLD_VERSION\) * 1
 0x70000005 \(MIPS_FLAGS\) * NOTPOT
 0x70000006 \(MIPS_BASE_ADDRESS\) * 0x0
 0x7000000a \(MIPS_LOCAL_GOTNO\) * 2
 0x70000011 \(MIPS_SYMTABNO\) * 4
 0x70000012 \(MIPS_UNREFEXTNO\) * 13
 0x70000013 \(MIPS_GOTSYM\) * 0x4
 0x6ffffffb \(FLAGS_1\) * Flags: PIE
 0x00000000 \(NULL\) * 0x0
