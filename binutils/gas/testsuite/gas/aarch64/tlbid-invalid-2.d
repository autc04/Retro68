#name: Test without v8.4-a or above.
#source: tlbid-2.s
#as: -march=armv8-a+tlbid
#as: -march=armv8-a+d128
#error_output: tlbid-invalid-2.l
