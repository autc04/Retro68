#ld: -shared -Map tmpdir/ifunc-1-x86.map
#objdump: -dw
#target: x86_64-*-* i?86-*-*
#map: ifunc-1-x86.map

#...
[ \t0-9a-f]+:[ \t0-9a-f]+call[ \t0-9a-fq]+<\*ABS\*(\+0x170|\+0x190|\+0x210|)@plt>
#pass
