Relocation section '\.rela\.dyn' .* contains 1 entry:
.*
.* R_X86_64_GLOB_DAT +0+ foo \+ 0

Relocation section '\.rela\.plt' .* contains 1 entry:
.*
.* R_X86_64_JUMP_SLOT +0+ bar \+ 0

Global Offset Table '\.got' contains 1 entry:
.*
.* R_X86_64_GLOB_DAT +foo \+ 0

Global Offset Table '\.got\.plt' contains 4 entries:
.*
.* [^0][0-9a-f]+
.* 0
.* 0
.* R_X86_64_JUMP_SLOT +bar \+ 0
