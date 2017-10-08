#source: eh-frame-hdr.s
#ld: -e _start --eh-frame-hdr
#objdump: -hw
#target: cfi
#xfail: avr*-*-* or1k*-*-elf or1k*-*-rtems* pru-*-* visium-*-*
# These targets support CFI generation but not shared libraries.
#...
  [0-9] .eh_frame_hdr +0*[12][048c] .*
#pass
