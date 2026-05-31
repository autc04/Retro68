#source: symbols-ordinals-hints-exports.s
#ld: -shared ${srcdir}/${subdir}/symbols-ordinals-hints.def --out-implib tmpdir/libimports-ld.a
#ld_after_inputfiles: && $AS $ASFLAGS ${srcdir}/${subdir}/symbols-ordinals-hints-call-imports.s -o tmpdir/call-imports-ld.o && $LD -shared tmpdir/call-imports-ld.o tmpdir/libimports-ld.a -o tmpdir/dump
#objdump: -p

# Rules for Import Tables:
# - Ordinal, Hint and Member-Name (what is present) match Ordinal/Name Pointer Table of
#   the external DLL (from corresponding symbols-ordinals-hints-exports-*.d test)
# - Symbols in .def file with NONAME keyword have only Ordinal, must no have Hint and Member-Name
# - Symbols in .def file without NONAME keyword have Hint and Member-Name, must not have Ordinal

#...
The Import Tables \(interpreted \.idata section contents\)
 vma:            Hint    Time      Forward  DLL       First
                 Table   Stamp     Chain    Name      Thunk
.*

.*DLL Name:.*
.* Ordinal  Hint  Member-Name  Bound-To
.*  <none>  0000  sym1
.*  <none>  0001  sym2
.*      1  <none> <none>
.*  <none>  0002  sym4
.*  <none>  0003  sym5

#pass
