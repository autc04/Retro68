#objdump: -s -j .data
# tic30 and tic4x have 4 octets per byte, tic54x has 2 octets per byte
#notarget: tic30-*-* tic4x-*-* tic54x-*-*
#xfail: tic6x-*-*

.*: .*

Contents of section .data:
 0000 10111213 14150000 00000000 00000000 .*
