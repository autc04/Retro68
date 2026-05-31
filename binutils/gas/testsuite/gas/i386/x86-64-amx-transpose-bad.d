#objdump: -drw
#name: x86_64 AMX_TRANSPOSE bad insns

.*: +file format .*


Disassembly of section \.text:

0+ <\.text>:
\s*[a-f0-9]+:\s*c4 e2 72 6c d1\s+ttdpbf16ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e2 6a 6c c9\s+ttdpbf16ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e2 72 6c ca\s+ttdpbf16ps %tmm1/\(bad\),%tmm2,%tmm1\/\(bad\)
\s*[a-f0-9]+:\s*c4 e2 73 6c d1\s+ttdpfp16ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e2 6b 6c c9\s+ttdpfp16ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e2 73 6c ca\s+ttdpfp16ps %tmm1/\(bad\),%tmm2,%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e2 70 48 d1\s+ttmmultf32ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e2 68 48 c9\s+ttmmultf32ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e2 70 48 ca\s+ttmmultf32ps %tmm1/\(bad\),%tmm2,%tmm1/\(bad\)
#pass

