# NONE relocs are not needed in a PIE.
#failif
#...
[0-9a-f]+ +[0-9a-f]+ +R_.*_NONE.*
#pass
