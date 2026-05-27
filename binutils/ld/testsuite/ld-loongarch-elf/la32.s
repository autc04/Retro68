	.global var
	.section .tdata,"awT",@progbits
var:
	.word 1

	.text
  	.global .L1
  	.hidden .L1
.L1:
  call30 .L1 # relax to bl
  la.got $t0, .L1 # relax to pcaddu12i + addi.w
  la.tls.ie $t0, var # relax to tls le
  la.tls.desc $t0, var # relax to tls le

