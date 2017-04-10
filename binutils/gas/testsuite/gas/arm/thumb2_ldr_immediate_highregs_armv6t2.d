# name: Ldr small immediate high registers on armv6t2
# as: -march=armv6t2
# objdump: -dr --prefix-addresses --show-raw-insn
# not-target: *-*-*coff *-*-pe *-*-wince *-*-*aout* *-*-netbsd *-*-riscix*

.*: +file format .*arm.*

Disassembly of section \.text:
0[0-9a-f]+ <[^>]+> 2000[[:space:]]+movs[[:space:]]+r0, #0.*
0[0-9a-f]+ <[^>]+> 2108[[:space:]]+movs[[:space:]]+r1, #8.*
0[0-9a-f]+ <[^>]+> 2251[[:space:]]+movs[[:space:]]+r2, #81.*
0[0-9a-f]+ <[^>]+> 231f[[:space:]]+movs[[:space:]]+r3, #31.*
0[0-9a-f]+ <[^>]+> 242f[[:space:]]+movs[[:space:]]+r4, #47.*
0[0-9a-f]+ <[^>]+> 253f[[:space:]]+movs[[:space:]]+r5, #63.*
0[0-9a-f]+ <[^>]+> 2680[[:space:]]+movs[[:space:]]+r6, #128.*
0[0-9a-f]+ <[^>]+> 27ff[[:space:]]+movs[[:space:]]+r7, #255.*
0[0-9a-f]+ <[^>]+> f04f 0800[[:space:]]+mov\.w[[:space:]]+r8, #0.*
0[0-9a-f]+ <[^>]+> f04f 0908[[:space:]]+mov\.w[[:space:]]+r9, #8.*
0[0-9a-f]+ <[^>]+> f04f 0a51[[:space:]]+mov\.w[[:space:]]+sl, #81.*
0[0-9a-f]+ <[^>]+> f04f 0b1f[[:space:]]+mov\.w[[:space:]]+fp, #31.*
0[0-9a-f]+ <[^>]+> f04f 0c2f[[:space:]]+mov\.w[[:space:]]+ip, #47.*
0[0-9a-f]+ <[^>]+> f04f 0d3f[[:space:]]+mov\.w[[:space:]]+sp, #63.*
0[0-9a-f]+ <[^>]+> f04f 0e80[[:space:]]+mov\.w[[:space:]]+lr, #128.*
0[0-9a-f]+ <[^>]+> f04f 0fff[[:space:]]+mov\.w[[:space:]]+pc, #255.*
