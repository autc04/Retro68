#as:
#objdump: -dr -Mnumeric,no-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+ <_start>:
[ 	]+0:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+x1,0x0
[ 	]+0:[ 	]+R_RISCV_GOT_HI20[ 	]+sym_abs_before
[ 	]+0:[ 	]+R_RISCV_RELAX.*
[ 	]+4:[ 	]+[0-9a-f]+[ 	]+(lw|ld)[ 	]+x1,0\(x1\) # 0 .*
[ 	]+4:[ 	]+R_RISCV_PCREL_LO12_I[ 	]+.L0.*
[ 	]+4:[ 	]+R_RISCV_RELAX.*
[ 	]+8:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+x2,0x0
[ 	]+8:[ 	]+R_RISCV_GOT_HI20[ 	]+sym_abs_before
[ 	]+8:[ 	]+R_RISCV_RELAX.*
[ 	]+c:[ 	]+[0-9a-f]+[ 	]+(lw|ld)[ 	]+x2,0\(x2\) # 8 .*
[ 	]+c:[ 	]+R_RISCV_PCREL_LO12_I[ 	]+.L0.*
[ 	]+c:[ 	]+R_RISCV_RELAX.*

0+10 <.L1>:
[ 	]+10:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+x3,0x0
[ 	]+10:[ 	]+R_RISCV_GOT_HI20[ 	]+sym_abs_before
[ 	]+14:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+x3,x3,0 # 10 .*
[ 	]+14:[ 	]+R_RISCV_PCREL_LO12_I[ 	]+.L1.*
[ 	]+14:[ 	]+R_RISCV_RELAX.*
[ 	]+18:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+x4,0x0
[ 	]+18:[ 	]+R_RISCV_GOT_HI20[ 	]+sym_abs_after
[ 	]+18:[ 	]+R_RISCV_RELAX.*
[ 	]+1c:[ 	]+[0-9a-f]+[ 	]+(lw|ld)[ 	]+x4,0\(x4\) # 18 .*
[ 	]+1c:[ 	]+R_RISCV_PCREL_LO12_I[ 	]+.L0.*
[ 	]+1c:[ 	]+R_RISCV_RELAX.*
[ 	]+20:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+x5,0x0
[ 	]+20:[ 	]+R_RISCV_GOT_HI20[ 	]+sym_abs_after
[ 	]+20:[ 	]+R_RISCV_RELAX.*
[ 	]+24:[ 	]+[0-9a-f]+[ 	]+(lw|ld)[ 	]+x5,0\(x5\) # 20 .*
[ 	]+24:[ 	]+R_RISCV_PCREL_LO12_I[ 	]+.L0.*
[ 	]+24:[ 	]+R_RISCV_RELAX.*

0+28 <.L2>:
[ 	]+28:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+x6,0x0
[ 	]+28:[ 	]+R_RISCV_GOT_HI20[ 	]+sym_abs_after
[ 	]+2c:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+x6,x6,0 # 28 .*
[ 	]+2c:[ 	]+R_RISCV_PCREL_LO12_I[ 	]+.L2.*
[ 	]+2c:[ 	]+R_RISCV_RELAX.*
