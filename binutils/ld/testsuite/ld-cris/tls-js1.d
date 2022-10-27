#source: dsov32-1.s
#source: tls-ld-4.s
#source: dsov32-2.s
#source: expdyn1.s
#source: tls-hx.s
#source: dso-1.s
#as: --pic --no-underscore --em=criself --march=v32
#ld: --shared -m crislinux --hash-style=sysv
#readelf: -a

# DSO with a R_CRIS_16_DTPREL and a R_CRIS_32_PLT_PCREL.  The .got.plt
# byte index (a) and .rela.plt item index (b) are in sync as b=a/4-3
# *except* when there's a R_CRIS_DTPMOD, because while the relocated
# contents goes in .got.plt, the relocation goes in .rela.got, not
# .rela.plt.  And, it'd cover 8 bytes in .got.plt, not 4 bytes.
# Making sure .rela.plt has the right contents; no R_CRIS_NONE entries.

#...
  .* .got[ 	]+PROGBITS[ 	]+0+22f8 0+2f8 0+20 04  WA  0   0  4
#...
Relocation section '\.rela\.dyn' at offset 0x1bc contains 2 entries:
 Offset     Info    Type            Sym\.Value  Sym\. Name \+ Addend
00002304  0000001e R_CRIS_DTPMOD +0
00002314  0000050a R_CRIS_GLOB_DAT   00002318   expobj \+ 0

Relocation section '\.rela\.plt' at offset 0x1d4 contains 2 entries:
 Offset     Info    Type            Sym\.Value  Sym\. Name \+ Addend
0000230c  0000030b R_CRIS_JUMP_SLOT  00000246   dsofn4 \+ 0
00002310  0000090b R_CRIS_JUMP_SLOT  0000025e   dsofn \+ 0

The decoding of unwind sections for machine type Axis Communications 32-bit embedded processor is not currently supported.
#pass
