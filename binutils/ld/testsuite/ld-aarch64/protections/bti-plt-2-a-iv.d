#name: Specifying '-z force-bti -z bti-report=none' emits BTI feature and reports nothing (shared)
#source: bti-plt-1.s
#source: bti-plt-2.s
#target: [check_shared_lib_support]
#as: -mabi=lp64
#ld: -shared -z force-bti -z bti-report=none -T bti-plt.ld
#readelf: -n

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: BTI
