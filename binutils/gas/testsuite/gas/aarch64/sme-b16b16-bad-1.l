.*: Assembler messages:
.*: Error: operand mismatch -- `bfadd za.s\[w8,0,vgx2\],{ ?z0.h-z1.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfadd za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}
.*: Error: too many registers in vector register list at operand 2 -- `bfadd za.h\[w13,0,vgx2\],{ ?z1.h-z0.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfadd za.h\[w8,11,vgx3\],{ ?z0.h-z1.h ?}'
.*: Error: too many registers in vector register list at operand 2 -- `bfadd za.h\[w8,0,vgx2\],{ ?z0.h-z4.h ?}'
.*: Error: operand mismatch -- `bfadd za.s\[w8,0,vgx4\],{ ?z0.h-z3.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfadd za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}
.*: Error: too many registers in vector register list at operand 2 -- `bfadd za.h\[w14,0,vgx4\],{ ?z10.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfadd za.h\[w8,15,vgx1\],{ ?z3.h-z2.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfadd za.h\[w8,0,vgx4\],{ ?z30.h-z31.h ?}'
.*: Error: operand mismatch -- `bfsub za.s\[w8,0,vgx2\],{ ?z0.h-z1.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfsub za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}
.*: Error: too many registers in vector register list at operand 2 -- `bfsub za.h\[w13,0,vgx2\],{ ?z1.h-z0.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfsub za.h\[w8,11,vgx3\],{ ?z0.h-z1.h ?}'
.*: Error: too many registers in vector register list at operand 2 -- `bfsub za.h\[w8,0,vgx2\],{ ?z0.h-z4.h ?}'
.*: Error: operand mismatch -- `bfsub za.s\[w8,0,vgx4\],{ ?z0.h-z3.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfsub za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}
.*: Error: too many registers in vector register list at operand 2 -- `bfsub za.h\[w14,0,vgx4\],{ ?z10.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfsub za.h\[w8,15,vgx1\],{ ?z3.h-z2.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfsub za.h\[w8,0,vgx4\],{ ?z30.h-z31.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w14,0,vgx3\],{ ?z10.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,15,vgx3\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.d\[w8,0,vgx3\],{ ?z30.h-z31.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z15.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z0.h\[7\]'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h ?},z0.h\[7\]'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h ?},z0.h'
.*: Error: missing type suffix at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0-z1},z0.h\[7\]'
.*: Error: missing type suffix at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0-z1}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.b\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w14,0,vgx1\],{ ?z10.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,15,vgx1\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx1\],{ ?z30.h-z31.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z15.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z0.h\[7\]'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h ?},z0.h\[7\]'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h ?},z0.h'
.*: Error: missing type suffix at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0-z1},z0.h\[7\]'
.*: Error: missing type suffix at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0-z1}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w14,0,vgx3\],{ ?z10.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,15,vgx3\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.d\[w8,0,vgx3\],{ ?z31.h-z0.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z15.h'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h ?},z15.h'
.*: Error: operand mismatch -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?},z15'
.*: Info:    did you mean this\?
.*: Info:    	bfmla za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*: Error: operand mismatch -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?},z20'
.*: Info:    did you mean this\?
.*: Info:    	bfmla za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z20.h
.*: Error: comma expected between operands at operand 3 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w14,0,vgx1\],{ ?z10.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,15,vgx1\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx1\],{ ?z31.h-z2.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.b\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z15.h'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h ?},z15.h'
.*: Error: operand mismatch -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?},z15'
.*: Info:    did you mean this\?
.*: Info:    	bfmla za.h\[w8, 0, vgx4\], { ?z0.h-z1.h ?}, z15.h
.*: Error: operand mismatch -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?},z20'
.*: Info:    did you mean this\?
.*: Info:    	bfmla za.h\[w8, 0, vgx4\], { ?z0.h-z1.h ?}, z20.h
.*: Error: comma expected between operands at operand 3 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w8,0,vgx3\],{ ?z0.h-z1.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w14,0,vgx3\],{ ?z10.h-z1.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.d\[w8,15,vgx3\],{ ?z0.h-z1.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx3\],{ ?z30.h-z31.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.b\[w8,0,vgx3\],{ ?z0.h-z1.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 2 registers at operand 3 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmla za.h\[w8,0,vgx2\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: operand mismatch -- `bfmla za.b\[w8,20,vgx2\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfmla za.h\[w8, 20, vgx2\], { ?z0.h ?}, { ?z30.h ?}
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w8,0,vgx1\],{ ?z0.h-z1.h ?},{ ?z0.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w14,0,vgx1\],{ ?z10.h-z1.h ?},{ ?z0.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.s\[w8,15,vgx1\],{ ?z0.h-z1.h ?},{ ?z0.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.h\[w8,0,vgx1\],{ ?z30.h-z31.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmla za.b\[w8,0,vgx1\],{ ?z0.h-z1.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmla za.h\[w8,0,vgx4\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: operand mismatch -- `bfmla za.b\[w8,20,vgx4\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfmla za.h\[w8, 20, vgx4\], { ?z0.h ?}, { ?z30.h ?}
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w14,0,vgx3\],{ ?z10.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,15,vgx3\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.d\[w8,0,vgx3\],{ ?z30.h-z31.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z15.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z0.h\[7\]'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h ?},z0.h\[7\]'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h ?},z0.h'
.*: Error: missing type suffix at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0-z1},z0.h\[7\]'
.*: Error: missing type suffix at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0-z1}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.b\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w14,0,vgx1\],{ ?z10.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,15,vgx1\],{ ?z0.h-z1.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx1\],{ ?z30.h-z31.h ?},z0.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z15.h\[0\]'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z0.h\[7\]'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h ?},z0.h\[7\]'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h ?},z0.h'
.*: Error: missing type suffix at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0-z1},z0.h\[7\]'
.*: Error: missing type suffix at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0-z1}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w14,0,vgx3\],{ ?z10.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,15,vgx3\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.d\[w8,0,vgx3\],{ ?z31.h-z0.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx3\],{ ?z0.h-z1.h ?},z15.h'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h ?},z15.h'
.*: Error: operand mismatch -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?},z15'
.*: Info:    did you mean this\?
.*: Info:    	bfmls za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*: Error: operand mismatch -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?},z20'
.*: Info:    did you mean this\?
.*: Info:    	bfmls za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z20.h
.*: Error: comma expected between operands at operand 3 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w14,0,vgx1\],{ ?z10.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,15,vgx1\],{ ?z0.h-z1.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx1\],{ ?z31.h-z2.h ?},z0.h'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.b\[w8,0,vgx1\],{ ?z0.h-z1.h ?},z15.h'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h ?},z15.h'
.*: Error: operand mismatch -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?},z15'
.*: Info:    did you mean this\?
.*: Info:    	bfmls za.h\[w8, 0, vgx4\], { ?z0.h-z1.h ?}, z15.h
.*: Error: operand mismatch -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?},z20'
.*: Info:    did you mean this\?
.*: Info:    	bfmls za.h\[w8, 0, vgx4\], { ?z0.h-z1.h ?}, z20.h
.*: Error: comma expected between operands at operand 3 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w8,0,vgx3\],{ ?z0.h-z1.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w14,0,vgx3\],{ ?z10.h-z1.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.d\[w8,15,vgx3\],{ ?z0.h-z1.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx3\],{ ?z30.h-z31.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.b\[w8,0,vgx3\],{ ?z0.h-z1.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 2 registers at operand 3 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h-z1.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 2 registers at operand 2 -- `bfmls za.h\[w8,0,vgx2\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: operand mismatch -- `bfmls za.b\[w8,20,vgx2\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfmls za.h\[w8, 20, vgx2\], { ?z0.h ?}, { ?z30.h ?}
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w8,0,vgx1\],{ ?z0.h-z1.h ?},{ ?z0.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w14,0,vgx1\],{ ?z10.h-z1.h ?},{ ?z0.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.s\[w8,15,vgx1\],{ ?z0.h-z1.h ?},{ ?z0.h-z3.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.h\[w8,0,vgx1\],{ ?z30.h-z31.h ?},{ ?z0.h-z1.h ?}'
.*: Error: invalid vector group size at operand 1 -- `bfmls za.b\[w8,0,vgx1\],{ ?z0.h-z1.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h ?},{ ?z30.h-z31.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h-z1.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: expected a list of 4 registers at operand 2 -- `bfmls za.h\[w8,0,vgx4\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Error: operand mismatch -- `bfmls za.b\[w8,20,vgx4\],{ ?z0.h ?},{ ?z30.h ?}'
.*: Info:    did you mean this\?
.*: Info:    	bfmls za.h\[w8, 20, vgx4\], { ?z0.h ?}, { ?z30.h ?}
.*: Error: operand mismatch -- `bfmopa ZA1.h,p0,p0/m,z0.h,z0.h'
.*: Info:    did you mean this\?
.*: Info:    	bfmopa za1.h, p0/m, p0/m, z0.h, z0.h
.*: Error: operand mismatch -- `bfmopa ZA0.h,p7/m,p0,z0.h,z0.h'
.*: Info:    did you mean this\?
.*: Info:    	bfmopa za0.h, p7/m, p0/m, z0.h, z0.h
.*: Error: operand mismatch -- `bfmopa ZA0.h,p0/m,p7/m,z0.s,z0.s'
.*: Info:    did you mean this\?
.*: Info:    	bfmopa za0.h, p0/m, p7/m, z0.h, z0.h
.*: Error: operand mismatch -- `bfmopa ZA0.h,p0/m,p0/m,z31.d,z0.d'
.*: Info:    did you mean this\?
.*: Info:    	bfmopa za0.h, p0/m, p0/m, z31.h, z0.h
.*: Error: ZA tile number out of range at operand 1 -- `bfmopa ZA2.h,p0/m,p8/m,z0.s,z31.b'
.*: Error: ZA tile number out of range at operand 1 -- `bfmopa ZA4.h,p15/m,p11/m,z0.s,z31.b'
.*: Error: operand mismatch -- `bfmops ZA1.h,p0,p0/m,z0.h,z0.h'
.*: Info:    did you mean this\?
.*: Info:    	bfmops za1.h, p0/m, p0/m, z0.h, z0.h
.*: Error: operand mismatch -- `bfmops ZA0.h,p7/m,p0,z0.h,z0.h'
.*: Info:    did you mean this\?
.*: Info:    	bfmops za0.h, p7/m, p0/m, z0.h, z0.h
.*: Error: operand mismatch -- `bfmops ZA0.h,p0/m,p7/m,z0.s,z0.s'
.*: Info:    did you mean this\?
.*: Info:    	bfmops za0.h, p0/m, p7/m, z0.h, z0.h
.*: Error: operand mismatch -- `bfmops ZA0.h,p0/m,p0/m,z31.d,z0.d'
.*: Info:    did you mean this\?
.*: Info:    	bfmops za0.h, p0/m, p0/m, z31.h, z0.h
.*: Error: ZA tile number out of range at operand 1 -- `bfmops ZA2.h,p0/m,p8/m,z0.s,z31.b'
.*: Error: ZA tile number out of range at operand 1 -- `bfmops ZA4.h,p15/m,p11/m,z0.s,z31.b'
