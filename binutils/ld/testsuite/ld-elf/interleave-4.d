#name: --interleave test byte 4
#source: interleave.s
#ld: -Tinterleave.ld
#objcopy: --interleave=8 --interleave-width=1 --byte=4 -O verilog

@0+0
04 
@0+1
10 
