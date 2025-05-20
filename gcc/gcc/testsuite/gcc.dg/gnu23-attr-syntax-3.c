/* Test C23 attribute syntax.  Invalid uses of attributes with GNU C
   features.  Non-permissive variant.  */
/* { dg-do compile } */
/* { dg-options "-std=gnu23 -w" } */

/* Attributes cannot be used as prefix attributes on old-style
   parameter declarations or on function declarators with identifier
   lists (removed from C23).  */

void (*f(a, b) [[]])() int a, b; { } /* { dg-error "expected" } */

void f(x, y) int x; [[]] int y; { } /* { dg-error "expected" } */
/* { dg-error "type of 'y' defaults to 'int'" "" { target *-*-* } .-1 } */

/* Nonempty attributes cannot be used as postfix attributes with
   __auto_type.  */
__auto_type [[gnu::no_such_attr]] x = 1; /* { dg-error "'__auto_type' followed by" } */
