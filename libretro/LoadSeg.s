.text
.globl PATCHEDLOADSEG

PATCHEDLOADSEG:

# Stack on Entry:
#   (arguments for function)
#   (return address)
#   (return address from trap (== address in jt entry))
    movem.l  %a0-%a1/%d0-%d2, -(%sp)
    subq #4, %sp
    move.l 24(%sp), -(%sp)
    
# Stack now:
#   (arguments for function)
#   (return address)
#   (don't care anymore -- address in jt entry)
#   (saved registers)
#   (4 bytes of space for return value)
#   (address in jt entry)

    jsr RETRO68LOADSEGMENT

# Stack now:
#   (arguments for function)
#   (return address)
#   (don't care -- address in jt entry)
#   (saved registers)
#   (address of loaded function)

    move.l (%sp)+, 20(%sp)
    movem.l (%sp)+, %a0-%a1/%d0-%d2

# Stack now:
#   (arguments for function)
#   (return address)
#   (address of loaded function)

    rts
