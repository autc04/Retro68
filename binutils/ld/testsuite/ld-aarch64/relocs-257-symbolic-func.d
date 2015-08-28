#source: relocs-257-symbolic-func.s
#ld: -shared -Bsymbolic-functions
#readelf: -r --wide
#...
.* +R_AARCH64_RELATIVE +.*
