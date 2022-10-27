#source: property-x86-empty.s
#as: --32
#ld: -r -melf_i386 -z shstk
#readelf: -n

Displaying notes found in: .note.gnu.property
  Owner                 Data size	Description
  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: SHSTK
