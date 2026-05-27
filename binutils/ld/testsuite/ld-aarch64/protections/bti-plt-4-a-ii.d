#name: Specifying '-z force-bti -z bti-report=error' reports errors (exec)
#source: bti-plt-1.s
#target: [check_shared_lib_support]
#as: -mabi=lp64
#ld: -z force-bti -z bti-report=error -e _start -T bti-plt.ld -L./tmpdir -lbti-plt-so
#error: .*bti-plt-1\.o: error: BTI is required by -z force-bti.*
