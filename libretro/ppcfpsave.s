#	Copyright 2015 Wolfgang Thaller.
#
#	This file is part of Retro68.
#
#	Retro68 is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	Retro68 is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	Under Section 7 of GPL version 3, you are granted additional
#	permissions described in the GCC Runtime Library Exception, version
#	3.1, as published by the Free Software Foundation.
#
#	You should have received a copy of the GNU General Public License and
#	a copy of the GCC Runtime Library Exception along with this program;
#	see the files COPYING and COPYING.RUNTIME respectively.  If not, see
#	<http://www.gnu.org/licenses/>.

			.globl ._savef14
			.globl ._savef15
			.globl ._savef16
			.globl ._savef17
			.globl ._savef18
			.globl ._savef19
			.globl ._savef20
			.globl ._savef21
			.globl ._savef22
			.globl ._savef23
			.globl ._savef24
			.globl ._savef25
			.globl ._savef26
			.globl ._savef27
			.globl ._savef28
			.globl ._savef29
			.globl ._savef30
			.globl ._savef31
			.csect .text[PR]

._savef14:	stfd 14, -144(1)
._savef15:	stfd 15, -136(1)
._savef16:	stfd 16, -128(1)
._savef17:	stfd 17, -120(1)
._savef18:	stfd 18, -112(1)
._savef19:	stfd 19, -104(1)
._savef20:	stfd 20, -96(1)
._savef21:	stfd 21, -88(1)
._savef22:	stfd 22, -80(1)
._savef23:	stfd 23, -72(1)
._savef24:	stfd 24, -64(1)
._savef25:	stfd 25, -56(1)
._savef26:	stfd 26, -48(1)
._savef27:	stfd 27, -40(1)
._savef28:	stfd 28, -32(1)
._savef29:	stfd 29, -24(1)
._savef30:	stfd 30, -16(1)
._savef31:	stfd 31, -8(1)
			blr

			.globl ._restf14
			.globl ._restf15
			.globl ._restf16
			.globl ._restf17
			.globl ._restf18
			.globl ._restf19
			.globl ._restf20
			.globl ._restf21
			.globl ._restf22
			.globl ._restf23
			.globl ._restf24
			.globl ._restf25
			.globl ._restf26
			.globl ._restf27
			.globl ._restf28
			.globl ._restf29
			.globl ._restf30
			.globl ._restf31
			.csect .text[PR]

._restf14:	lfd 14, -144(1)
._restf15:	lfd 15, -136(1)
._restf16:	lfd 16, -128(1)
._restf17:	lfd 17, -120(1)
._restf18:	lfd 18, -112(1)
._restf19:	lfd 19, -104(1)
._restf20:	lfd 20, -96(1)
._restf21:	lfd 21, -88(1)
._restf22:	lfd 22, -80(1)
._restf23:	lfd 23, -72(1)
._restf24:	lfd 24, -64(1)
._restf25:	lfd 25, -56(1)
._restf26:	lfd 26, -48(1)
._restf27:	lfd 27, -40(1)
._restf28:	lfd 28, -32(1)
._restf29:	lfd 29, -24(1)
._restf30:	lfd 30, -16(1)
._restf31:	lfd 31, -8(1)
			blr
