#as: --64 -defsym __64_bit__=1
#ld: -shared -m elf_x86_64
#readelf: -n

Displaying notes found in: .note.gnu.property
  Owner                 Data size	Description
  GNU                  0x00000020	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
	x86 ISA needed: i486, 586, SSE2, SSE3
