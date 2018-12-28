#objdump: -dw
#name: x86-64 NOTRACK prefix

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
[ 	]*[a-f0-9]+:	3e ff d0             	notrack callq \*%rax
[ 	]*[a-f0-9]+:	3e 41 ff d0          	notrack callq \*%r8
[ 	]*[a-f0-9]+:	3e ff e0             	notrack jmpq \*%rax
[ 	]*[a-f0-9]+:	3e 41 ff e0          	notrack jmpq \*%r8
[ 	]*[a-f0-9]+:	3e ff 10             	notrack callq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e 41 ff 10          	notrack callq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e ff 20             	notrack jmpq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e 41 ff 20          	notrack jmpq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e 67 ff 10          	notrack callq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 41 ff 10       	notrack callq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e 67 ff 20          	notrack jmpq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 41 ff 20       	notrack jmpq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e f2 ff d0          	notrack bnd callq \*%rax
[ 	]*[a-f0-9]+:	3e f2 41 ff d0       	notrack bnd callq \*%r8
[ 	]*[a-f0-9]+:	3e f2 ff e0          	notrack bnd jmpq \*%rax
[ 	]*[a-f0-9]+:	3e f2 41 ff e0       	notrack bnd jmpq \*%r8
[ 	]*[a-f0-9]+:	3e f2 ff 10          	notrack bnd callq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e f2 41 ff 10       	notrack bnd callq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e f2 ff 20          	notrack bnd jmpq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e f2 41 ff 20       	notrack bnd jmpq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e 67 f2 ff 10       	notrack bnd callq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 f2 41 ff 10    	notrack bnd callq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e 67 f2 ff 20       	notrack bnd jmpq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 f2 41 ff 20    	notrack bnd jmpq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e f2 ff d0          	notrack bnd callq \*%rax
[ 	]*[a-f0-9]+:	3e f2 41 ff d0       	notrack bnd callq \*%r8
[ 	]*[a-f0-9]+:	3e f2 ff 10          	notrack bnd callq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e f2 41 ff 10       	notrack bnd callq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e 67 f2 ff 10       	notrack bnd callq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 f2 41 ff 10    	notrack bnd callq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e ff d0             	notrack callq \*%rax
[ 	]*[a-f0-9]+:	3e 41 ff d0          	notrack callq \*%r8
[ 	]*[a-f0-9]+:	3e ff e0             	notrack jmpq \*%rax
[ 	]*[a-f0-9]+:	3e 41 ff e0          	notrack jmpq \*%r8
[ 	]*[a-f0-9]+:	3e ff 10             	notrack callq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e 41 ff 10          	notrack callq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e ff 20             	notrack jmpq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e 41 ff 20          	notrack jmpq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e 67 ff 10          	notrack callq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 41 ff 10       	notrack callq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e 67 ff 20          	notrack jmpq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 41 ff 20       	notrack jmpq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e f2 ff d0          	notrack bnd callq \*%rax
[ 	]*[a-f0-9]+:	3e f2 41 ff d0       	notrack bnd callq \*%r8
[ 	]*[a-f0-9]+:	3e f2 ff e0          	notrack bnd jmpq \*%rax
[ 	]*[a-f0-9]+:	3e f2 41 ff e0       	notrack bnd jmpq \*%r8
[ 	]*[a-f0-9]+:	3e f2 ff 10          	notrack bnd callq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e f2 41 ff 10       	notrack bnd callq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e f2 ff 20          	notrack bnd jmpq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e f2 41 ff 20       	notrack bnd jmpq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e 67 f2 ff 10       	notrack bnd callq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 f2 41 ff 10    	notrack bnd callq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e 67 f2 ff 20       	notrack bnd jmpq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 f2 41 ff 20    	notrack bnd jmpq \*\(%r8d\)
[ 	]*[a-f0-9]+:	3e f2 ff d0          	notrack bnd callq \*%rax
[ 	]*[a-f0-9]+:	3e f2 41 ff d0       	notrack bnd callq \*%r8
[ 	]*[a-f0-9]+:	3e f2 ff 10          	notrack bnd callq \*\(%rax\)
[ 	]*[a-f0-9]+:	3e f2 41 ff 10       	notrack bnd callq \*\(%r8\)
[ 	]*[a-f0-9]+:	3e 67 f2 ff 10       	notrack bnd callq \*\(%eax\)
[ 	]*[a-f0-9]+:	3e 67 f2 41 ff 10    	notrack bnd callq \*\(%r8d\)
[ 	]*[a-f0-9]+:	f2 3e ff d0          	bnd notrack callq \*%rax
[ 	]*[a-f0-9]+:	3e 66 ff d0          	ds callw \*%ax
[ 	]*[a-f0-9]+:	66 3e ff d0          	ds callw \*%ax
#pass
