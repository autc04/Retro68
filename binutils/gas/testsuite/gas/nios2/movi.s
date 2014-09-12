# Source file used to test silent conversion of
# movi to orhi etc

foo:
# this doesn't get converted
movi r2, 0x20	

# this does
movi r2, 0x20000000

# addi should convert only if the source register is r0
addi r2, r0, 0xffff0000
# but we can't test for non-conversion because the value would
# be out of range

# logical ops should convert for any register
ori r2, r5, 0xffff0000
xori r2, r10, 0xffff0000
andi r2, r15, 0xffff0000

	
