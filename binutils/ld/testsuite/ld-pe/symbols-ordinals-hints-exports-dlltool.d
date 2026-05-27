#source: symbols-ordinals-hints-exports.s
#dlltool: -d ${srcdir}/${subdir}/symbols-ordinals-hints.def -e tmpdir/exports-dlltool.o
#ld: -shared tmpdir/exports-dlltool.o
#objdump: -p

# Rules for Ordinal/Name Pointer Table:
# - Table rows must be lexicographically sorted by symbol names
# - Hint numbers must be in sequence starting from zero
# - Ordinal numbers must match the @ordinal keyword from .def file
# - Symbols in .def file without @ordinal keyword have assigned the first free ordinal starting from 1
# - Symbols in .def file with NONAME keyword must not be present in Name Pointer Table

#...
.*\[Ordinal/Name Pointer\] Table -- Ordinal Base.*
.*      Ordinal   Hint Name
.*\+base\[   2\]  0000 sym1
.*\+base\[   5\]  0001 sym2
.*\+base\[   3\]  0002 sym4
.*\+base\[   4\]  0003 sym5

#pass
