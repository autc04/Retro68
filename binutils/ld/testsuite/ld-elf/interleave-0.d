#name: --interleave test byte 0
#source: interleave.s
#ld: -Tinterleave.ld
#objcopy: --interleave=8 --interleave-width=1 --byte=0 -O verilog

@0+0
00 
@0+2
14 
