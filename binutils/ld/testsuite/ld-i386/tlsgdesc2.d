#name: TLS GDesc->LE transition check (indirect CALL)
#as: --32 -mtls-check=no
#ld: -melf_i386
#error: .*: relocation R_386_TLS_DESC_CALL against `foo' must be used in indirect CALL with EAX register only
