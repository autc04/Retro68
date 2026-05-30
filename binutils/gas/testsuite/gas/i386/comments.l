.*: Assembler messages:
.*:6: Error: .*
.*:7: Error: .*
[ 	]*[0-9]+[ 	]+scrubber:
[ 	]*[0-9]+[ 	]+\.irp x,""
[ 	]*[0-9]+[ 	]*
[ 	]*[0-9]+[ 	]+/\*    \*/vaddps	%zmm0, %zmm1, %zmm2
[ 	]*[0-9]+[ 	]+vaddps/\*\*/%zmm0, %zmm1, %zmm2
[ 	]*[0-9]+[ 	]+vadd/\*\*/ps %zmm0, %zmm1, %zmm2
[ 	]*[0-9]+[ 	]+vaddps	%zmm/\*\*/0, %zmm1, %zmm2
[ 	]*[0-9]+[ 	]*
[ 	]*[0-9]+[ 	]+vaddps	%zmm0, %zmm1, %zmm2# ...
[ 	]*[0-9]+[ 	]+vaddps	%zmm0, %zmm1, %zmm2	# ...
[ 	]*[0-9]+[ 	]+vaddps	%zmm0, %zmm1, %zmm2/\*    \*/# ...
[ 	]*[0-9]+[ 	]*
[ 	]*[0-9]+[ 	]+\.endr
[ 	]*[0-9]+[ 	]+> +
[ 	]*[0-9]+ \?\?\?\? [0-9A-F]+[ 	]+>  vaddps %zmm0,%zmm1,%zmm2
#...
[ 	]*[0-9]+ \?\?\?\? [0-9A-F]+[ 	]+>  vaddps %zmm0,%zmm1,%zmm2
#...
[ 	]*[0-9]+[ 	]+>  vadd ps %zmm0,%zmm1,%zmm2
[ 	]*[0-9]+[ 	]+>  vaddps %zmm 0,%zmm1,%zmm2
[ 	]*[0-9]+[ 	]+> +
[ 	]*[0-9]+ \?\?\?\? [0-9A-F]+[ 	]+>  vaddps %zmm0,%zmm1,%zmm2
#...
[ 	]*[0-9]+ \?\?\?\? [0-9A-F]+[ 	]+>  vaddps %zmm0,%zmm1,%zmm2
#...
[ 	]*[0-9]+ \?\?\?\? [0-9A-F]+[ 	]+>  vaddps %zmm0,%zmm1,%zmm2
#pass
