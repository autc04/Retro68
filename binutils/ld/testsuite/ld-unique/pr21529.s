	.type a, %gnu_unique_object
a:	.long 0
	.size a, .-a

        .type main,"function"
        .global main
main:
        .dc.a a
