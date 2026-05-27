.*: Assembler messages:
.*: Error: p0-p7 expected at operand 2 -- `ld1d { ?z0.q ?},p8/z,\[x0\]'
.*: Error: invalid base register at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x31\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,#8,mul vl\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,#-9,mul vl\]'
.*: Error: operand mismatch -- `ld1d { ?z0.q ?},p0,\[x0\]'
.*: Info:    did you mean this\?
.*: Info:    	ld1d { ?z0.q ?}, p0/z, \[x0\]
.*: Error: p0-p7 expected at operand 2 -- `ld1d { ?z0.q ?},p8/z,\[x0,x0,LSL#3\]'
.*: Error: invalid base register at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x31,x0,LSL#3\]'
.*: Error: invalid base register at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[xzr,x0,LSL#3\]'
.*: Error: only 'MUL VL' is permitted at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,x31,LSL#3\]'
.*: Error: index register xzr is not allowed at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,xzr,LSL#3\]'
.*: Error: invalid offset register at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,sp,LSL#3\]'
.*: Error: invalid addressing mode at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,x0\]'
.*: Error: invalid addressing mode at operand 3 -- `ld1d { ?z0.q ?},p0/z,\[x0,x0,LSL#2\]'
.*: Error: operand mismatch -- `ld1d { ?z0.q ?},p0,\[x0,x0,LSL#3\]'
.*: Info:    did you mean this\?
.*: Info:    	ld1d { ?z0.q ?}, p0/z, \[x0, x0, lsl #3\]
.*: Error: p0-p7 expected at operand 2 -- `ld1w { ?z0.q ?},p8/z,\[x0\]'
.*: Error: invalid base register at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x31\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,#8,mul vl\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,#-9,mul vl\]'
.*: Error: operand mismatch -- `ld1w { ?z0.q ?},p0,\[x0\]'
.*: Info:    did you mean this\?
.*: Info:    	ld1w { ?z0.q ?}, p0/z, \[x0\]
.*: Error: p0-p7 expected at operand 2 -- `ld1w { ?z0.q ?},p8/z,\[x0,x0,LSL#2\]'
.*: Error: invalid base register at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x31,x0,LSL#2\]'
.*: Error: invalid base register at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[xzr,x0,LSL#2\]'
.*: Error: only 'MUL VL' is permitted at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,x31,LSL#2\]'
.*: Error: index register xzr is not allowed at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,xzr,LSL#2\]'
.*: Error: invalid offset register at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,sp,LSL#2\]'
.*: Error: invalid addressing mode at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,x0\]'
.*: Error: invalid addressing mode at operand 3 -- `ld1w { ?z0.q ?},p0/z,\[x0,x0,LSL#3\]'
.*: Error: operand mismatch -- `ld1w { ?z0.q ?},p0,\[x0,x0,LSL#2\]'
.*: Info:    did you mean this\?
.*: Info:    	ld1w { ?z0.q ?}, p0/z, \[x0, x0, lsl #2\]
.*: Error: p0-p7 expected at operand 2 -- `st1d { ?z0.q ?},p8,\[x0\]'
.*: Error: invalid base register at operand 3 -- `st1d { ?z0.q ?},p0,\[x31\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,#8,mul vl\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,#-9,mul vl\]'
.*: Error: operand mismatch -- `st1d { ?z0.q ?},p0/z,\[x0\]'
.*: Info:    did you mean this\?
.*: Info:    	st1d { ?z0.q ?}, p0, \[x0\]
.*: Error: p0-p7 expected at operand 2 -- `st1d { ?z0.q ?},p8,\[x0,x0,LSL#3\]'
.*: Error: invalid base register at operand 3 -- `st1d { ?z0.q ?},p0,\[x31,x0,LSL#3\]'
.*: Error: invalid base register at operand 3 -- `st1d { ?z0.q ?},p0,\[xzr,x0,LSL#3\]'
.*: Error: only 'MUL VL' is permitted at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,x31,LSL#3\]'
.*: Error: index register xzr is not allowed at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,xzr,LSL#3\]'
.*: Error: invalid offset register at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,sp,LSL#3\]'
.*: Error: invalid addressing mode at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,x0\]'
.*: Error: invalid addressing mode at operand 3 -- `st1d { ?z0.q ?},p0,\[x0,x0,LSL#2\]'
.*: Error: operand mismatch -- `st1d { ?z0.q ?},p0/z,\[x0,x0,LSL#3\]'
.*: Info:    did you mean this\?
.*: Info:    	st1d { ?z0.q ?}, p0, \[x0, x0, lsl #3\]
.*: Error: p0-p7 expected at operand 2 -- `st1w { ?z0.q ?},p8,\[x0\]'
.*: Error: invalid base register at operand 3 -- `st1w { ?z0.q ?},p0,\[x31\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,#8,mul vl\]'
.*: Error: immediate offset out of range -8 to 7 at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,#-9,mul vl\]'
.*: Error: operand mismatch -- `st1w { ?z0.q ?},p0/z,\[x0\]'
.*: Info:    did you mean this\?
.*: Info:    	st1w { ?z0.q ?}, p0, \[x0\]
.*: Error: p0-p7 expected at operand 2 -- `st1w { ?z0.q ?},p8,\[x0,x0,LSL#2\]'
.*: Error: invalid base register at operand 3 -- `st1w { ?z0.q ?},p0,\[x31,x0,LSL#2\]'
.*: Error: invalid base register at operand 3 -- `st1w { ?z0.q ?},p0,\[xzr,x0,LSL#2\]'
.*: Error: only 'MUL VL' is permitted at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,x31,LSL#2\]'
.*: Error: index register xzr is not allowed at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,xzr,LSL#2\]'
.*: Error: invalid offset register at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,sp,LSL#2\]'
.*: Error: invalid addressing mode at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,x0\]'
.*: Error: invalid addressing mode at operand 3 -- `st1w { ?z0.q ?},p0,\[x0,x0,LSL#3\]'
.*: Error: operand mismatch -- `st1w { ?z0.q ?},p0/z,\[x0,x0,LSL#2\]'
.*: Info:    did you mean this\?
.*: Info:    	st1w { ?z0.q ?}, p0, \[x0, x0, lsl #2\]
