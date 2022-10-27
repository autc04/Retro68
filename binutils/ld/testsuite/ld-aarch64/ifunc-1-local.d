#ld: -shared --hash-style=sysv
#objdump: -dw
#target: aarch64*-*-*

#...
0+(110|180) <__GI_foo>:
#...
[ \t0-9a-f]+:[ \t0-9a-f]+bl[ \t0-9a-f]+<\*ABS\*\+(0x110|0x180)@plt>
#pass
