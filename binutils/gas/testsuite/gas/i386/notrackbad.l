.*: Assembler messages:
.*:6: Error: expecting indirect branch instruction after `notrack'
.*:6: Warning: skipping prefixes on this instruction
.*:7: Error: expecting indirect branch instruction after `notrack'
.*:7: Warning: skipping prefixes on this instruction
.*:9: Error: same type of prefix used twice
.*:10: Error: expecting no other prefixes after `notrack'
.*:11: Error: expecting no other prefixes after `notrack'
.*:12: Error: expecting no other prefixes after `notrack'
.*:15: Error: same type of prefix used twice
.*:16: Error: expecting no other prefixes after `notrack'
.*:17: Error: expecting no other prefixes after `notrack'
.*:18: Error: expecting no other prefixes after `notrack'
GAS LISTING .*


[ 	]*1[ 	]+\# Check 32bit unsupported NOTRACK prefix
[ 	]*2[ 	]+
[ 	]*3[ 	]+\.allow_index_reg
[ 	]*4[ 	]+\.text
[ 	]*5[ 	]+_start:
[ 	]*6[ 	]+\?\?\?\? [0-9A-F]* 		notrack call foo
\*\*\*\*  Error: expecting indirect branch instruction after `notrack'
\*\*\*\*  Warning: skipping prefixes on this instruction
[ 	]*6[ 	]+[0-9A-F]*
[ 	]*7[ 	]+\?\?\?\? [0-9A-F]* 		notrack jmp foo
\*\*\*\*  Error: expecting indirect branch instruction after `notrack'
\*\*\*\*  Warning: skipping prefixes on this instruction
[ 	]*7[ 	]+[0-9A-F]*
[ 	]*8[ 	]+
[ 	]*9[ 	]+fs notrack call \*%eax
[ 	]*10[ 	]+notrack fs call \*%eax
[ 	]*11[ 	]+notrack bnd call \*%eax
[ 	]*12[ 	]+notrack data16 call \*%eax
[ 	]*13[ 	]+
[ 	]*14[ 	]+\.intel_syntax noprefix
[ 	]*15[ 	]+fs notrack call eax
[ 	]*16[ 	]+notrack fs call eax
[ 	]*17[ 	]+notrack bnd call eax
[ 	]*18[ 	]+[\? 0-9A-F]*[ 	]+notrack data16 call eax
#pass
