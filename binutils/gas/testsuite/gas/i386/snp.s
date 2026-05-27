# Check SNP instructions

	.text
att:
        pvalidate
        pvalidate %eax, %ecx, %edx
.ifdef x86_64
        pvalidate %rax, %ecx, %edx
        psmash
        psmash	%rax
        psmash	%eax
        rmpupdate
        rmpupdate %rax, %rcx
        rmpupdate (%rcx), %rax
        rmpupdate (%ecx), %rax
        rmpadjust
        rmpadjust %rax, %rcx, %rdx
        rmpadjust %eax, %rcx, %rdx
        rmpread %rax, (%rcx)
        rmpread %rax, (%ecx)
.else
        pvalidate %ax, %ecx, %edx
.endif

	.intel_syntax noprefix
intel:
        pvalidate
        pvalidate eax, ecx, edx
.ifdef x86_64
        pvalidate rax, ecx, edx
        psmash
        psmash	rax
        psmash	eax
        rmpupdate
        rmpupdate rax, rcx
        rmpupdate rax, [rcx]
        rmpupdate rax, [ecx]
        rmpadjust
        rmpadjust rax, rcx, rdx
        rmpadjust eax, rcx, rdx
        rmpread [rcx], rax
        rmpread [ecx], rax
.else
        pvalidate ax, ecx, edx
.endif
