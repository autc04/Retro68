#objdump: -dw
#name: {,F}CMOVcc alternative forms

.*: +file format .*

Disassembly of section .text:

0+ <cmov>:
[ 	]*[a-f0-9]+:	0f 47 c8             	cmova  %eax,%ecx
[ 	]*[a-f0-9]+:	0f 47 c8             	cmova  %eax,%ecx
[ 	]*[a-f0-9]+:	0f 47 c8             	cmova  %eax,%ecx
[ 	]*[a-f0-9]+:	0f 47 c8             	cmova  %eax,%ecx
[ 	]*[a-f0-9]+:	66 0f 4a c8          	cmovp  %ax,%cx
[ 	]*[a-f0-9]+:	66 0f 4a c8          	cmovp  %ax,%cx
[ 	]*[a-f0-9]+:	66 0f 4a c8          	cmovp  %ax,%cx
[ 	]*[a-f0-9]+:	66 0f 4a c8          	cmovp  %ax,%cx
[ 	]*[a-f0-9]+:	0f 4c 08             	cmovl  \(%rax\),%ecx
[ 	]*[a-f0-9]+:	0f 4c 08             	cmovl  \(%rax\),%ecx
[ 	]*[a-f0-9]+:	0f 4c 08             	cmovl  \(%rax\),%ecx
[ 	]*[a-f0-9]+:	0f 4c 08             	cmovl  \(%rax\),%ecx
[ 	]*[a-f0-9]+:	48 0f 44 08          	cmove  \(%rax\),%rcx
[ 	]*[a-f0-9]+:	48 0f 44 08          	cmove  \(%rax\),%rcx
[ 	]*[a-f0-9]+:	48 0f 44 08          	cmove  \(%rax\),%rcx
[ 	]*[a-f0-9]+:	48 0f 44 08          	cmove  \(%rax\),%rcx
[ 	]*[a-f0-9]+:	0f 48 c8             	cmovs  %eax,%ecx
[ 	]*[a-f0-9]+:	66 0f 48 c8          	cmovs  %ax,%cx
[ 	]*[a-f0-9]+:	0f 48 c8             	cmovs  %eax,%ecx
[ 	]*[a-f0-9]+:	48 0f 48 c8          	cmovs  %rax,%rcx
[ 	]*[a-f0-9]+:	da d9                	fcmovu %st\(1\),%st
[ 	]*[a-f0-9]+:	da d9                	fcmovu %st\(1\),%st
#pass
