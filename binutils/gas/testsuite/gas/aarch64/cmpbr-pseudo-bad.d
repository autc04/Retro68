#name: Test of out-of-range cmpbr operands
#source: cmpbr-pseudo-bad.s
#as: -march=armv8-a+cmpbr
#error_output: cmpbr-pseudo-bad.l
