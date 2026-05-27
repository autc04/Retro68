#source: empty.s
#source: property-seal-1.s
#ld: -shared -z memory-seal
#readelf: -n
#notarget: ![check_shared_lib_support] ![check_memory_seal_support]
#xfail: am33_2.0-*-* mn10300-*-*
# mn10300 has relocations in .note.gnu.property section which
# elf_parse_notes doesn't support.

#...
Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
      Properties: memory seal 
#pass
