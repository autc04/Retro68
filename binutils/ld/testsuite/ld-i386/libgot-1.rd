Relocation section '\.rel\.dyn' .* contains 1 entry:
.*
.* R_386_GLOB_DAT +0+ +foo

Relocation section '\.rel\.plt' .* contains 1 entry:
.*
.* R_386_JUMP_SLOT +0+ +bar

Global Offset Table '\.got' contains 1 entry:
.*
.* R_386_GLOB_DAT +foo \+ 0

Global Offset Table '\.got\.plt' contains 4 entries:
.*
.* +[^0][0-9a-f]+
.* +0
.* +0
.* R_386_JUMP_SLOT +bar \+ [0-9a-f]+
