.*: Assembler messages:
.*:5: Warning: operand 3 `%k1' implicitly denotes `%k0' to `%k1' group in `vp2intersectd'
.*:6: Warning: operand 3 `%k3' implicitly denotes `%k2' to `%k3' group in `vp2intersectd'
.*:7: Warning: operand 3 `%k5' implicitly denotes `%k4' to `%k5' group in `vp2intersectd'
.*:8: Warning: operand 3 `%k3' implicitly denotes `%k2' to `%k3' group in `vp2intersectq'
.*:9: Warning: operand 3 `%k5' implicitly denotes `%k4' to `%k5' group in `vp2intersectq'
.*:10: Warning: operand 3 `%k7' implicitly denotes `%k6' to `%k7' group in `vp2intersectq'

[ 	]*[0-9]+[ 	]+# Check warning for odd destination register numbers.
[ 	]*[0-9]+[ 	]*
[ 	]*[0-9]+[ 	]+\.text
[ 	]*[0-9]+[ 	]+_start:
[ 	]*[0-9]+ .... 62F26F08[ 	]+vp2intersectd \(%eax\), %xmm2, %k1
.*Warning: .*
[ 	]*[0-9]+[ 	]+6808
[ 	]*[0-9]+ .... 62F26F28[ 	]+vp2intersectd \(%eax\), %ymm2, %k3
.*Warning: .*
[ 	]*[0-9]+[ 	]+6818
[ 	]*[0-9]+ .... 62F26F48[ 	]+vp2intersectd \(%eax\), %zmm2, %k5
.*Warning: .*
[ 	]*[0-9]+[ 	]+6828
[ 	]*[0-9]+ .... 62F2EF08[ 	]+vp2intersectq \(%eax\), %xmm2, %k3
.*Warning: .*
[ 	]*[0-9]+[ 	]+6818
[ 	]*[0-9]+ .... 62F2EF28[ 	]+vp2intersectq \(%eax\), %ymm2, %k5
.*Warning: .*
[ 	]*[0-9]+[ 	]+6828
[ 	]*[0-9]+ .... 62F2EF48[ 	]+vp2intersectq \(%eax\), %zmm2, %k7
.*Warning: .*
[ 	]*[0-9]+[ 	]+6838
#pass
