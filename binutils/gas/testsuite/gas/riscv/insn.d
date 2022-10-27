#as: -march=rv32ifc
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[^:]+:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[^:]+:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+feb508e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+feb506e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[^:]+:[ 	]+fe1ff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+fddff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[^:]+:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4 # .*
[^:]+:[ 	]+002c[ 	]+addi[ 	]+a1,sp,8
[^:]+:[ 	]+c0aa[ 	]+sw[ 	]+a0,64\(sp\)
[^:]+:[ 	]+41a8[ 	]+lw[ 	]+a0,64\(a1\)
[^:]+:[ 	]+c1a8[ 	]+sw[ 	]+a0,64\(a1\)
[^:]+:[ 	]+d5f1[ 	]+beqz[ 	]+a1,0 \<target\>
[^:]+: R_RISCV_RVC_BRANCH[	]+target
[^:]+:[ 	]+b7e9[ 	]+j[ 	]+0 \<target\>
[^:]+: R_RISCV_RVC_JUMP[	]+target
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[^:]+:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[^:]+:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+fab50ce3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+fab50ae3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[^:]+:[ 	]+fa9ff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+fa5ff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[^:]+:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4 # .*
[^:]+:[ 	]+002c[ 	]+addi[ 	]+a1,sp,8
[^:]+:[ 	]+c0aa[ 	]+sw[ 	]+a0,64\(sp\)
[^:]+:[ 	]+41a8[ 	]+lw[ 	]+a0,64\(a1\)
[^:]+:[ 	]+c1a8[ 	]+sw[ 	]+a0,64\(a1\)
[^:]+:[ 	]+8d6d[ 	]+and[ 	]+a0,a0,a1
[^:]+:[ 	]+d9c9[ 	]+beqz[ 	]+a1,0 \<target\>
[^:]+: R_RISCV_RVC_BRANCH[	]+target
[^:]+:[ 	]+bf41[ 	]+j[ 	]+0 \<target\>
[^:]+: R_RISCV_RVC_JUMP[	]+target
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+0001[ 	]+nop
[^:]+:[ 	]+00000013[ 	]+nop
[^:]+:[ 	]+001f 0000 0000[ 	].*
[^:]+:[ 	]+0000003f 00000000[ 	].*
[^:]+:[ 	]+0001[ 	]+nop
[^:]+:[ 	]+00000013[ 	]+nop
[^:]+:[ 	]+001f 0000 0000[ 	].*
[^:]+:[ 	]+0000003f 00000000[ 	].*
