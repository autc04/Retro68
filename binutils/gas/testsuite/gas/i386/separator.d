#objdump: -dw
#name: whitespace around special separators

.*: +file format .*

Disassembly of section \.text:

0+ <separators>:
[ 	]*[a-f0-9]+:	3e 72 fd +	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 72 fd +	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 72 fd +	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 72 fd +	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 72 fd +	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 0f 82 f9 ff ff ff 	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 0f 82 f9 ff ff ff 	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 0f 82 f9 ff ff ff 	j[cb],pt .*
[ 	]*[a-f0-9]+:	3e 0f 82 f9 ff ff ff 	j[cb],pt .*
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
[ 	]*[a-f0-9]+:	65 f7 d8 +	gs neg %eax
#pass
