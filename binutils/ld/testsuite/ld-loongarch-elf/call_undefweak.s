	.text
	.align  2
	.globl  main
	.type   main, @function
main:
	# undefweak symbol with .hidden and .protected
	# do not need plt entry, Calls to these symbols
	# are converted to jump to 0.
nornal_call_nop:
	b   %plt(fn1)
	b   %plt(fn2)

	bl  %plt(fn1)
	bl  %plt(fn2)

	# Medium call.
medium_call_nop:
	.option norelax
	# call36
	pcaddu18i $r1,%call36(fn1)
	jirl      $r1,$r1,0
	pcaddu18i $r1,%call36(fn2)
	jirl      $r1,$r1,0
	# tail36
	pcaddu18i $r12,%call36(fn1)
	jirl      $r0,$r12,0
	pcaddu18i $r12,%call36(fn2)
	jirl      $r0,$r12,0

	.weak   fn1
	.hidden fn1

	.weak   fn2
