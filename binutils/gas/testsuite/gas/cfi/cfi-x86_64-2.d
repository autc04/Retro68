#objdump: -WF
#name: CFI on x86-64 DW_CFA_def_cfa_offset_sf
#...
Contents of the .eh_frame section:


0+0000 0+0014 0+000 CIE "zR" cf=1 df=-8 ra=(16|32)
 +LOC +CFA +ra +
0+0000 rsp\+8 +c-8 +

0+0018 0+0014 0+001c FDE cie=0+0000 pc=0+0000..0+0004
 +LOC +CFA +ra +
0+0000 rsp\+8 +c-8 +
0+0004 rsp-32 +c-8 +
