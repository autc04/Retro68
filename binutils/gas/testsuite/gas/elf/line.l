# This should match the warnings when assembling line.s.

.*: Assembler messages:
line\.s:[0-9]*18: Warning: \.warning .*
line\.s:[0-9]*21: Warning: m1/1: 123
line\.s:[0-9]*21: Warning: m1/2: 123
line\.s:[0-9]*22: Warning: m1/1: abc
line\.s:[0-9]*22: Warning: m1/2: abc
line\.s:[0-9]*23: Warning: m1/1: XYZ
line\.s:[0-9]*23: Warning: m1/2: XYZ
line\.s:[0-9]*24: Warning: \.warning .*
Line\.s:10: Warning: m2/1: 987
Line\.s:12: Warning: m2/2: 987
Line\.s:10: Warning: m2/1: zyx
Line\.s:12: Warning: m2/2: zyx
Line\.s:10: Warning: m2/1: CBA
Line\.s:12: Warning: m2/2: CBA
line\.s:[0-9]*29: Warning: \.warning .*
line\.s:[0-9]*35: Warning: irp/1: 123
line\.s:[0-9]*37: Warning: irp/2: 123
line\.s:[0-9]*35: Warning: irp/1: 456
line\.s:[0-9]*37: Warning: irp/2: 456
line\.s:[0-9]*39: Warning: \.warning .*
line\.s:[0-9]*45: Warning: rept/1
line\.s:[0-9]*47: Warning: rept/2
line\.s:[0-9]*45: Warning: rept/1
line\.s:[0-9]*47: Warning: rept/2
line\.s:[0-9]*45: Warning: rept/1
line\.s:[0-9]*47: Warning: rept/2
line\.s:[0-9]*49: Warning: \.warning .*
