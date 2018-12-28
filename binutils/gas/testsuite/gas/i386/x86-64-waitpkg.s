# Check 64bit WAITPKG instructions.

	.text
_start:
	umonitor %rax
	umonitor %r10
	umonitor %r10d
	umwait %ecx
	umwait %rcx
	umwait %r10
	umwait %r10d
	tpause %ecx
	tpause %rcx
	tpause %r10
	tpause %r10d
