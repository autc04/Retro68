#as: -march=rv32if_xtheadvdot
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <test_int8_int4>:
[ 	]+[0-9a-f]+:[ 	]+8000600b[ 	]+th.vmaqa\.vv[ 	]+v0,v0,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+8200600b[ 	]+th.vmaqa\.vv[ 	]+v0,v0,v0
[ 	]+[0-9a-f]+:[ 	]+8211600b[ 	]+th.vmaqa\.vv[ 	]+v0,v2,v1
[ 	]+[0-9a-f]+:[ 	]+8400600b[ 	]+th.vmaqa\.vx[ 	]+v0,zero,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+8600600b[ 	]+th.vmaqa\.vx[ 	]+v0,zero,v0
[ 	]+[0-9a-f]+:[ 	]+8611600b[ 	]+th.vmaqa\.vx[ 	]+v0,sp,v1
[ 	]+[0-9a-f]+:[ 	]+8800600b[ 	]+th.vmaqau\.vv[ 	]+v0,v0,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+8a00600b[ 	]+th.vmaqau\.vv[ 	]+v0,v0,v0
[ 	]+[0-9a-f]+:[ 	]+8a11600b[ 	]+th.vmaqau\.vv[ 	]+v0,v2,v1
[ 	]+[0-9a-f]+:[ 	]+8c00600b[ 	]+th.vmaqau\.vx[ 	]+v0,zero,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+8e00600b[ 	]+th.vmaqau\.vx[ 	]+v0,zero,v0
[ 	]+[0-9a-f]+:[ 	]+8e11600b[ 	]+th.vmaqau\.vx[ 	]+v0,sp,v1
[ 	]+[0-9a-f]+:[ 	]+9000600b[ 	]+th.vmaqasu\.vv[ 	]+v0,v0,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+9200600b[ 	]+th.vmaqasu\.vv[ 	]+v0,v0,v0
[ 	]+[0-9a-f]+:[ 	]+9211600b[ 	]+th.vmaqasu\.vv[ 	]+v0,v2,v1
[ 	]+[0-9a-f]+:[ 	]+9400600b[ 	]+th.vmaqasu\.vx[ 	]+v0,zero,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+9600600b[ 	]+th.vmaqasu\.vx[ 	]+v0,zero,v0
[ 	]+[0-9a-f]+:[ 	]+9611600b[ 	]+th.vmaqasu\.vx[ 	]+v0,sp,v1
[ 	]+[0-9a-f]+:[ 	]+9c00600b[ 	]+th.vmaqaus\.vx[ 	]+v0,zero,v0,v0\.t
[ 	]+[0-9a-f]+:[ 	]+9e00600b[ 	]+th.vmaqaus\.vx[ 	]+v0,zero,v0
[ 	]+[0-9a-f]+:[ 	]+9e11600b[ 	]+th.vmaqaus\.vx[ 	]+v0,sp,v1
