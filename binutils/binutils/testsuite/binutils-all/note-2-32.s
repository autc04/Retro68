	.text
	.org 0x100
	.global note1.s
note1.s:
	.word 0
	
	.pushsection .gnu.build.attributes, "0x100000", %note
	.balign 4
	.dc.l 4
	.dc.l 4
	.dc.l 0x100
	.asciz "$1"
	.dc.l note1.s

	.dc.l 12
	.dc.l 0
	.dc.l 0x100
	.asciz "$gcc 7.0.1"

	.dc.l 3
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x2b, 0x2, 0
	.dc.b 0

	.dc.l 4
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x2a, 0x7, 0, 0

	.dc.l 4
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x2a, 0x6, 0, 0
	.popsection


	.global note2.s
note2.s:
	.type func1, STT_FUNC
func1:	
	.word 0x100
	
	.pushsection .gnu.build.attributes, "0x100000", %note
	.dc.l 4 	
	.dc.l 4		
	.dc.l 0x100	
	.asciz "$1"	
	.dc.l note2.s	

	.dc.l 12 	
	.dc.l 0		
	.dc.l 0x100	
	.asciz "$gcc 7.0.1"	

	.dc.l 3		
	.dc.l 0		
	.dc.l 0x100	
	.dc.b 0x21, 0x2, 0
	.dc.b 0 	

	.dc.l 4		
	.dc.l 0		
	.dc.l 0x101	
	.dc.b 0x2a, 0x7, 1, 0

	.dc.l 4		
	.dc.l 0		
	.dc.l 0x100	
	.dc.b 0x2a, 0x6, 0, 0
	.popsection

	.global note3.s
note3.s:
	.word 0x100
	
	.pushsection .gnu.build.attributes, "0x100000", %note
	.dc.l 4 	
	.dc.l 4		
	.dc.l 0x100	
	.asciz "$1"	
	.dc.l note3.s

	.dc.l 12 	
	.dc.l 0		
	.dc.l 0x100	
	.asciz "$gcc 7.0.1"	

	.popsection
	
	
