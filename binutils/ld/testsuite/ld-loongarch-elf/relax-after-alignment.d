#name: additional relaxation chances after alignment processing
#as:
#ld: --defsym _start=0
#objdump: -d --no-show-raw-insn
#xfail: *-*-*

.*:\s+file format .*


Disassembly of section \.text:

0000000120000400 <before>:
\s*120000400:\s+pcalau12i\s+\$t0, 512
\s*[0-9a-f]+:\s+addi\.d\s+\$t0, \$t0, 1024
\s*[0-9a-f]+:\s+pcaddi\s+\$t0, 524286
\s*[0-9a-f]+:\s+nop\s*
\s*\.\.\.
\s*120000c00:\s+pcaddi\s+\$t0, 523776
\s*\.\.\.

0000000120200400 <target>:
\s*120200400:\s+break\s+0x0

0000000120200404 <after>:
\s*\.\.\.
\s*1203ffbfc:\s+pcaddi\s+\$t0, -523775
\s*\.\.\.
\s*120400400:\s+pcaddi\s+\$t0, -524288
\s*[0-9a-f]+:\s+nop\s*
\s*[0-9a-f]+:\s+pcalau12i\s+\$t0, -512
\s*[0-9a-f]+:\s+addi\.d\s+\$t0, \$t0, 1024
