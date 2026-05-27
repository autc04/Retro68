#name: Specifying '-z force-bti -z bti-report=error' reports errors (shared)
#source: bti-plt-1.s
#source: bti-plt-2.s
#target: [check_shared_lib_support]
#as: -mabi=lp64
#ld: -shared -z force-bti -z bti-report=error -T bti-plt.ld
#error: .*bti-plt-2\.o: error: BTI is required by -z force-bti.*
#error: .*bti-plt-1\.o: error: BTI is required by -z force-bti.*
