#name: Unlabled landing pad PLT
#source: zicfilp-unlabeled-plt.s
#ld: -shared -melf64lriscv
#objdump: -dr -j .plt
#as: -march=rv64gc_zicfilp -mlittle-endian

[^:]*: *file format elf64-.*riscv

Disassembly of section \.plt:

[0-9a-f]+ <\.plt>:
.*:[ 	]+[0-9a-f]+[ 	]+lpad[ 	]+0x0
.*:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+t2,0x[0-9a-f]+
.*:[ 	]+[0-9a-f]+[ 	]+sub[ 	]+t1,t1,t3
.*:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t3,[0-9]+\(t2\) # [0-9a-f]+ <\.got\.plt>
.*:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t1,t1,-64
.*:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,t2,[0-9]+
.*:[ 	]+[0-9a-f]+[ 	]+srli[ 	]+t1,t1,0x1
.*:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t0,8\(t0\)
.*:[ 	]+[0-9a-f]+[ 	]+jr[ 	]+t3
.*:[ 	]+[0-9a-f]+[ 	]+nop
.*:[ 	]+[0-9a-f]+[ 	]+nop
.*:[ 	]+[0-9a-f]+[ 	]+nop

[0-9a-f]+ <foo@plt>:
.*:[ 	]+[0-9a-f]+[ 	]+lpad[ 	]+0x0
.*:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+t3,0x[0-9a-f]+
.*:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t3,[0-9]+\(t3\) # [0-9a-f]+ <foo>
.*:[ 	]+[0-9a-f]+[ 	]+jalr[ 	]+t1,t3

[0-9a-f]+ <bar@plt>:
.*:[ 	]+[0-9a-f]+[ 	]+lpad[ 	]+0x0
.*:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+t3,0x1
.*:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t3,[0-9]+\(t3\) # [0-9a-f]+ <bar>
.*:[ 	]+[0-9a-f]+[ 	]+jalr[ 	]+t1,t3
