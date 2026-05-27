.section .text.foo,"ax"
.globl _foo
.type _foo, @function
_foo:
  movl __start_data@GOTPCREL(%rip), %eax
  addq foo_1@GOTPCREL(%rip), %rax
  addq foo@GOTPCREL(%rip), %rax

.section .text,"ax"
.globl _start
.type _start, @function
_start:
  movl __stop_data@GOTPCREL(%rip), %eax
  movq __stop_data@GOTPCREL(%rip), %rax
  movq __stop_data@GOTPCREL(%rip), %rax
  movl __stop_data@GOTPCREL(%rip), %eax

.section foo,"aw",@progbits
.space 1
foo_1:
.space 1

.section data,"aw",@progbits
.space 13
