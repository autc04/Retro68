.option rvc
nop
.option norvc
nop

.option push
.option arch, rv32i
.option arch, +c,+f
flw fa0, 0(a0)
.option norvc
flw fa0, 0(a0)
.option pop

.option arch, +c,+d
fld fa0, 0(a0)
.option norvc
fld fa0, 0(a0)

.option arch, +zca
nop
.option norvc
nop

.option push
.option arch, rv32i
.option arch, +zcf
flw fa0, 0(a0)
.option norvc
flw fa0, 0(a0)
.option pop

.option arch, +zcd
fld fa0, 0(a0)
.option norvc
fld fa0, 0(a0)

.option push
.option arch, rv32i
.option arch, +zcb,+zclsd
lbu x8,2(x8)
ld x8, 0(x9)
.option norvc
lbu x8,2(x8)
ld x8, 0(x9)
.option pop

.option arch, rv64i
.option arch, +zcmp,+zcmop,+zcmt
.option norvc
nop
