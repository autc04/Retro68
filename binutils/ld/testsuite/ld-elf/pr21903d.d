#source: pr21903.s
#ld: --no-define-common -pie
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi
#error: --no-define-common may not be used without -shared
