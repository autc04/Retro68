#name: PE-COFF Long section names in objects (default)
#ld:  -r
#objdump: -h
#source: longsecn.s

.*:     file format .*

Sections:
Idx Name          Size      VMA +LMA +File off  Algn
#...
 *[0-9]+ \.text\.very\.long\.section\.name [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
 *[0-9]+ \.data\$1       [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.rodata\$1     [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.data\$123     [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.rodata\$123   [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.data\$123456789 [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.rodata\$123456789 [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.data\.very\.long\.section [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.rodata\.very\.long\.section [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.data\.very\.long\.section\$1 [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.rodata\.very\.long\.section\$1 [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.data\.very\.long\.section\$1234 [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
 *[0-9]+ \.rodata\.very\.long\.section\$1234 [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  [0-9a-fA-F]+  2\*\*[0-9]
                  CONTENTS, ALLOC, LOAD, DATA
#...
