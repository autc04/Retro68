#as: --auto-litpools
#objdump: -ds
#name: auto-litpools-first2 (check that literal pool with jump around is created for generated literal)

.*: +file format .*xtensa.*
#...
Contents of section .text:
 0000 ........ ........ 20170331 .*
#...
00000000 <f>:
   0:.*addi.*a1.*
   3:.*j.*c.*
#...
   c:.*l32r.*a2, 8.*
#...
