# Test -march=
	.text
#SMAP
	clac
	stac
#ADCX ADOX
	adcx    %edx, %ecx
	adox    %edx, %ecx
#RDSEED
	rdseed    %eax
#CLZERO
	clzero
#SHA
	sha1nexte (%rax), %xmm8
#XSAVEC
	xsavec64        (%rcx)
#XSAVES
	xsaves64        (%rcx)
#CLFLUSHOPT
	clflushopt      (%rcx)
	monitorx %rax,%rcx,%rdx
	monitorx %eax,%rcx,%rdx
	monitorx
	mwaitx %rax,%rcx,%rbx
	mwaitx
# clwb instruction
	clwb	(%rcx)	 # CLWB
	clwb	0x123(%rax,%r14,8)	 # CLWB

# rdpid instruction
	rdpid %rax
	rdpid %r10

# wbnoinvd instruction
	wbnoinvd
