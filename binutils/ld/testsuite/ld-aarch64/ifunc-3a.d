#source: ifunc-3.s
#ld: -shared --hash-style=sysv
#objdump: -dw
#target: aarch64*-*-*

#...
0+(150|1d0) <__GI_foo>:
#...
[ \t0-9a-f]+:[ \t0-9a-f]+bl[ \t0-9a-f]+<\*ABS\*\+0x(150|1d0)@plt>
#pass
