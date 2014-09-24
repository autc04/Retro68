IN=$1
OUT=$2

# cp $IN/[A-Z]*.h $OUT/
for file in $(cd $IN; ls [A-Z]*.h); do
	tr '\r' '\n' < $IN/$file > $OUT/$file
done

cat > $OUT/ConditionalMacros.h <<END_MARKER

#ifndef __CONDITIONALMACROS__WRAP__
#define __CONDITIONALMACROS__WRAP__

#define TARGET_CPU_68K 1
#define TARGET_OS_MAC 1
#define TARGET_RT_MAC_CFM 0
#define TARGET_RT_MAC_MACHO 0
#define TYPE_LONGLONG 1
#define pascal __attribute__((__pascal__))
#define FUNCTION_PASCAL 1
#ifdef __cplusplus
#define TYPE_BOOL 1
#endif
END_MARKER

tr '\r' '\n' < $IN/ConditionalMacros.h | sed 's/__GNUC__/__GNUC_DISABLED__/g' >> $OUT/ConditionalMacros.h

cat >> $OUT/ConditionalMacros.h <<END_MARKER

#undef ONEWORDINLINE(w1)
#undef TWOWORDINLINE(w1,w2)
#undef THREEWORDINLINE(w1,w2,w3)
#undef FOURWORDINLINE(w1,w2,w3,w4)
#undef FIVEWORDINLINE(w1,w2,w3,w4,w5)
#undef SIXWORDINLINE(w1,w2,w3,w4,w5,w6)
#undef SEVENWORDINLINE(w1,w2,w3,w4,w5,w6,w7)
#undef EIGHTWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8)
#undef NINEWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9)
#undef TENWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10)
#undef ELEVENWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11)
#undef TWELVEWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12)

#define ONEWORDINLINE(w1)               __attribute__((__raw_inline__(w1)))
#define TWOWORDINLINE(w1,w2)            __attribute__((__raw_inline__(w1,w2)))
#define THREEWORDINLINE(w1,w2,w3)       __attribute__((__raw_inline__(w1,w2,w3)))
#define FOURWORDINLINE(w1,w2,w3,w4)     __attribute__((__raw_inline__(w1,w2,w3,w4)))
#define FIVEWORDINLINE(w1,w2,w3,w4,w5)  __attribute__((__raw_inline__(w1,w2,w3,w4,w5)))
#define SIXWORDINLINE(w1,w2,w3,w4,w5,w6)                            __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6)))
#define SEVENWORDINLINE(w1,w2,w3,w4,w5,w6,w7)                       __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6,w7)))
#define EIGHTWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8)                    __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6,w7,w8)))
#define NINEWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9)                  __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6,w7,w8,w9)))
#define TENWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10)               __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10)))
#define ELEVENWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11)        __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11)))
#define TWELVEWORDINLINE(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12)    __attribute__((__raw_inline__(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12)))

#endif /* __CONDITIONALMACROS__WRAP__ */
END_MARKER

