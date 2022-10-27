#name: Illegal RAS instruction use.
#source: illegal-ras-1.s
#as: -march=armv8-a -mno-verbose-error
#error-output: illegal-ras-1.l
