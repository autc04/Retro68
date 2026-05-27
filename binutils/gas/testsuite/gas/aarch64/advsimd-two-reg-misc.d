#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	0e200800 	rev64	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20081f 	rev64	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e200be0 	rev64	v0\.8b, v31\.8b
 *[0-9a-f]+:	0e600800 	rev64	v0\.4h, v0\.4h
 *[0-9a-f]+:	0e60081f 	rev64	v31\.4h, v0\.4h
 *[0-9a-f]+:	0e600be0 	rev64	v0\.4h, v31\.4h
 *[0-9a-f]+:	0ea00800 	rev64	v0\.2s, v0\.2s
 *[0-9a-f]+:	0ea0081f 	rev64	v31\.2s, v0\.2s
 *[0-9a-f]+:	0ea00be0 	rev64	v0\.2s, v31\.2s
 *[0-9a-f]+:	4e200800 	rev64	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20081f 	rev64	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e200be0 	rev64	v0\.16b, v31\.16b
 *[0-9a-f]+:	4e600800 	rev64	v0\.8h, v0\.8h
 *[0-9a-f]+:	4e60081f 	rev64	v31\.8h, v0\.8h
 *[0-9a-f]+:	4e600be0 	rev64	v0\.8h, v31\.8h
 *[0-9a-f]+:	4ea00800 	rev64	v0\.4s, v0\.4s
 *[0-9a-f]+:	4ea0081f 	rev64	v31\.4s, v0\.4s
 *[0-9a-f]+:	4ea00be0 	rev64	v0\.4s, v31\.4s
 *[0-9a-f]+:	0e201800 	rev16	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20181f 	rev16	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e201be0 	rev16	v0\.8b, v31\.8b
 *[0-9a-f]+:	4e201800 	rev16	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20181f 	rev16	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e201be0 	rev16	v0\.16b, v31\.16b
 *[0-9a-f]+:	0e202800 	saddlp	v0\.4h, v0\.8b
 *[0-9a-f]+:	0e20281f 	saddlp	v31\.4h, v0\.8b
 *[0-9a-f]+:	0e202be0 	saddlp	v0\.4h, v31\.8b
 *[0-9a-f]+:	0e602800 	saddlp	v0\.2s, v0\.4h
 *[0-9a-f]+:	0e60281f 	saddlp	v31\.2s, v0\.4h
 *[0-9a-f]+:	0e602be0 	saddlp	v0\.2s, v31\.4h
 *[0-9a-f]+:	0ea02800 	saddlp	v0\.1d, v0\.2s
 *[0-9a-f]+:	0ea0281f 	saddlp	v31\.1d, v0\.2s
 *[0-9a-f]+:	0ea02be0 	saddlp	v0\.1d, v31\.2s
 *[0-9a-f]+:	4e202800 	saddlp	v0\.8h, v0\.16b
 *[0-9a-f]+:	4e20281f 	saddlp	v31\.8h, v0\.16b
 *[0-9a-f]+:	4e202be0 	saddlp	v0\.8h, v31\.16b
 *[0-9a-f]+:	4e602800 	saddlp	v0\.4s, v0\.8h
 *[0-9a-f]+:	4e60281f 	saddlp	v31\.4s, v0\.8h
 *[0-9a-f]+:	4e602be0 	saddlp	v0\.4s, v31\.8h
 *[0-9a-f]+:	4ea02800 	saddlp	v0\.2d, v0\.4s
 *[0-9a-f]+:	4ea0281f 	saddlp	v31\.2d, v0\.4s
 *[0-9a-f]+:	4ea02be0 	saddlp	v0\.2d, v31\.4s
 *[0-9a-f]+:	0e203800 	suqadd	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20381f 	suqadd	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e203be0 	suqadd	v0\.8b, v31\.8b
 *[0-9a-f]+:	0e603800 	suqadd	v0\.4h, v0\.4h
 *[0-9a-f]+:	0e60381f 	suqadd	v31\.4h, v0\.4h
 *[0-9a-f]+:	0e603be0 	suqadd	v0\.4h, v31\.4h
 *[0-9a-f]+:	0ea03800 	suqadd	v0\.2s, v0\.2s
 *[0-9a-f]+:	0ea0381f 	suqadd	v31\.2s, v0\.2s
 *[0-9a-f]+:	0ea03be0 	suqadd	v0\.2s, v31\.2s
 *[0-9a-f]+:	4e203800 	suqadd	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20381f 	suqadd	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e203be0 	suqadd	v0\.16b, v31\.16b
 *[0-9a-f]+:	4e603800 	suqadd	v0\.8h, v0\.8h
 *[0-9a-f]+:	4e60381f 	suqadd	v31\.8h, v0\.8h
 *[0-9a-f]+:	4e603be0 	suqadd	v0\.8h, v31\.8h
 *[0-9a-f]+:	4ea03800 	suqadd	v0\.4s, v0\.4s
 *[0-9a-f]+:	4ea0381f 	suqadd	v31\.4s, v0\.4s
 *[0-9a-f]+:	4ea03be0 	suqadd	v0\.4s, v31\.4s
 *[0-9a-f]+:	4ee03800 	suqadd	v0\.2d, v0\.2d
 *[0-9a-f]+:	4ee0381f 	suqadd	v31\.2d, v0\.2d
 *[0-9a-f]+:	4ee03be0 	suqadd	v0\.2d, v31\.2d
 *[0-9a-f]+:	0e204800 	cls	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20481f 	cls	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e204be0 	cls	v0\.8b, v31\.8b
 *[0-9a-f]+:	0e604800 	cls	v0\.4h, v0\.4h
 *[0-9a-f]+:	0e60481f 	cls	v31\.4h, v0\.4h
 *[0-9a-f]+:	0e604be0 	cls	v0\.4h, v31\.4h
 *[0-9a-f]+:	0ea04800 	cls	v0\.2s, v0\.2s
 *[0-9a-f]+:	0ea0481f 	cls	v31\.2s, v0\.2s
 *[0-9a-f]+:	0ea04be0 	cls	v0\.2s, v31\.2s
 *[0-9a-f]+:	4e204800 	cls	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20481f 	cls	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e204be0 	cls	v0\.16b, v31\.16b
 *[0-9a-f]+:	4e604800 	cls	v0\.8h, v0\.8h
 *[0-9a-f]+:	4e60481f 	cls	v31\.8h, v0\.8h
 *[0-9a-f]+:	4e604be0 	cls	v0\.8h, v31\.8h
 *[0-9a-f]+:	4ea04800 	cls	v0\.4s, v0\.4s
 *[0-9a-f]+:	4ea0481f 	cls	v31\.4s, v0\.4s
 *[0-9a-f]+:	4ea04be0 	cls	v0\.4s, v31\.4s
 *[0-9a-f]+:	0e205800 	cnt	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20581f 	cnt	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e205be0 	cnt	v0\.8b, v31\.8b
 *[0-9a-f]+:	4e205800 	cnt	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20581f 	cnt	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e205be0 	cnt	v0\.16b, v31\.16b
 *[0-9a-f]+:	0e206800 	sadalp	v0\.4h, v0\.8b
 *[0-9a-f]+:	0e20681f 	sadalp	v31\.4h, v0\.8b
 *[0-9a-f]+:	0e206be0 	sadalp	v0\.4h, v31\.8b
 *[0-9a-f]+:	0e606800 	sadalp	v0\.2s, v0\.4h
 *[0-9a-f]+:	0e60681f 	sadalp	v31\.2s, v0\.4h
 *[0-9a-f]+:	0e606be0 	sadalp	v0\.2s, v31\.4h
 *[0-9a-f]+:	0ea06800 	sadalp	v0\.1d, v0\.2s
 *[0-9a-f]+:	0ea0681f 	sadalp	v31\.1d, v0\.2s
 *[0-9a-f]+:	0ea06be0 	sadalp	v0\.1d, v31\.2s
 *[0-9a-f]+:	4e206800 	sadalp	v0\.8h, v0\.16b
 *[0-9a-f]+:	4e20681f 	sadalp	v31\.8h, v0\.16b
 *[0-9a-f]+:	4e206be0 	sadalp	v0\.8h, v31\.16b
 *[0-9a-f]+:	4e606800 	sadalp	v0\.4s, v0\.8h
 *[0-9a-f]+:	4e60681f 	sadalp	v31\.4s, v0\.8h
 *[0-9a-f]+:	4e606be0 	sadalp	v0\.4s, v31\.8h
 *[0-9a-f]+:	4ea06800 	sadalp	v0\.2d, v0\.4s
 *[0-9a-f]+:	4ea0681f 	sadalp	v31\.2d, v0\.4s
 *[0-9a-f]+:	4ea06be0 	sadalp	v0\.2d, v31\.4s
 *[0-9a-f]+:	0e207800 	sqabs	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20781f 	sqabs	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e207be0 	sqabs	v0\.8b, v31\.8b
 *[0-9a-f]+:	0e607800 	sqabs	v0\.4h, v0\.4h
 *[0-9a-f]+:	0e60781f 	sqabs	v31\.4h, v0\.4h
 *[0-9a-f]+:	0e607be0 	sqabs	v0\.4h, v31\.4h
 *[0-9a-f]+:	0ea07800 	sqabs	v0\.2s, v0\.2s
 *[0-9a-f]+:	0ea0781f 	sqabs	v31\.2s, v0\.2s
 *[0-9a-f]+:	0ea07be0 	sqabs	v0\.2s, v31\.2s
 *[0-9a-f]+:	4e207800 	sqabs	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20781f 	sqabs	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e207be0 	sqabs	v0\.16b, v31\.16b
 *[0-9a-f]+:	4e607800 	sqabs	v0\.8h, v0\.8h
 *[0-9a-f]+:	4e60781f 	sqabs	v31\.8h, v0\.8h
 *[0-9a-f]+:	4e607be0 	sqabs	v0\.8h, v31\.8h
 *[0-9a-f]+:	4ea07800 	sqabs	v0\.4s, v0\.4s
 *[0-9a-f]+:	4ea0781f 	sqabs	v31\.4s, v0\.4s
 *[0-9a-f]+:	4ea07be0 	sqabs	v0\.4s, v31\.4s
 *[0-9a-f]+:	4ee07800 	sqabs	v0\.2d, v0\.2d
 *[0-9a-f]+:	4ee0781f 	sqabs	v31\.2d, v0\.2d
 *[0-9a-f]+:	4ee07be0 	sqabs	v0\.2d, v31\.2d
 *[0-9a-f]+:	0e208800 	cmgt	v0\.8b, v0\.8b, #0
 *[0-9a-f]+:	0e20881f 	cmgt	v31\.8b, v0\.8b, #0
 *[0-9a-f]+:	0e208be0 	cmgt	v0\.8b, v31\.8b, #0
 *[0-9a-f]+:	0e608800 	cmgt	v0\.4h, v0\.4h, #0
 *[0-9a-f]+:	0e60881f 	cmgt	v31\.4h, v0\.4h, #0
 *[0-9a-f]+:	0e608be0 	cmgt	v0\.4h, v31\.4h, #0
 *[0-9a-f]+:	0ea08800 	cmgt	v0\.2s, v0\.2s, #0
 *[0-9a-f]+:	0ea0881f 	cmgt	v31\.2s, v0\.2s, #0
 *[0-9a-f]+:	0ea08be0 	cmgt	v0\.2s, v31\.2s, #0
 *[0-9a-f]+:	4e208800 	cmgt	v0\.16b, v0\.16b, #0
 *[0-9a-f]+:	4e20881f 	cmgt	v31\.16b, v0\.16b, #0
 *[0-9a-f]+:	4e208be0 	cmgt	v0\.16b, v31\.16b, #0
 *[0-9a-f]+:	4e608800 	cmgt	v0\.8h, v0\.8h, #0
 *[0-9a-f]+:	4e60881f 	cmgt	v31\.8h, v0\.8h, #0
 *[0-9a-f]+:	4e608be0 	cmgt	v0\.8h, v31\.8h, #0
 *[0-9a-f]+:	4ea08800 	cmgt	v0\.4s, v0\.4s, #0
 *[0-9a-f]+:	4ea0881f 	cmgt	v31\.4s, v0\.4s, #0
 *[0-9a-f]+:	4ea08be0 	cmgt	v0\.4s, v31\.4s, #0
 *[0-9a-f]+:	4ee08800 	cmgt	v0\.2d, v0\.2d, #0
 *[0-9a-f]+:	4ee0881f 	cmgt	v31\.2d, v0\.2d, #0
 *[0-9a-f]+:	4ee08be0 	cmgt	v0\.2d, v31\.2d, #0
 *[0-9a-f]+:	0e209800 	cmeq	v0\.8b, v0\.8b, #0
 *[0-9a-f]+:	0e20981f 	cmeq	v31\.8b, v0\.8b, #0
 *[0-9a-f]+:	0e209be0 	cmeq	v0\.8b, v31\.8b, #0
 *[0-9a-f]+:	0e609800 	cmeq	v0\.4h, v0\.4h, #0
 *[0-9a-f]+:	0e60981f 	cmeq	v31\.4h, v0\.4h, #0
 *[0-9a-f]+:	0e609be0 	cmeq	v0\.4h, v31\.4h, #0
 *[0-9a-f]+:	0ea09800 	cmeq	v0\.2s, v0\.2s, #0
 *[0-9a-f]+:	0ea0981f 	cmeq	v31\.2s, v0\.2s, #0
 *[0-9a-f]+:	0ea09be0 	cmeq	v0\.2s, v31\.2s, #0
 *[0-9a-f]+:	4e209800 	cmeq	v0\.16b, v0\.16b, #0
 *[0-9a-f]+:	4e20981f 	cmeq	v31\.16b, v0\.16b, #0
 *[0-9a-f]+:	4e209be0 	cmeq	v0\.16b, v31\.16b, #0
 *[0-9a-f]+:	4e609800 	cmeq	v0\.8h, v0\.8h, #0
 *[0-9a-f]+:	4e60981f 	cmeq	v31\.8h, v0\.8h, #0
 *[0-9a-f]+:	4e609be0 	cmeq	v0\.8h, v31\.8h, #0
 *[0-9a-f]+:	4ea09800 	cmeq	v0\.4s, v0\.4s, #0
 *[0-9a-f]+:	4ea0981f 	cmeq	v31\.4s, v0\.4s, #0
 *[0-9a-f]+:	4ea09be0 	cmeq	v0\.4s, v31\.4s, #0
 *[0-9a-f]+:	4ee09800 	cmeq	v0\.2d, v0\.2d, #0
 *[0-9a-f]+:	4ee0981f 	cmeq	v31\.2d, v0\.2d, #0
 *[0-9a-f]+:	4ee09be0 	cmeq	v0\.2d, v31\.2d, #0
 *[0-9a-f]+:	0e20a800 	cmlt	v0\.8b, v0\.8b, #0
 *[0-9a-f]+:	0e20a81f 	cmlt	v31\.8b, v0\.8b, #0
 *[0-9a-f]+:	0e20abe0 	cmlt	v0\.8b, v31\.8b, #0
 *[0-9a-f]+:	0e60a800 	cmlt	v0\.4h, v0\.4h, #0
 *[0-9a-f]+:	0e60a81f 	cmlt	v31\.4h, v0\.4h, #0
 *[0-9a-f]+:	0e60abe0 	cmlt	v0\.4h, v31\.4h, #0
 *[0-9a-f]+:	0ea0a800 	cmlt	v0\.2s, v0\.2s, #0
 *[0-9a-f]+:	0ea0a81f 	cmlt	v31\.2s, v0\.2s, #0
 *[0-9a-f]+:	0ea0abe0 	cmlt	v0\.2s, v31\.2s, #0
 *[0-9a-f]+:	4e20a800 	cmlt	v0\.16b, v0\.16b, #0
 *[0-9a-f]+:	4e20a81f 	cmlt	v31\.16b, v0\.16b, #0
 *[0-9a-f]+:	4e20abe0 	cmlt	v0\.16b, v31\.16b, #0
 *[0-9a-f]+:	4e60a800 	cmlt	v0\.8h, v0\.8h, #0
 *[0-9a-f]+:	4e60a81f 	cmlt	v31\.8h, v0\.8h, #0
 *[0-9a-f]+:	4e60abe0 	cmlt	v0\.8h, v31\.8h, #0
 *[0-9a-f]+:	4ea0a800 	cmlt	v0\.4s, v0\.4s, #0
 *[0-9a-f]+:	4ea0a81f 	cmlt	v31\.4s, v0\.4s, #0
 *[0-9a-f]+:	4ea0abe0 	cmlt	v0\.4s, v31\.4s, #0
 *[0-9a-f]+:	4ee0a800 	cmlt	v0\.2d, v0\.2d, #0
 *[0-9a-f]+:	4ee0a81f 	cmlt	v31\.2d, v0\.2d, #0
 *[0-9a-f]+:	4ee0abe0 	cmlt	v0\.2d, v31\.2d, #0
 *[0-9a-f]+:	0e20b800 	abs	v0\.8b, v0\.8b
 *[0-9a-f]+:	0e20b81f 	abs	v31\.8b, v0\.8b
 *[0-9a-f]+:	0e20bbe0 	abs	v0\.8b, v31\.8b
 *[0-9a-f]+:	0e60b800 	abs	v0\.4h, v0\.4h
 *[0-9a-f]+:	0e60b81f 	abs	v31\.4h, v0\.4h
 *[0-9a-f]+:	0e60bbe0 	abs	v0\.4h, v31\.4h
 *[0-9a-f]+:	0ea0b800 	abs	v0\.2s, v0\.2s
 *[0-9a-f]+:	0ea0b81f 	abs	v31\.2s, v0\.2s
 *[0-9a-f]+:	0ea0bbe0 	abs	v0\.2s, v31\.2s
 *[0-9a-f]+:	4e20b800 	abs	v0\.16b, v0\.16b
 *[0-9a-f]+:	4e20b81f 	abs	v31\.16b, v0\.16b
 *[0-9a-f]+:	4e20bbe0 	abs	v0\.16b, v31\.16b
 *[0-9a-f]+:	4e60b800 	abs	v0\.8h, v0\.8h
 *[0-9a-f]+:	4e60b81f 	abs	v31\.8h, v0\.8h
 *[0-9a-f]+:	4e60bbe0 	abs	v0\.8h, v31\.8h
 *[0-9a-f]+:	4ea0b800 	abs	v0\.4s, v0\.4s
 *[0-9a-f]+:	4ea0b81f 	abs	v31\.4s, v0\.4s
 *[0-9a-f]+:	4ea0bbe0 	abs	v0\.4s, v31\.4s
 *[0-9a-f]+:	4ee0b800 	abs	v0\.2d, v0\.2d
 *[0-9a-f]+:	4ee0b81f 	abs	v31\.2d, v0\.2d
 *[0-9a-f]+:	4ee0bbe0 	abs	v0\.2d, v31\.2d
 *[0-9a-f]+:	2e200800 	rev32	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20081f 	rev32	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e200be0 	rev32	v0\.8b, v31\.8b
 *[0-9a-f]+:	2e600800 	rev32	v0\.4h, v0\.4h
 *[0-9a-f]+:	2e60081f 	rev32	v31\.4h, v0\.4h
 *[0-9a-f]+:	2e600be0 	rev32	v0\.4h, v31\.4h
 *[0-9a-f]+:	6e200800 	rev32	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20081f 	rev32	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e200be0 	rev32	v0\.16b, v31\.16b
 *[0-9a-f]+:	6e600800 	rev32	v0\.8h, v0\.8h
 *[0-9a-f]+:	6e60081f 	rev32	v31\.8h, v0\.8h
 *[0-9a-f]+:	6e600be0 	rev32	v0\.8h, v31\.8h
 *[0-9a-f]+:	2e202800 	uaddlp	v0\.4h, v0\.8b
 *[0-9a-f]+:	2e20281f 	uaddlp	v31\.4h, v0\.8b
 *[0-9a-f]+:	2e202be0 	uaddlp	v0\.4h, v31\.8b
 *[0-9a-f]+:	2e602800 	uaddlp	v0\.2s, v0\.4h
 *[0-9a-f]+:	2e60281f 	uaddlp	v31\.2s, v0\.4h
 *[0-9a-f]+:	2e602be0 	uaddlp	v0\.2s, v31\.4h
 *[0-9a-f]+:	2ea02800 	uaddlp	v0\.1d, v0\.2s
 *[0-9a-f]+:	2ea0281f 	uaddlp	v31\.1d, v0\.2s
 *[0-9a-f]+:	2ea02be0 	uaddlp	v0\.1d, v31\.2s
 *[0-9a-f]+:	6e202800 	uaddlp	v0\.8h, v0\.16b
 *[0-9a-f]+:	6e20281f 	uaddlp	v31\.8h, v0\.16b
 *[0-9a-f]+:	6e202be0 	uaddlp	v0\.8h, v31\.16b
 *[0-9a-f]+:	6e602800 	uaddlp	v0\.4s, v0\.8h
 *[0-9a-f]+:	6e60281f 	uaddlp	v31\.4s, v0\.8h
 *[0-9a-f]+:	6e602be0 	uaddlp	v0\.4s, v31\.8h
 *[0-9a-f]+:	6ea02800 	uaddlp	v0\.2d, v0\.4s
 *[0-9a-f]+:	6ea0281f 	uaddlp	v31\.2d, v0\.4s
 *[0-9a-f]+:	6ea02be0 	uaddlp	v0\.2d, v31\.4s
 *[0-9a-f]+:	2e203800 	usqadd	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20381f 	usqadd	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e203be0 	usqadd	v0\.8b, v31\.8b
 *[0-9a-f]+:	2e603800 	usqadd	v0\.4h, v0\.4h
 *[0-9a-f]+:	2e60381f 	usqadd	v31\.4h, v0\.4h
 *[0-9a-f]+:	2e603be0 	usqadd	v0\.4h, v31\.4h
 *[0-9a-f]+:	2ea03800 	usqadd	v0\.2s, v0\.2s
 *[0-9a-f]+:	2ea0381f 	usqadd	v31\.2s, v0\.2s
 *[0-9a-f]+:	2ea03be0 	usqadd	v0\.2s, v31\.2s
 *[0-9a-f]+:	6e203800 	usqadd	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20381f 	usqadd	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e203be0 	usqadd	v0\.16b, v31\.16b
 *[0-9a-f]+:	6e603800 	usqadd	v0\.8h, v0\.8h
 *[0-9a-f]+:	6e60381f 	usqadd	v31\.8h, v0\.8h
 *[0-9a-f]+:	6e603be0 	usqadd	v0\.8h, v31\.8h
 *[0-9a-f]+:	6ea03800 	usqadd	v0\.4s, v0\.4s
 *[0-9a-f]+:	6ea0381f 	usqadd	v31\.4s, v0\.4s
 *[0-9a-f]+:	6ea03be0 	usqadd	v0\.4s, v31\.4s
 *[0-9a-f]+:	6ee03800 	usqadd	v0\.2d, v0\.2d
 *[0-9a-f]+:	6ee0381f 	usqadd	v31\.2d, v0\.2d
 *[0-9a-f]+:	6ee03be0 	usqadd	v0\.2d, v31\.2d
 *[0-9a-f]+:	2e204800 	clz	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20481f 	clz	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e204be0 	clz	v0\.8b, v31\.8b
 *[0-9a-f]+:	2e604800 	clz	v0\.4h, v0\.4h
 *[0-9a-f]+:	2e60481f 	clz	v31\.4h, v0\.4h
 *[0-9a-f]+:	2e604be0 	clz	v0\.4h, v31\.4h
 *[0-9a-f]+:	2ea04800 	clz	v0\.2s, v0\.2s
 *[0-9a-f]+:	2ea0481f 	clz	v31\.2s, v0\.2s
 *[0-9a-f]+:	2ea04be0 	clz	v0\.2s, v31\.2s
 *[0-9a-f]+:	6e204800 	clz	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20481f 	clz	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e204be0 	clz	v0\.16b, v31\.16b
 *[0-9a-f]+:	6e604800 	clz	v0\.8h, v0\.8h
 *[0-9a-f]+:	6e60481f 	clz	v31\.8h, v0\.8h
 *[0-9a-f]+:	6e604be0 	clz	v0\.8h, v31\.8h
 *[0-9a-f]+:	6ea04800 	clz	v0\.4s, v0\.4s
 *[0-9a-f]+:	6ea0481f 	clz	v31\.4s, v0\.4s
 *[0-9a-f]+:	6ea04be0 	clz	v0\.4s, v31\.4s
 *[0-9a-f]+:	2e205800 	mvn	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20581f 	mvn	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e205be0 	mvn	v0\.8b, v31\.8b
 *[0-9a-f]+:	6e205800 	mvn	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20581f 	mvn	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e205be0 	mvn	v0\.16b, v31\.16b
 *[0-9a-f]+:	2e205800 	mvn	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20581f 	mvn	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e205be0 	mvn	v0\.8b, v31\.8b
 *[0-9a-f]+:	6e205800 	mvn	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20581f 	mvn	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e205be0 	mvn	v0\.16b, v31\.16b
 *[0-9a-f]+:	2e605800 	rbit	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e60581f 	rbit	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e605be0 	rbit	v0\.8b, v31\.8b
 *[0-9a-f]+:	6e605800 	rbit	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e60581f 	rbit	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e605be0 	rbit	v0\.16b, v31\.16b
 *[0-9a-f]+:	2e206800 	uadalp	v0\.4h, v0\.8b
 *[0-9a-f]+:	2e20681f 	uadalp	v31\.4h, v0\.8b
 *[0-9a-f]+:	2e206be0 	uadalp	v0\.4h, v31\.8b
 *[0-9a-f]+:	2e606800 	uadalp	v0\.2s, v0\.4h
 *[0-9a-f]+:	2e60681f 	uadalp	v31\.2s, v0\.4h
 *[0-9a-f]+:	2e606be0 	uadalp	v0\.2s, v31\.4h
 *[0-9a-f]+:	2ea06800 	uadalp	v0\.1d, v0\.2s
 *[0-9a-f]+:	2ea0681f 	uadalp	v31\.1d, v0\.2s
 *[0-9a-f]+:	2ea06be0 	uadalp	v0\.1d, v31\.2s
 *[0-9a-f]+:	6e206800 	uadalp	v0\.8h, v0\.16b
 *[0-9a-f]+:	6e20681f 	uadalp	v31\.8h, v0\.16b
 *[0-9a-f]+:	6e206be0 	uadalp	v0\.8h, v31\.16b
 *[0-9a-f]+:	6e606800 	uadalp	v0\.4s, v0\.8h
 *[0-9a-f]+:	6e60681f 	uadalp	v31\.4s, v0\.8h
 *[0-9a-f]+:	6e606be0 	uadalp	v0\.4s, v31\.8h
 *[0-9a-f]+:	6ea06800 	uadalp	v0\.2d, v0\.4s
 *[0-9a-f]+:	6ea0681f 	uadalp	v31\.2d, v0\.4s
 *[0-9a-f]+:	6ea06be0 	uadalp	v0\.2d, v31\.4s
 *[0-9a-f]+:	2e207800 	sqneg	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20781f 	sqneg	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e207be0 	sqneg	v0\.8b, v31\.8b
 *[0-9a-f]+:	2e607800 	sqneg	v0\.4h, v0\.4h
 *[0-9a-f]+:	2e60781f 	sqneg	v31\.4h, v0\.4h
 *[0-9a-f]+:	2e607be0 	sqneg	v0\.4h, v31\.4h
 *[0-9a-f]+:	2ea07800 	sqneg	v0\.2s, v0\.2s
 *[0-9a-f]+:	2ea0781f 	sqneg	v31\.2s, v0\.2s
 *[0-9a-f]+:	2ea07be0 	sqneg	v0\.2s, v31\.2s
 *[0-9a-f]+:	6e207800 	sqneg	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20781f 	sqneg	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e207be0 	sqneg	v0\.16b, v31\.16b
 *[0-9a-f]+:	6e607800 	sqneg	v0\.8h, v0\.8h
 *[0-9a-f]+:	6e60781f 	sqneg	v31\.8h, v0\.8h
 *[0-9a-f]+:	6e607be0 	sqneg	v0\.8h, v31\.8h
 *[0-9a-f]+:	6ea07800 	sqneg	v0\.4s, v0\.4s
 *[0-9a-f]+:	6ea0781f 	sqneg	v31\.4s, v0\.4s
 *[0-9a-f]+:	6ea07be0 	sqneg	v0\.4s, v31\.4s
 *[0-9a-f]+:	6ee07800 	sqneg	v0\.2d, v0\.2d
 *[0-9a-f]+:	6ee0781f 	sqneg	v31\.2d, v0\.2d
 *[0-9a-f]+:	6ee07be0 	sqneg	v0\.2d, v31\.2d
 *[0-9a-f]+:	2e208800 	cmge	v0\.8b, v0\.8b, #0
 *[0-9a-f]+:	2e20881f 	cmge	v31\.8b, v0\.8b, #0
 *[0-9a-f]+:	2e208be0 	cmge	v0\.8b, v31\.8b, #0
 *[0-9a-f]+:	2e608800 	cmge	v0\.4h, v0\.4h, #0
 *[0-9a-f]+:	2e60881f 	cmge	v31\.4h, v0\.4h, #0
 *[0-9a-f]+:	2e608be0 	cmge	v0\.4h, v31\.4h, #0
 *[0-9a-f]+:	2ea08800 	cmge	v0\.2s, v0\.2s, #0
 *[0-9a-f]+:	2ea0881f 	cmge	v31\.2s, v0\.2s, #0
 *[0-9a-f]+:	2ea08be0 	cmge	v0\.2s, v31\.2s, #0
 *[0-9a-f]+:	6e208800 	cmge	v0\.16b, v0\.16b, #0
 *[0-9a-f]+:	6e20881f 	cmge	v31\.16b, v0\.16b, #0
 *[0-9a-f]+:	6e208be0 	cmge	v0\.16b, v31\.16b, #0
 *[0-9a-f]+:	6e608800 	cmge	v0\.8h, v0\.8h, #0
 *[0-9a-f]+:	6e60881f 	cmge	v31\.8h, v0\.8h, #0
 *[0-9a-f]+:	6e608be0 	cmge	v0\.8h, v31\.8h, #0
 *[0-9a-f]+:	6ea08800 	cmge	v0\.4s, v0\.4s, #0
 *[0-9a-f]+:	6ea0881f 	cmge	v31\.4s, v0\.4s, #0
 *[0-9a-f]+:	6ea08be0 	cmge	v0\.4s, v31\.4s, #0
 *[0-9a-f]+:	6ee08800 	cmge	v0\.2d, v0\.2d, #0
 *[0-9a-f]+:	6ee0881f 	cmge	v31\.2d, v0\.2d, #0
 *[0-9a-f]+:	6ee08be0 	cmge	v0\.2d, v31\.2d, #0
 *[0-9a-f]+:	2e209800 	cmle	v0\.8b, v0\.8b, #0
 *[0-9a-f]+:	2e20981f 	cmle	v31\.8b, v0\.8b, #0
 *[0-9a-f]+:	2e209be0 	cmle	v0\.8b, v31\.8b, #0
 *[0-9a-f]+:	2e609800 	cmle	v0\.4h, v0\.4h, #0
 *[0-9a-f]+:	2e60981f 	cmle	v31\.4h, v0\.4h, #0
 *[0-9a-f]+:	2e609be0 	cmle	v0\.4h, v31\.4h, #0
 *[0-9a-f]+:	2ea09800 	cmle	v0\.2s, v0\.2s, #0
 *[0-9a-f]+:	2ea0981f 	cmle	v31\.2s, v0\.2s, #0
 *[0-9a-f]+:	2ea09be0 	cmle	v0\.2s, v31\.2s, #0
 *[0-9a-f]+:	6e209800 	cmle	v0\.16b, v0\.16b, #0
 *[0-9a-f]+:	6e20981f 	cmle	v31\.16b, v0\.16b, #0
 *[0-9a-f]+:	6e209be0 	cmle	v0\.16b, v31\.16b, #0
 *[0-9a-f]+:	6e609800 	cmle	v0\.8h, v0\.8h, #0
 *[0-9a-f]+:	6e60981f 	cmle	v31\.8h, v0\.8h, #0
 *[0-9a-f]+:	6e609be0 	cmle	v0\.8h, v31\.8h, #0
 *[0-9a-f]+:	6ea09800 	cmle	v0\.4s, v0\.4s, #0
 *[0-9a-f]+:	6ea0981f 	cmle	v31\.4s, v0\.4s, #0
 *[0-9a-f]+:	6ea09be0 	cmle	v0\.4s, v31\.4s, #0
 *[0-9a-f]+:	6ee09800 	cmle	v0\.2d, v0\.2d, #0
 *[0-9a-f]+:	6ee0981f 	cmle	v31\.2d, v0\.2d, #0
 *[0-9a-f]+:	6ee09be0 	cmle	v0\.2d, v31\.2d, #0
 *[0-9a-f]+:	2e20b800 	neg	v0\.8b, v0\.8b
 *[0-9a-f]+:	2e20b81f 	neg	v31\.8b, v0\.8b
 *[0-9a-f]+:	2e20bbe0 	neg	v0\.8b, v31\.8b
 *[0-9a-f]+:	2e60b800 	neg	v0\.4h, v0\.4h
 *[0-9a-f]+:	2e60b81f 	neg	v31\.4h, v0\.4h
 *[0-9a-f]+:	2e60bbe0 	neg	v0\.4h, v31\.4h
 *[0-9a-f]+:	2ea0b800 	neg	v0\.2s, v0\.2s
 *[0-9a-f]+:	2ea0b81f 	neg	v31\.2s, v0\.2s
 *[0-9a-f]+:	2ea0bbe0 	neg	v0\.2s, v31\.2s
 *[0-9a-f]+:	6e20b800 	neg	v0\.16b, v0\.16b
 *[0-9a-f]+:	6e20b81f 	neg	v31\.16b, v0\.16b
 *[0-9a-f]+:	6e20bbe0 	neg	v0\.16b, v31\.16b
 *[0-9a-f]+:	6e60b800 	neg	v0\.8h, v0\.8h
 *[0-9a-f]+:	6e60b81f 	neg	v31\.8h, v0\.8h
 *[0-9a-f]+:	6e60bbe0 	neg	v0\.8h, v31\.8h
 *[0-9a-f]+:	6ea0b800 	neg	v0\.4s, v0\.4s
 *[0-9a-f]+:	6ea0b81f 	neg	v31\.4s, v0\.4s
 *[0-9a-f]+:	6ea0bbe0 	neg	v0\.4s, v31\.4s
 *[0-9a-f]+:	6ee0b800 	neg	v0\.2d, v0\.2d
 *[0-9a-f]+:	6ee0b81f 	neg	v31\.2d, v0\.2d
 *[0-9a-f]+:	6ee0bbe0 	neg	v0\.2d, v31\.2d
