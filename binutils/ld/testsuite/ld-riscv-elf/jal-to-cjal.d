#name: jal to c.jal second-pass relaxation
#source: jal-to-cjal.s
#as: -march=rv32ic
#ld: -melf32lriscv --relax
#objdump: -d -M no-aliases

# This test verifies that the linker performs second-pass relaxation
# to convert jal to c.jal when distance shrinks due to other relaxations.
#
# Expected: All calls including critical should become c.jal (2 bytes)
# Current trunk behavior: All calls remain as jal (4 bytes)
#
# c.jal opcode: 2 bytes (4 hex digits)
# jal opcode: 4 bytes (8 hex digits)

.*:[ 	]+file format .*

Disassembly of section \.text:

.* <_start>:
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f1>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f2>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f3>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f4>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f5>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f6>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f7>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f8>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f9>
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <f10>

.* <critical>:
.*:[ 	]+[0-9a-f]{4}[ 	]+c\.jal[ 	]+.* <target>
#...
