#name: Test plbi instruction without +tlbid
#source: tlbid-3.s
#as: -march=armv9.4-a+poe2
#error_output: tlbid-invalid-4.l
