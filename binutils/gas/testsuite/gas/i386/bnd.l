.*: Assembler messages:
.*:5: Error: .*`bndmov'.*
GAS LISTING .*


[ 	]*1[ 	]+\.text
[ 	]*2[ 	]+\.intel_syntax noprefix
[ 	]*3[ 	]+bnd:
[ 	]*4[ 	]+\?\?\?\? A1000000[ 	]+mov	eax, bnd0
[ 	]*4[ 	]+00
[ 	]*5[ 	]+bndmov	bnd0, bnd0
#pass
