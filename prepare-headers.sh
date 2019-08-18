IN="$1"
OUT="$2"

# Make Mac OS X's tr and sed not complain that the files are not UTF-8
export LC_ALL=C

for file in $(cd "$IN"; ls *.h); do
    # Filter by file names.
    # Some CIncludes packages include the MPW standard library.
    # Header files from that standard library would overwrite
    # newlib header files and stop things from working.
    case $file in
            # Apple/MPW standard library internals
        *Def.h|FSpio.h)
            USE=false
            ;;

            # whitelist all uppercase headers
        [A-Z]*.h)
            USE=true
            ;;

            # whitelist OpenTransport
        cred.h|dlpi.h|miioccom.h|mistream.h|modnames.h)
            USE=true
            ;;
            # whitelist OpenTransport (continued)
        strlog.h|stropts.h|strstat.h|tihdr.h)
            USE=true
            ;;

            # Non-standard floating point headers that don't conflict
        ddrt.h|fp.h)
            USE=true
            ;;
            # newlib does not provide fenv.h, so use Apple's
        fenv.h)
            USE=true
            ;;

            # veclib headers
        v*.h)
            USE=true
            ;;

        # unsupported:    intrinsics.h   perf.h

        # all other (lowercase) headers: conflict with GCC or newlib headers
        *)
            USE=false
            ;;
    esac

    if [ $USE = true ]; then
        sed 's/\r$//' < "$IN/$file" | tr '\r' '\n' > "$OUT/$file"
    fi
done

############################# ConditionalMacros.h #############################
cat > "$OUT/ConditionalMacros.h" <<END_MARKER

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

#define __DEBUGGING__  /* HACK: Disable Debugging.h because its vdprintf conflicts with stdio.h */
END_MARKER

sed 's/\r$//' < "$IN/ConditionalMacros.h" | tr '\r' '\n' | sed 's/__GNUC__/__GNUC_DISABLED__/g' >> "$OUT/ConditionalMacros.h"

cat >> "$OUT/ConditionalMacros.h" <<END_MARKER


#endif /* __CONDITIONALMACROS__WRAP__ */
END_MARKER

############################# fp.h #############################
if [ -r "$IN/fp.h" ]; then

cat > "$OUT/fp.h" <<END_MARKER

#ifndef __FP__WRAP__
#define __FP__WRAP__

#include "math.h"

#pragma push_macro("__MWERKS__")
#define __MWERKS__ 0x6666
#define __cmath__

short relation(double x, double y);

END_MARKER

sed 's/\r$//' < $IN/fp.h | tr '\r' '\n' >> $OUT/fp.h

cat >> $OUT/fp.h <<END_MARKER

#pragma pop_macro("__MWERKS__")
#undef __cmath__

#endif /* __FP__WRAP__ */
END_MARKER

fi

############################# MixedMode.h #############################
sed 's/\r$//' < "$IN/MixedMode.h" | tr '\r' '\n' | sed 's/Opaque\#\#name\#\#\*/Opaque\#\#name \*/g' > "$OUT/MixedMode.h"

############################# CGBase.h #############################
if [ -r "$IN/CGBase.h" ]; then
cat > "$OUT/CGBase.h" <<END_MARKER

#ifndef __CGBASE__WRAP__
#define __CGBASE__WRAP__

#include <math.h>
#include <sys/types.h>

/* CGBase contains a hardcoded #ifdef that decides that stdint.h is available in MWERKS > 0x2300.
   ... otherwise, it contains an incompatible redefinition. */
#pragma push_macro("__MWERKS__")
#define __MWERKS__ 0x6666

#define u_int32_t __cgbase_incompatible_u_int32_t

END_MARKER

sed 's/\r$//' < "$IN/CGBase.h" | tr '\r' '\n' >> "$OUT/CGBase.h"

cat >> "$OUT/CGBase.h" <<END_MARKER

#undef u_int32_t __cgbase_incompatible_u_int32_t

#pragma pop_macro("__MWERKS__")

#endif /* __CGBASE__WRAP__ */
END_MARKER

fi

for f in Types.h Memory.h Windows.h Errors.h; do
    if [ ! -r "$IN/$f" ]; then
        echo "#include \"Mac$f\"" > "$OUT/$f"
    elif [ ! -r "$IN/Mac$f" ]; then
        echo "#include \"$f\"" > "$OUT/Mac$f"
    fi
done

if [ -d "$IN/CoreFoundation" ]; then
    mkdir -p "$OUT/CoreFoundation"
    for file in $(cd "$IN"; ls CoreFoundation/*.h); do
        sed 's/\r$//' < "$IN/$file" | tr '\r' '\n' > "$OUT/$file"
    done
fi
