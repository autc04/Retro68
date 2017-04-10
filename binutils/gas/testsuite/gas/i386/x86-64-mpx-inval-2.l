.*: Assembler messages:
.*:6: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:7: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:8: Error: `\(%rip\)' cannot be used here
.*:9: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:12: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:13: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:15: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:16: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:19: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:20: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:23: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:24: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:27: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:28: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:31: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:32: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:33: Warning: register scaling is being ignored here
.*:34: Error: `base\(%rip\)' cannot be used here
.*:35: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:38: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:39: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:40: Warning: register scaling is being ignored here
.*:41: Error: `base\(%rip\)' cannot be used here
.*:42: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:45: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:46: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:47: Error: `\[rip\]' cannot be used here
.*:48: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:51: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:52: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:54: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:55: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:58: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:59: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:62: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:63: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:66: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:67: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:70: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:71: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:72: Warning: register scaling is being ignored here
.*:73: Error: `\[rip\+base\]' cannot be used here
.*:74: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:77: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:78: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
.*:79: Warning: register scaling is being ignored here
.*:80: Error: `\[rip\+base\]' cannot be used here
.*:81: Error: 32-bit address isn't allowed in 64-bit MPX instructions.
GAS LISTING .*


[ 	]*1[ 	]+\# MPX instructions
[ 	]*2[ 	]+\.allow_index_reg
[ 	]*3[ 	]+\.text
[ 	]*4[ 	]+
[ 	]*5[ 	]+\#\#\# bndmk
[ 	]*6[ 	]+\?\?\?\? 67F30F1B 		bndmk \(%eax\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*6[ 	]+08
[ 	]*7[ 	]+\?\?\?\? 67F30F1B 		bndmk 0x3\(%ecx,%ebx,1\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*7[ 	]+4C1903
[ 	]*8[ 	]+bndmk \(%rip\), %bnd3
[ 	]*9[ 	]+\?\?\?\? 67F30F1B 		bndmk \(%eip\), %bnd2
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*9[ 	]+15000000 
[ 	]*9[ 	]+00
[ 	]*10[ 	]+
[ 	]*11[ 	]+\#\#\# bndmov
[ 	]*12[ 	]+\?\?\?\? 6766410F 		bndmov \(%r8d\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*12[ 	]+1A08
[ 	]*13[ 	]+\?\?\?\? 6766410F 		bndmov 0x3\(%r9d,%edx,1\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*13[ 	]+1A4C1103 
[ 	]*14[ 	]+
[ 	]*15[ 	]+\?\?\?\? 67660F1B 		bndmov %bnd1, \(%eax\)
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*15[ 	]+08
[ 	]*16[ 	]+\?\?\?\? 67660F1B 		bndmov %bnd1, 0x3\(%ecx,%eax,1\)
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*16[ 	]+4C0103
[ 	]*17[ 	]+
[ 	]*18[ 	]+\#\#\# bndcl
[ 	]*19[ 	]+\?\?\?\? 67F30F1A 		bndcl \(%ecx\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*19[ 	]+09
[ 	]*20[ 	]+\?\?\?\? 67F30F1A 		bndcl 0x3\(%ecx,%eax,1\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*20[ 	]+4C0103
[ 	]*21[ 	]+
[ 	]*22[ 	]+\#\#\# bndcu
[ 	]*23[ 	]+\?\?\?\? 67F20F1A 		bndcu \(%ecx\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*23[ 	]+09
[ 	]*24[ 	]+\?\?\?\? 67F20F1A 		bndcu 0x3\(%ecx,%eax,1\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*24[ 	]+4C0103
[ 	]*25[ 	]+
[ 	]*26[ 	]+\#\#\# bndcn
[ 	]*27[ 	]+\?\?\?\? 67F20F1B 		bndcn \(%ecx\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*27[ 	]+09
[ 	]*28[ 	]+\?\?\?\? 67F20F1B 		bndcn 0x3\(%ecx,%eax,1\), %bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*28[ 	]+4C0103
[ 	]*29[ 	]+
[ 	]*30[ 	]+\#\#\# bndstx
GAS LISTING .*


[ 	]*31[ 	]+\?\?\?\? 670F1B44 		bndstx %bnd0, 0x3\(%eax,%ebx,1\)
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*31[ 	]+1803
[ 	]*32[ 	]+\?\?\?\? 670F1B53 		bndstx %bnd2, 3\(%ebx,1\)
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*32[ 	]+03
[ 	]*33[ 	]+\?\?\?\? 410F1B0C 		bndstx %bnd1, \(%r15,%rax,2\)
.*  Warning: register scaling is being ignored here
[ 	]*33[ 	]+47
[ 	]*34[ 	]+bndstx %bnd3, base\(%rip\)
[ 	]*35[ 	]+\?\?\?\? 670F1B0D 		bndstx %bnd1, base\(%eip\)
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*35[ 	]+[0-9a-f][0-9a-f][0-9a-f]00000 
[ 	]*36[ 	]+
[ 	]*37[ 	]+\#\#\# bndldx
[ 	]*38[ 	]+\?\?\?\? 670F1A44 		bndldx 0x3\(%eax,%ebx,1\), %bnd0
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*38[ 	]+1803
[ 	]*39[ 	]+\?\?\?\? 670F1A53 		bndldx 3\(%ebx,1\), %bnd2
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*39[ 	]+03
[ 	]*40[ 	]*\?\?\?\? 420F1A1C 		bndldx \(%rax,%r15,4\), %bnd3
.*  Warning: register scaling is being ignored here
[ 	]*40[ 	]*B8
[ 	]*41[ 	]*bndldx base\(%rip\), %bnd1
[ 	]*42[ 	]*\?\?\?\? 670F1A1D 		bndldx base\(%eip\), %bnd3
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*42[ 	]*[0-9a-f][0-9a-f][0-9a-f]00000 
[ 	]*43[ 	]+
[ 	]*44[ 	]+\.intel_syntax noprefix
[ 	]*45[ 	]+\?\?\?\? 67F30F1B 		bndmk bnd1, \[eax\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*45[ 	]+08
[ 	]*46[ 	]+\?\?\?\? 67F30F1B 		bndmk bnd1, \[edx\+1\*eax\+0x3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*46[ 	]+4C0203
[ 	]*47[ 	]*bndmk bnd3, \[rip\]
[ 	]*48[ 	]*\?\?\?\? 67F30F1B 		bndmk bnd2, \[eip\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions.
[ 	]*48[ 	]*15000000 
[ 	]*48[ 	]*00
[ 	]*49[ 	]+
[ 	]*50[ 	]+\#\#\# bndmov
[ 	]*51[ 	]+\?\?\?\? 67660F1A 		bndmov bnd1, \[eax\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*51[ 	]+08
[ 	]*52[ 	]+\?\?\?\? 67660F1A 		bndmov bnd1, \[edx\+1\*eax\+0x3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*52[ 	]+4C0203
[ 	]*53[ 	]+
[ 	]*54[ 	]+\?\?\?\? 67660F1B 		bndmov \[eax\], bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*54[ 	]+08
[ 	]*55[ 	]+\?\?\?\? 67660F1B 		bndmov \[edx\+1\*eax\+0x3\], bnd1
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*55[ 	]+4C0203
[ 	]*56[ 	]+
GAS LISTING .*


[ 	]*57[ 	]+\#\#\# bndcl
[ 	]*58[ 	]+\?\?\?\? 67F30F1A 		bndcl bnd1, \[eax\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*58[ 	]+08
[ 	]*59[ 	]+\?\?\?\? 67F30F1A 		bndcl bnd1, \[edx\+1\*eax\+0x3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*59[ 	]+4C0203
[ 	]*60[ 	]+
[ 	]*61[ 	]+\#\#\# bndcu
[ 	]*62[ 	]+\?\?\?\? 67F20F1A 		bndcu bnd1, \[eax\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*62[ 	]+08
[ 	]*63[ 	]+\?\?\?\? 67F20F1A 		bndcu bnd1, \[edx\+1\*eax\+0x3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*63[ 	]+4C0203
[ 	]*64[ 	]+
[ 	]*65[ 	]+\#\#\# bndcn
[ 	]*66[ 	]+\?\?\?\? 67F20F1B 		bndcn bnd1, \[eax\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*66[ 	]+08
[ 	]*67[ 	]+\?\?\?\? 67F20F1B 		bndcn bnd1, \[edx\+1\*eax\+0x3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*67[ 	]+4C0203
[ 	]*68[ 	]+
[ 	]*69[ 	]+\#\#\# bndstx
[ 	]*70[ 	]+\?\?\?\? 670F1B44 		bndstx \[eax\+ebx\*1\+0x3\], bnd0
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*70[ 	]+1803
[ 	]*71[ 	]+\?\?\?\? 670F1B14 		bndstx \[1\*ebx\+3\], bnd2
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*71[ 	]+1D030000 
[ 	]*71[ 	]+00
[ 	]*72[ 	]+\?\?\?\? 410F1B14 		bndstx \[r8\+rdi\*4\], bnd2
.*  Warning: register scaling is being ignored here
[ 	]*72[ 	]+B8
[ 	]*73[ 	]+bndstx \[rip\+base\], bnd1
[ 	]*74[ 	]+\?\?\?\? 670F1B1D 		bndstx \[eip\+base\], bnd3
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*74[ 	]+[0-9a-f][0-9a-f][0-9a-f]00000 
[ 	]*75[ 	]+
[ 	]*76[ 	]+\#\#\# bndldx
[ 	]*77[ 	]+\?\?\?\? 670F1A44 		bndldx bnd0, \[eax\+ebx\*1\+0x3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*77[ 	]+1803
[ 	]*78[ 	]+\?\?\?\? 670F1A14 		bndldx bnd2, \[1\*ebx\+3\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*78[ 	]+1D030000 
[ 	]*78[ 	]+00
[ 	]*79[ 	]+\?\?\?\? 420F1A14 		bndldx bnd2, \[rdi\+r8\*8\]
.*  Warning: register scaling is being ignored here
[ 	]*79[ 	]+C7
[ 	]*80[ 	]+bndldx bnd1, \[rip\+base\]
[ 	]*81[ 	]+\?\?\?\? 670F1A1D 		bndldx bnd3, \[eip\+base\]
.*  Error: 32-bit address isn't allowed in 64-bit MPX instructions\.
[ 	]*81      [0-9a-f][0-9a-f][0-9a-f]00000 
#pass
