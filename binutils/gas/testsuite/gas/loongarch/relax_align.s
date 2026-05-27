# Range of max: 0<= max <= 0xffffffff
  .text
.L1:
  ret
  .align 4
  ret
  .align 4, , 0
  ret
  .align 4, , 1
  ret
  .align 4, , 11
  ret
  .align 4, , 12
  ret
  .align 4, , 0xffffffff
  ret
# ignore out of range alignment maxumum
  .align 4, , -1
  ret
  .align 4, , -0x80000000
  ret
