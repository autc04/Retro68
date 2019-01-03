#ld: -shared --hash-style=sysv
#objdump: -dw
#target: aarch64*-*-*

#...
0+(110|180) <__GI_foo>:
#...
[ \t0-9a-f]+:[ \t0-9a-f]+bl[ \t0-9a-f]+<\*ABS\*\+0x(110|180)@plt>
[ \t0-9a-f]+:[ \t0-9a-f]+adrp[ \t]+x0, 0 <.*>
[ \t0-9a-f]+:[ \t0-9a-f]+add[ \t]+x0, x0, #0x(100|170)
#pass
