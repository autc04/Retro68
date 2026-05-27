#as: -march=armv8-a+sve2+sve-bitperm
#as: -march=armv8-a+ssve-bitperm
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	4500b400 	bdep	z0\.b, z0\.b, z0\.b
 *[0-9a-f]+:	4500b41f 	bdep	z31\.b, z0\.b, z0\.b
 *[0-9a-f]+:	4500b7e0 	bdep	z0\.b, z31\.b, z0\.b
 *[0-9a-f]+:	451fb400 	bdep	z0\.b, z0\.b, z31\.b
 *[0-9a-f]+:	4540b400 	bdep	z0\.h, z0\.h, z0\.h
 *[0-9a-f]+:	4540b41f 	bdep	z31\.h, z0\.h, z0\.h
 *[0-9a-f]+:	4540b7e0 	bdep	z0\.h, z31\.h, z0\.h
 *[0-9a-f]+:	455fb400 	bdep	z0\.h, z0\.h, z31\.h
 *[0-9a-f]+:	4580b400 	bdep	z0\.s, z0\.s, z0\.s
 *[0-9a-f]+:	4580b41f 	bdep	z31\.s, z0\.s, z0\.s
 *[0-9a-f]+:	4580b7e0 	bdep	z0\.s, z31\.s, z0\.s
 *[0-9a-f]+:	459fb400 	bdep	z0\.s, z0\.s, z31\.s
 *[0-9a-f]+:	45c0b400 	bdep	z0\.d, z0\.d, z0\.d
 *[0-9a-f]+:	45c0b41f 	bdep	z31\.d, z0\.d, z0\.d
 *[0-9a-f]+:	45c0b7e0 	bdep	z0\.d, z31\.d, z0\.d
 *[0-9a-f]+:	45dfb400 	bdep	z0\.d, z0\.d, z31\.d
 *[0-9a-f]+:	4500b000 	bext	z0\.b, z0\.b, z0\.b
 *[0-9a-f]+:	4500b01f 	bext	z31\.b, z0\.b, z0\.b
 *[0-9a-f]+:	4500b3e0 	bext	z0\.b, z31\.b, z0\.b
 *[0-9a-f]+:	451fb000 	bext	z0\.b, z0\.b, z31\.b
 *[0-9a-f]+:	4540b000 	bext	z0\.h, z0\.h, z0\.h
 *[0-9a-f]+:	4540b01f 	bext	z31\.h, z0\.h, z0\.h
 *[0-9a-f]+:	4540b3e0 	bext	z0\.h, z31\.h, z0\.h
 *[0-9a-f]+:	455fb000 	bext	z0\.h, z0\.h, z31\.h
 *[0-9a-f]+:	4580b000 	bext	z0\.s, z0\.s, z0\.s
 *[0-9a-f]+:	4580b01f 	bext	z31\.s, z0\.s, z0\.s
 *[0-9a-f]+:	4580b3e0 	bext	z0\.s, z31\.s, z0\.s
 *[0-9a-f]+:	459fb000 	bext	z0\.s, z0\.s, z31\.s
 *[0-9a-f]+:	45c0b000 	bext	z0\.d, z0\.d, z0\.d
 *[0-9a-f]+:	45c0b01f 	bext	z31\.d, z0\.d, z0\.d
 *[0-9a-f]+:	45c0b3e0 	bext	z0\.d, z31\.d, z0\.d
 *[0-9a-f]+:	45dfb000 	bext	z0\.d, z0\.d, z31\.d
 *[0-9a-f]+:	4500b800 	bgrp	z0\.b, z0\.b, z0\.b
 *[0-9a-f]+:	4500b81f 	bgrp	z31\.b, z0\.b, z0\.b
 *[0-9a-f]+:	4500bbe0 	bgrp	z0\.b, z31\.b, z0\.b
 *[0-9a-f]+:	451fb800 	bgrp	z0\.b, z0\.b, z31\.b
 *[0-9a-f]+:	4540b800 	bgrp	z0\.h, z0\.h, z0\.h
 *[0-9a-f]+:	4540b81f 	bgrp	z31\.h, z0\.h, z0\.h
 *[0-9a-f]+:	4540bbe0 	bgrp	z0\.h, z31\.h, z0\.h
 *[0-9a-f]+:	455fb800 	bgrp	z0\.h, z0\.h, z31\.h
 *[0-9a-f]+:	4580b800 	bgrp	z0\.s, z0\.s, z0\.s
 *[0-9a-f]+:	4580b81f 	bgrp	z31\.s, z0\.s, z0\.s
 *[0-9a-f]+:	4580bbe0 	bgrp	z0\.s, z31\.s, z0\.s
 *[0-9a-f]+:	459fb800 	bgrp	z0\.s, z0\.s, z31\.s
 *[0-9a-f]+:	45c0b800 	bgrp	z0\.d, z0\.d, z0\.d
 *[0-9a-f]+:	45c0b81f 	bgrp	z31\.d, z0\.d, z0\.d
 *[0-9a-f]+:	45c0bbe0 	bgrp	z0\.d, z31\.d, z0\.d
 *[0-9a-f]+:	45dfb800 	bgrp	z0\.d, z0\.d, z31\.d
