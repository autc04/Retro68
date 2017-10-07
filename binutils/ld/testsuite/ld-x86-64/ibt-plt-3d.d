#source: ibt-plt-3.s
#as: --64 -defsym __64_bit__=1
#ld: -shared -m elf_x86_64 -z ibt
#readelf: -n

Displaying notes found in: .note.gnu.property
  Owner                 Data size	Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT

