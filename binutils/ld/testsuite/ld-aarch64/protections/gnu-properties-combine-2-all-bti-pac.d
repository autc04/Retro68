#name: GNU Property: readelf (combine 2 object files: all + BTI + PAC)
#source: gnu-properties-all.s
#source: gnu-properties-selectable.s
#as: -mabi=lp64 -defsym __property_bti__=1 -defsym __property_pac__=1
#ld: -e _start
#readelf: -n
#target: *linux*

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: BTI, PAC
