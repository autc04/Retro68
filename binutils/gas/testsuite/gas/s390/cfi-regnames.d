#name: s390/s390x register names in CFI directives
#objdump: -Wf

.*: +file format .*

Contents of the \.eh_frame section:

#...

# General register (GR) names r0..r15
0+1[48] 0+28 0+1[8c] FDE cie=0+ pc=0+\.\.0+4
  DW_CFA_advance_loc: 2 to 0+2
  DW_CFA_register: r0 in r1
  DW_CFA_register: r2 in r3
  DW_CFA_register: r4 in r5
  DW_CFA_register: r6 in r7
  DW_CFA_register: r8 in r9
  DW_CFA_register: r10 in r11
  DW_CFA_register: r12 in r13
  DW_CFA_register: r14 in r15
  DW_CFA_nop
  DW_CFA_nop

# Floating-point register (FPR) names f0..f15
0+4[04] 0+28 0+4[48] FDE cie=0+ pc=0+4\.\.0+8
  DW_CFA_advance_loc: 2 to 0+6
  DW_CFA_register: r16 \(f0\) in r20 \(f1\)
  DW_CFA_register: r17 \(f2\) in r21 \(f3\)
  DW_CFA_register: r18 \(f4\) in r22 \(f5\)
  DW_CFA_register: r19 \(f6\) in r23 \(f7\)
  DW_CFA_register: r24 \(f8\) in r28 \(f9\)
  DW_CFA_register: r25 \(f10\) in r29 \(f11\)
  DW_CFA_register: r26 \(f12\) in r30 \(f13\)
  DW_CFA_register: r27 \(f14\) in r31 \(f15\)
  DW_CFA_nop
  DW_CFA_nop

# Vector register (VR) names v0..v31
0+(6c|70) 0+40 0+7[04] FDE cie=0+ pc=0+8\.\.0+c
  DW_CFA_advance_loc: 2 to 0+a
  DW_CFA_register: r16 \(f0\) in r20 \(f1\)
  DW_CFA_register: r17 \(f2\) in r21 \(f3\)
  DW_CFA_register: r18 \(f4\) in r22 \(f5\)
  DW_CFA_register: r19 \(f6\) in r23 \(f7\)
  DW_CFA_register: r24 \(f8\) in r28 \(f9\)
  DW_CFA_register: r25 \(f10\) in r29 \(f11\)
  DW_CFA_register: r26 \(f12\) in r30 \(f13\)
  DW_CFA_register: r27 \(f14\) in r31 \(f15\)
  DW_CFA_register: r68 \(v16\) in r72 \(v17\)
  DW_CFA_register: r69 \(v18\) in r73 \(v19\)
  DW_CFA_register: r70 \(v20\) in r74 \(v21\)
  DW_CFA_register: r71 \(v22\) in r75 \(v23\)
  DW_CFA_register: r76 \(v24\) in r80 \(v25\)
  DW_CFA_register: r77 \(v26\) in r81 \(v27\)
  DW_CFA_register: r78 \(v28\) in r82 \(v29\)
  DW_CFA_register: r79 \(v30\) in r83 \(v31\)
  DW_CFA_nop
  DW_CFA_nop

# Access register (AR) names a0..a15
0+b[04] 0+28 0+b[48] FDE cie=0+ pc=0+c\.\.0+10
  DW_CFA_advance_loc: 2 to 0+e
  DW_CFA_register: r48 \(a0\) in r49 \(a1\)
  DW_CFA_register: r50 \(a2\) in r51 \(a3\)
  DW_CFA_register: r52 \(a4\) in r53 \(a5\)
  DW_CFA_register: r54 \(a6\) in r55 \(a7\)
  DW_CFA_register: r56 \(a8\) in r57 \(a9\)
  DW_CFA_register: r58 \(a10\) in r59 \(a11\)
  DW_CFA_register: r60 \(a12\) in r61 \(a13\)
  DW_CFA_register: r62 \(a14\) in r63 \(a15\)
  DW_CFA_nop
  DW_CFA_nop
