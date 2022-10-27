#as: --auto-litpools
#objdump: -ds
#name: auto-litpools-first1 (check that literal pool is created when source starts with literal)

.*: +file format .*xtensa.*
#...
Contents of section .text:
 0000 ........ 20170331 .*
#...
00000000 <f>:
.*0:.*j.8 .*
#...
