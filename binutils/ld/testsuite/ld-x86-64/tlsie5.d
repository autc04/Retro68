#name: TLS IE->LE transition check (APX)
#as: --64 -mtls-check=no
#ld: -melf_x86_64
#error: .*: relocation R_X86_64_CODE_6_GOTTPOFF against `foo' must be used in ADD or MOVRS only
