.*: Assembler messages:
.*:2: Error: invalid instruction suffix for `call'
.*:3: Error: invalid instruction suffix for `call'
.*:4: Error: operand type mismatch for `jmp'
.*:5: Error: invalid instruction suffix for `jmp'
.*:6: Error: invalid instruction suffix for `jmp'
.*:9: Error: operand type mismatch for `call'
.*:10: Error: invalid instruction suffix for `call'
.*:11: Error: invalid instruction suffix for `call'
.*:12: Error: invalid instruction suffix for `call'
.*:13: Error: operand type mismatch for `jmp'
.*:14: Error: invalid instruction suffix for `jmp'
.*:15: Error: invalid instruction suffix for `jmp'
.*:16: Error: invalid instruction suffix for `jmp'
GAS LISTING .*
#...
[ 	]*1[ 	]+\.text
[ 	]*2[ 	]+callw	\*%ax
[ 	]*3[ 	]+callw	\*\(%rax\)
[ 	]*4[ 	]+jmp	\*%ax
[ 	]*5[ 	]+jmpw	\*%ax
[ 	]*6[ 	]+jmpw	\*\(%rax\)
[ 	]*7[ 	]+
[ 	]*8[ 	]+\.intel_syntax noprefix
[ 	]*9[ 	]+call	ax
[ 	]*10[ 	]+callw	ax
[ 	]*11[ 	]+callw	\[rax\]
[ 	]*12[ 	]+call	WORD PTR \[rax\]
[ 	]*13[ 	]+jmp	ax
[ 	]*14[ 	]+jmpw	ax
[ 	]*15[ 	]+jmpw	\[rax\]
[ 	]*16[ 	]+jmp	WORD PTR \[rax\]
#pass
