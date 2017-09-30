.text
.globl PATCHEDLOADSEG

PATCHEDLOADSEG:

# Stack on Entry:
#   (arguments for function)
#   (return address)
#   (return address from trap (== address in jt entry))
    movel %sp@, %sp@-
    
# Stack now:
#   (arguments for function)
#   (return address)
#   (don't care)
#   (return address from trap (== address in jt entry))

    jsr RETRO68LOADSEGMENT

# Stack now:
#   (arguments for function)
#   (return address)
#   (address of loaded function)

    rts
