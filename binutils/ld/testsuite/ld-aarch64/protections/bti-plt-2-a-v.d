#name: Specifying '-z force-bti -z bti-report' emits BTI feature and reports warnings (shared)
#source: bti-plt-1.s
#source: bti-plt-2.s
#target: [check_shared_lib_support]
#as: -mabi=lp64
#ld: -shared -z force-bti -z bti-report -T bti-plt.ld
#warning: .*bti-plt-2\.o: warning: BTI is required by -z force-bti.*
#warning: .*bti-plt-1\.o: warning: BTI is required by -z force-bti.*
#readelf: -n

# Should warn about the missing input BTI NOTE but should still mark
# output as BTI.

Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: BTI
