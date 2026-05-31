#objdump: -s -j .data
#name: octa bignum

.*: +file format .*

Contents of section .data:
 [^ ]* (ffff3344 55667788 99aabbcc ddeeffff|ffffeedd ccbbaa99 88776655 4433ffff) .*
 [^ ]* (00003444 55667788 99aabbcc ddeeffff|ffffeedd ccbbaa99 88776655 44340000) .*
 [^ ]* (00000080 00000000 00000000 00000000|00000000 00000000 00000000 80000000) .*
 [^ ]* (ffffffff 00000000 00000000 00000000|00000000 00000000 00000000 ffffffff) .*
 [^ ]* (00000080 ffffffff ffffffff ffffffff|ffffffff ffffffff ffffffff 80000000) .*
 [^ ]* (01000000 ffffffff ffffffff ffffffff|ffffffff ffffffff ffffffff 00000001) .*
 [^ ]* (ffffff7f ffffffff ffffffff ffffffff|ffffffff ffffffff ffffffff 7fffffff) .*
 [^ ]* (00000000 ffffffff ffffffff ffffffff|ffffffff ffffffff ffffffff 00000000) .*
 [^ ]* (00000080 ffffffff ffffffff ffffffff|ffffffff ffffffff ffffffff 80000000) .*
 [^ ]* (01000000 ffffffff ffffffff ffffffff|ffffffff ffffffff ffffffff 00000001) .*
 [^ ]* (00000000 000000f0 ffffffff ffffffff|ffffffff ffffffff f0000000 00000000) .*
 [^ ]* (00000000 00000010 00000000 00000000|00000000 00000000 10000000 00000000) .*
 [^ ]* (ffffffff ffffffef ffffffff ffffffff|ffffffff ffffffff efffffff ffffffff) .*
 [^ ]* (01000000 00000010 00000000 00000000|00000000 00000000 10000000 00000001) .*
 [^ ]* (01000000 000000f0 ffffffff ffffffff|ffffffff ffffffff f0000000 00000001) .*
 [^ ]* (feffffff ffffff0f 00000000 00000000|00000000 00000000 0fffffff fffffffe) .*
 [^ ]* (02000000 000000f0 ffffffff ffffffff|ffffffff ffffffff f0000000 00000002) .*
 [^ ]* (fdffffff ffffff0f 00000000 00000000|00000000 00000000 0fffffff fffffffd) .*
