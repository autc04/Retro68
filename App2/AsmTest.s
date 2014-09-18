# Completely pointless test program to figure out how MacsBug function names work

# The format for MacsBug function names:

# if strlen(name) < 32:
#	rts | jmp (%a0)		// return instruction [required]
#   .byte 0x80 + strlen(name)
#	.ascii name
#	.align 2,0
#	.short literalBytes
#	// literalBytes of data
# else: // 32 <= strlen(name) <= 255
#	rts | jmp (%a0)		// return instruction [required]
#   .byte 0x80
#	.byte strlen(name)
#	.ascii name
#	.align 2,0
#	.short literalBytes
#	// literalBytes of data

	.section	.text.startup,"ax",@progbits
	.align 2
	.globl main
	.type main, @function
main:
	link.w %fp,#0
	dc.w 0xa9ff
	moveq #0,%d0


	move.w #42, -(%sp)
	bsr foopas

	move.w #42, -(%sp)
	bsr foopas2

	move.w #42, -(%sp)
	bsr barpas

	bsr quux

		# Some weird control flow to see under what
		# circumstances MacsBug recognizes function names:
	bra .L1
	unlk %fp
.L2:
	rts
.L1:
	moveq #1,%d0
	unlk %fp
	bra .L2

		# MacsBug recognizes the function name only
		# after rts and a few other instructions,
		# so we just add a rts
	rts

	.byte 132
	.ascii	"main"
	.align 2,0
	# size of literals following function name
	.short 0
	.size	main, .-main



foopas:
	link.w %fp,#42
	unlk %fp
	move.l (%sp)+, %a0
	addq #2, %sp

		# MacsBug knows about jmp (%a0)
	jmp (%a0)
	.byte 134
	.ascii	"foopas"
	.align 2,0
	# size of literals following function name
	.short 0
	.size	foopas, .-foopas

foopas2:
	link.w %fp,#42
	unlk %fp
	move.l (%sp)+, %a1
	addq #2, %sp

		# MacsBug doesn't know about jmp (%a1)
	jmp (%a1)
	.byte 135
	.ascii	"foopas2"
	.align 2,0
	# size of literals following function name
	.short 0
	.size	foopas2, .-foopas2



barpas:
	link.w %fp,#42
	unlk %fp
	move.l (%sp)+, %a1
	addq #2, %sp
	jmp (%a1)

		# ... but adding an extra rts doesn't hurt.
	rts
	.byte 134
	.ascii	"barpas"
	.align 2,0
	# size of literals following function name
	.short 0
	.size	barpas, .-barpas


quux:
	link.w %fp,#42
	unlk %fp
	rts
	rts
	.byte 152
		# MacsBug doesn't recognize names with weird characters
	.ascii	"quux<X>::operator()(int)"
	.align 2,0
	# size of literals following function name
	.short 0
	.size	quux, .-quux

