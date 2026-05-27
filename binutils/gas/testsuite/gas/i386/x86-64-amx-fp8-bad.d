#objdump: -drw
#name: x86_64 AMX_FP8 bad insns

.*: +file format .*


Disassembly of section \.text:

0+ <\.text>:
\s*[a-f0-9]+:\s*c4 e5 70 fd d1\s+tdpbf8ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e5 68 fd c9\s+tdpbf8ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 70 fd ca\s+tdpbf8ps %tmm1/\(bad\),%tmm2,%tmm1\/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 73 fd d1\s+tdpbhf8ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e5 6b fd c9\s+tdpbhf8ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 73 fd ca\s+tdpbhf8ps %tmm1/\(bad\),%tmm2,%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 72 fd d1\s+tdphbf8ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e5 6a fd c9\s+tdphbf8ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 72 fd ca\s+tdphbf8ps %tmm1/\(bad\),%tmm2,%tmm1\/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 71 fd d1\s+tdphf8ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e5 69 fd c9\s+tdphf8ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e5 71 fd ca\s+tdphf8ps %tmm1/\(bad\),%tmm2,%tmm1/\(bad\)
#pass
