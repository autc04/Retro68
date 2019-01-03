#as: -march=armv8.4-a
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
[^:]+:\s+2e809400 	udot	v0.2s, v0.8b, v0.8b
[^:]+:\s+2e8b9400 	udot	v0.2s, v0.8b, v11.8b
