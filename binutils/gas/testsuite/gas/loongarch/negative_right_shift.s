directives:
.align	  -1>>62
.word	  -1>>63
.4byte	  -1>>63

insns:
addi.w	  $t0, $t1, -1<<1
addi.d	  $t0, $t1, -1<<1
addu16i.d $t0, $t1, -1<<1
lu12i.w	  $t0, -1<<1
lu32i.d	  $t0, -1<<1
lu52i.d	  $t0, $t1, -1<<1
slti	  $t0, $t1, -1<<1
sltui	  $t0, $t1, -1<<1
pcaddi	  $t0, -1<<1
pcaddu12i $t0, -1<<1
pcaddu18i $t0, -1<<1
pcalau12i $t0, -1<<1

# warn
addi.w	  $t0, $t1, -1>>63
addi.d	  $t0, $t1, -1>>63
addu16i.d $t0, $t1, -1>>63
lu12i.w	  $t0, -1>>63
lu32i.d	  $t0, -1>>63
lu52i.d	  $t0, $t1, -1>>63
slti	  $t0, $t1, -1>>63
sltui	  $t0, $t1, -1>>63
pcaddi	  $t0, -1>>63
pcaddu12i $t0, -1>>63
pcaddu18i $t0, -1>>63
pcalau12i $t0, -1>>63
