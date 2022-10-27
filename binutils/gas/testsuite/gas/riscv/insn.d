#as: -march=rv32ic
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+0:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+4:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[ 	]+8:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[ 	]+c:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[ 	]+10:[ 	]+feb508e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[	]+10: R_RISCV_BRANCH[	]+target
[ 	]+14:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[ 	]+18:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[ 	]+1c:[ 	]+fe5ff56f[ 	]+jal[ 	]+a0,0 \<target\>
[	]+1c: R_RISCV_JAL[	]+target
[ 	]+20:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4
[ 	]+22:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[ 	]+24:[ 	]+002c[ 	]+addi[ 	]+a1,sp,8
[ 	]+26:[ 	]+dde9[ 	]+beqz[ 	]+a1,0 \<target\>
[	]+26: R_RISCV_RVC_BRANCH[	]+target
[ 	]+28:[ 	]+bfe1[ 	]+j[ 	]+0 \<target\>
[	]+28: R_RISCV_RVC_JUMP[	]+target
[ 	]+2a:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+2e:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[ 	]+32:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[ 	]+36:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[ 	]+3a:[ 	]+fcb503e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[	]+3a: R_RISCV_BRANCH[	]+target
[ 	]+3e:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[ 	]+42:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[ 	]+46:[ 	]+fbbff56f[ 	]+jal[ 	]+a0,0 \<target\>
[	]+46: R_RISCV_JAL[	]+target
[ 	]+4a:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4
[ 	]+4c:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[ 	]+4e:[ 	]+002c[ 	]+addi[ 	]+a1,sp,8
[ 	]+50:[ 	]+d9c5[ 	]+beqz[ 	]+a1,0 \<target\>
[	]+50: R_RISCV_RVC_BRANCH[	]+target
[ 	]+52:[ 	]+b77d[ 	]+j[ 	]+0 \<target\>
[	]+52: R_RISCV_RVC_JUMP[	]+target
[ 	]+54:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+58:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+5c:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+60:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+64:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+68:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+6c:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+70:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
