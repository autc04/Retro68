IN=$1
OUT=$2

# Make Mac OS X's tr and sed not complain that the files are not UTF-8
export LANG=en

# cp $IN/[A-Z]*.h $OUT/
#for file in $(cd $IN; ls [A-Z]*.h); do
for file in $(cd $IN; ls *.h); do
	tr '\r' '\n' < $IN/$file > $OUT/$file
	#| sed 's/= \(0x[0-9A-Z]*\);/ONEWORDINLINE(\1);/' > $OUT/$file
done

############################# ConditionalMacros.h #############################
cat > $OUT/ConditionalMacros.h <<END_MARKER

#ifndef __CONDITIONALMACROS__WRAP__
#define __CONDITIONALMACROS__WRAP__

#if #cpu(powerpc)
#define TARGET_CPU_PPC 1
#define TARGET_OS_MAC 1
#define TARGET_RT_MAC_CFM 1
#define TARGET_RT_MAC_MACHO 0
#else
#define TARGET_CPU_68K 1
#define TARGET_OS_MAC 1
#define TARGET_RT_MAC_CFM 0
#define TARGET_RT_MAC_MACHO 0
#endif

#define PRAGMA_STRUCT_PACKPUSH 1
#define FUNCTION_PASCAL 1
#define TYPE_LONGLONG 1
#ifdef __cplusplus
#define TYPE_BOOL 1
#endif
END_MARKER

tr '\r' '\n' < $IN/ConditionalMacros.h | sed 's/__GNUC__/__GNUC_DISABLED__/g' >> $OUT/ConditionalMacros.h

cat >> $OUT/ConditionalMacros.h <<END_MARKER


#endif /* __CONDITIONALMACROS__WRAP__ */
END_MARKER

############################# fp.h #############################
if [ -r $IN/fp.h ]; then

cat > $OUT/fp.h <<END_MARKER

#ifndef __FP__WRAP__
#define __FP__WRAP__

#include "math.h"

#pragma push_macro("__MWERKS__")
#define __MWERKS__ 0x6666
#define __cmath__

short relation(double x, double y);

END_MARKER

tr '\r' '\n' < $IN/fp.h >> $OUT/fp.h

cat >> $OUT/fp.h <<END_MARKER

#pragma pop_macro("__MWERKS__")
#undef __cmath__

#endif /* __FP__WRAP__ */
END_MARKER

fi

############################# MixedMode.h #############################
tr '\r' '\n' < $IN/MixedMode.h | sed 's/Opaque\#\#name\#\#\*/Opaque\#\#name \*/g' > $OUT/MixedMode.h

############################# CGBase.h #############################
if [ -r $IN/CGBase.h ]; then
cat > $OUT/CGBase.h <<END_MARKER

#ifndef __CGBASE__WRAP__
#define __CGBASE__WRAP__

#include "math.h"

/* CGBase contains a hardcoded #ifdef that decides that stdint.h is available in MWERKS > 0x2300.
   ... otherwise, it contains an incompatible redefinition. */
#pragma push_macro("__MWERKS__")
#define __MWERKS__ 0x6666

END_MARKER

tr '\r' '\n' < $IN/CGBase.h >> $OUT/CGBase.h

cat >> $OUT/CGBase.h <<END_MARKER

#pragma pop_macro("__MWERKS__")

#endif /* __CGBASE__WRAP__ */
END_MARKER

fi
