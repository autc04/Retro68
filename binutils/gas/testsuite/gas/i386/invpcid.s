# Check INVPCID instruction

	.text
foo:
	invpcid	(%eax), %edx

	.intel_syntax noprefix
	invpcid	edx,[eax]
	invpcid	edx,oword ptr [eax]
