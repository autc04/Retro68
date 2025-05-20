/* { dg-do preprocess } */
/* { dg-options -pedantic-errors } */

#if 'a' != 'a' || '\001' != 1 || '\x12' != 0x12
#error a,1,0x12 /* { dg-bogus "#error" "basic charconst recognition" } */
#endif

#if 'a' != L'a'
#error L'a'	/* { dg-bogus "error" "wide charconst recognition 1" } */
#endif

#if L'\xfeed' != 0xfeed && L'\xfeed' != (0xfeed - 0x10000)
#error 0xfeed	/* { dg-bogus "error" "wide charconst recognition 2" } */
#endif

#if L'\x1234' != 0x1234
#error 0x1234	/* { dg-bogus "error" "wide charconst recognition 3" } */
#endif

/* The 'multi-character literal with 4 characters exceeds 'int' size of \[0-9]+ bytes' message is produced by 16-bit targets.  */
#if 'abcd' /* { dg-warning "(multi-character character constant)|(multi-character literal with 4 characters exceeds 'int' size of \[0-9]+ bytes)" "multi-character charconst" } */
#endif

#if 'abcdefghi' /* { dg-warning "multi-character literal with \[0-9]+ characters exceeds 'int' size of \[0-9]+ bytes" } */
#endif

#if '' /* { dg-error "empty character constant" "empty charconst" } */
#endif
