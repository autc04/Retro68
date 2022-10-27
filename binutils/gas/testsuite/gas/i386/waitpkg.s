# Check 32bit WAITPKG instructions.

	.text
_start:
	umonitor %eax
	umonitor %cx
	umwait %ecx
	tpause %ecx
