.*: Assembler messages:
.*:6: Error: .*
.*:8: Error: .*
.*:24: Error: .*
.*:30: Error: .*
.*:32: Error: .*
.*:34: Error: .*
.*:36: Error: .*
.*:38: Error: .*
.*:40: Error: .*
.*:42: Error: .*
.*:44: Error: .*
.*:46: Error: .*
.*:48: Error: .*
.*:50: Error: .*
.*:52: Error: .*
.*:54: Error: .*
.*:56: Error: .*
.*:58: Error: .*
GAS LISTING .*


[ 	]*1[ 	]+\.include "arch-10\.s"
[ 	]*1[ 	]+\# Test -march=
[ 	]*2[ 	]+\.text
[ 	]*3[ 	]+\# cmov feature 
[ 	]*4[ 	]+\?\?\?\? 0F44D8   	cmove	%eax,%ebx
[ 	]*5[ 	]+\# clflush
[ 	]*6[ 	]+clflush \(%eax\)
[ 	]*7[ 	]+\# SYSCALL
[ 	]*8[ 	]+syscall
[ 	]*9[ 	]+\# MMX
[ 	]*10[ 	]+\?\?\?\? 0FFCDC   	paddb %mm4,%mm3
[ 	]*11[ 	]+\# SSE
[ 	]*12[ 	]+\?\?\?\? F30F58DC 	addss %xmm4,%xmm3
[ 	]*13[ 	]+\# SSE2
[ 	]*14[ 	]+\?\?\?\? F20F58DC 	addsd %xmm4,%xmm3
[ 	]*15[ 	]+\# SSE3
[ 	]*16[ 	]+\?\?\?\? 660FD0DC 	addsubpd %xmm4,%xmm3
[ 	]*17[ 	]+\# SSSE3
[ 	]*18[ 	]+\?\?\?\? 660F3801 	phaddw %xmm4,%xmm3
[ 	]*18[ 	]+DC
[ 	]*19[ 	]+\# SSE4\.1
[ 	]*20[ 	]+\?\?\?\? 660F3841 	phminposuw  %xmm1,%xmm3
[ 	]*20[ 	]+D9
[ 	]*21[ 	]+\# SSE4\.2
[ 	]*22[ 	]+\?\?\?\? F20F38F1 	crc32   %ecx,%ebx
[ 	]*22[ 	]+D9
[ 	]*23[ 	]+\# AVX
[ 	]*24[ 	]+vzeroall
[ 	]*25[ 	]+\# VMX
[ 	]*26[ 	]+\?\?\?\? 0F01C4   	vmxoff
[ 	]*27[ 	]+\# SMX
[ 	]*28[ 	]+\?\?\?\? 0F37     	getsec
[ 	]*29[ 	]+\# Xsave
[ 	]*30[ 	]+xgetbv
[ 	]*31[ 	]+\# AES
[ 	]*32[ 	]+aesenc  \(%ecx\),%xmm0
[ 	]*33[ 	]+\# PCLMUL
[ 	]*34[ 	]+pclmulqdq \$8,%xmm1,%xmm0
[ 	]*35[ 	]+\# AES \+ AVX
[ 	]*36[ 	]+vaesenc  \(%ecx\),%xmm0,%xmm2
[ 	]*37[ 	]+\# PCLMUL \+ AVX
[ 	]*38[ 	]+vpclmulqdq \$8,%xmm4,%xmm6,%xmm2
[ 	]*39[ 	]+\# FMA
[ 	]*40[ 	]+vfmadd132pd %xmm4,%xmm6,%xmm2
[ 	]*41[ 	]+\# MOVBE
[ 	]*42[ 	]+movbe   \(%ecx\),%ebx
[ 	]*43[ 	]+\# EPT
[ 	]*44[ 	]+invept  \(%ecx\),%ebx
[ 	]*45[ 	]+\# RDTSCP
[ 	]*46[ 	]+rdtscp
[ 	]*47[ 	]+\# 3DNow
[ 	]*48[ 	]+pmulhrw %mm4,%mm3
[ 	]*49[ 	]+\# 3DNow Extensions
[ 	]*50[ 	]+pswapd %mm4,%mm3
[ 	]*51[ 	]+\# SSE4a
[ 	]*52[ 	]+insertq %xmm2,%xmm1
[ 	]*53[ 	]+\# SVME
GAS LISTING .*


[ 	]*54[ 	]+vmload
[ 	]*55[ 	]+\# ABM
[ 	]*56[ 	]+lzcnt %ecx,%ebx
[ 	]*57[ 	]+\# PadLock
[ 	]*58[ 	]+xstorerng
