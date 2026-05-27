	.globl foo
	.globl foo_base
	.type foo, %object
	.type foo_base, %object
	.data
foo:
foo_base:
	.dc.a bar

	.symver foo_base,foo@

	.globl bar
	.globl bar_base
	.type bar, %object
	.type bar_base, %object
bar:
bar_base:
	.dc.a foo

	.symver bar_base,bar@@
