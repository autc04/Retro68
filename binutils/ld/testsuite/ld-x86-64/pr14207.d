#name: PR ld/14207
#as: --64
#ld: -melf_x86_64 -shared -z relro -z now
#readelf: -l --wide
#target: x86_64-*-linux*

Elf file type is DYN \(Shared object file\)
Entry point 0x1d9
There are 4 program headers, starting at offset 64

Program Headers:
  Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
  LOAD           0x000000 0x0000000000000000 0x0000000000000000 0x0001e0 0x0001e0 R   0x200000
  LOAD           0x000b48 0x0000000000200b48 0x0000000000200b48 0x0004b0 0x000cf8 RW  0x200000
  DYNAMIC        0x000b90 0x0000000000200b90 0x0000000000200b90 0x0001c0 0x0001c0 RW  0x8
  GNU_RELRO      0x000b48 0x0000000000200b48 0x0000000000200b48 0x0004b8 0x0004b8 R   0x1

 Section to Segment mapping:
  Segment Sections...
   00     .hash .dynsym .dynstr 
   01     .init_array .fini_array .jcr .data.rel.ro .dynamic .got .bss 
   02     .dynamic 
   03     .init_array .fini_array .jcr .data.rel.ro .dynamic .got 
#pass
