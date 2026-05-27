 .text
foo:
 li $3,%tprel_hi($loc0+0x11229988)
 sll $3,16
 addiu $3,%tprel_lo($loc0+0x11229988)

 li $3,%dtprel_hi($loc0+0x11229988)
 sll $3,16
 addiu $3,%dtprel_lo($loc0+0x11229988)

 li $3,%tprel_hi(.tdata+0x11221988)
 sll $3,16
 addiu $3,%tprel_lo(.tdata+0x11221988)

 li $3,%dtprel_hi(.tdata+0x11221988)
 sll $3,16
 addiu $3,%dtprel_lo(.tdata+0x11221988)

 .section .tdata,"awT",%progbits
$loc0:
 .word 0
