 .ifdef HPUX
i .comm 4
 .else
  .comm i,4,4
 .endif

 .section .rodata,"a",%progbits
 .dc.a i

 .globl main
 .globl start
 .globl _start
 .globl __start
 .text
main:
start:
_start:
__start:
 .dc.a 0
