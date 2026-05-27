#source: tlsdesc4.s
#name: TLS GDesc call (indirect CALL)
#as: --64 -mtls-check=no
#ld: -shared -melf_x86_64
#error: .*: relocation R_X86_64_TLSDESC_CALL against `foo' must be used in indirect CALL with RAX register only
