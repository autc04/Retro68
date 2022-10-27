#source: property-x86-empty.s
#as: --x32
#ld: -r -m elf32_x86_64 -z shstk
#readelf: -n

Displaying notes found in: .note.gnu.property
  Owner                 Data size	Description
  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: SHSTK
