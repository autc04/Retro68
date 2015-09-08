IN=$1
OUT=$2

# Make Mac OS X's tr and sed not complain that the files are not UTF-8
export LANG=en

# cp $IN/[A-Z]*.h $OUT/
for file in $(cd $IN; ls [A-Z]*.h); do
	tr '\r' '\n' < $IN/$file > $OUT/$file
	#| sed 's/= \(0x[0-9A-Z]*\);/ONEWORDINLINE(\1);/' > $OUT/$file
done

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

