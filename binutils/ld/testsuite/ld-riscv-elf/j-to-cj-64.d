#name: j to c.j second-pass relaxation (RV64)
#source: j-to-cj.s
#as: -march=rv64ic
#ld: -melf64lriscv --relax
#objdump: -d -M no-aliases

# This test verifies that the linker performs second-pass relaxation
# to convert j (jal x0) to c.j when distance shrinks due to other relaxations.
#
# Expected: All tails including critical should become c.j (2 bytes)
# c.j is available on both RV32 and RV64.
#
# c.j opcode: 2 bytes (4 hex digits)
# j opcode: 4 bytes (8 hex digits)

.*:[ 	]+file format .*

Disassembly of section \.text:

.* <_start>:
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f1>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f2>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f3>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f4>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f5>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f6>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f7>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f8>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f9>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <f10>

.* <critical>:
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.j[ 	]+.* <target>
#...
