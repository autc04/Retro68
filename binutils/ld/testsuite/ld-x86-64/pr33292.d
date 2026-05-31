#as: --64 -defsym __64_bit__=1 -mx86-used-note=yes
#ld: -shared -m elf_x86_64 -z noindirect-extern-access
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature used: x86
	x86 ISA used: x86-64-baseline
