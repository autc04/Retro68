
.*:     file format elf32-littleriscv


Disassembly of section \.text:

90000000 <_start>:
90000000:	70000797          	auipc	a5,0x70000
90000004:	00078793          	mv	a5,a5
90000008:	02078263          	beqz	a5,9000002c <_start\+0x2c>
9000000c:	ff010113          	addi	sp,sp,-16
90000010:	00112623          	sw	ra,12\(sp\)
90000014:	00000097          	auipc	ra,0x0
90000018:	000000e7          	jalr	zero # 0 <_start\-0x90000000>
9000001c:	00c12083          	lw	ra,12\(sp\)
90000020:	01010113          	addi	sp,sp,16
90000024:	00000317          	auipc	t1,0x0
90000028:	00000067          	jr	zero # 0 <_start\-0x90000000>
9000002c:	00008067          	ret
