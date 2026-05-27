# Disassembly to "ud ui5" or "amswap.w rd, r1, rj" ,rd==rj
ud:
ud  0
ud  1
amswap.w  $r2,$r1,$r2
amswap.w  $r3,$r1,$r3

# No disassembly to ud
amswap_w:
amswap.w  $r4, $r0, $r4
amswap.w  $r5, $r2, $r5

amswap.w  $r6, $r1, $r7
amswap.w  $r8, $r1, $r9
