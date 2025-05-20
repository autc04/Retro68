/* { dg-options "-std=gnu89 -fno-permissive" } */

/* Test for C89 dialect mode, with new permerrors enabled.  In most
   cases where the compiler warnings in C89 mode, it should issue a
   permerror with -fno-permissive.  */

void
implicit_function_declaration (void)
{
  f1 (); /* { dg-bogus "-Wimplicit-function-declaration" } */
}

extern implicit_int_1; /* { dg-bogus "-Wimplicit-int" } */
typedef implicit_int_2; /* { dg-bogus "-Wimplicit-int" } */
extern implicit_int_3 (void); /* { dg-bogus "-Wimplicit-int" } */
implicit_int_4 (i) /* { dg-bogus "-Wimplicit-int" } */
/* Directive here in the other files.  */
{
  (const) 0; /* { dg-bogus "-Wimplicit-int" } */
}

extern int missing_parameter_type (i); /* { dg-error "parameter names \\\(without types\\\) in function declaration \\\[-Wdeclaration-missing-parameter-type\\\]" } */


int *
int_conversion_1 (int flag)
{
  void f2 (int *);
  flag ? "1" : 1; /* { dg-error "pointer/integer type mismatch in conditional expression \\\[-Wint-conversion\\\]" } */
  flag ? 1 : "1"; /* { dg-error "pointer/integer type mismatch in conditional expression \\\[-Wint-conversion\\\]" } */
  f2 (flag); /* { dg-error "passing argument 1 of 'f2' makes pointer from integer without a cast \\\[-Wint-conversion\\\]" } */
  {
    int i1 = &flag; /* { dg-error "initialization of 'int' from 'int \\\*' makes integer from pointer without a cast \\\[-Wint-conversion\\\]" } */
    i1 = &flag; /* { dg-error "assignment to 'int' from 'int \\\*' makes integer from pointer without a cast \\\[-Wint-conversion\\\]" } */
  }
  return flag; /* { dg-error "returning 'int' from a function with return type 'int \\\*' makes pointer from integer without a cast \\\[-Wint-conversion\\\]" } */
}

int
int_conversion_2 (int flag)
{
  void f3 (int);
  f3 (&flag); /* { dg-error "passing argument 1 of 'f3' makes integer from pointer without a cast \\\[-Wint-conversion\\\]" } */
  {
    int *i1 = flag; /* { dg-error "initialization of 'int \\\*' from 'int' makes pointer from integer without a cast \\\[-Wint-conversion\\\]" } */
    i1 = flag; /* { dg-error "assignment to 'int \\\*' from 'int' makes pointer from integer without a cast \\\[-Wint-conversion\\\]" } */
  }
  return &flag; /* { dg-error "returning 'int \\\*' from a function with return type 'int' makes integer from pointer without a cast \\\[-Wint-conversion\\\]" } */
}

int *
incompatible_pointer_types (int flag)
{
  void f4 (int *);
  flag ? __builtin_abs : __builtin_labs; /* { dg-warning "pointer type mismatch in conditional expression \\\[-Wincompatible-pointer-types\\\]" } */
  {
    int *p1 = __builtin_abs; /* { dg-error "initialization of 'int \\\*' from pointer to '__builtin_abs' with incompatible type 'int \\\(\\\*\\\)\\\(int\\\)' \\\[-Wincompatible-pointer-types\\\]" } */
    p1 = __builtin_abs; /* { dg-error "assignment to 'int \\\*' from pointer to '__builtin_abs' with incompatible type 'int \\\(\\\*\\\)\\\(int\\\)' \\\[-Wincompatible-pointer-types\\\]" } */
  }
  {
    int *p2 = incompatible_pointer_types; /* { dg-error "initialization of 'int \\\*' from incompatible pointer type 'int \\\* \\\(\\\*\\\)\\\(int\\\)' \\\[-Wincompatible-pointer-types\\\]" } */
    p2 = incompatible_pointer_types; /* { dg-error "assignment to 'int \\\*' from incompatible pointer type 'int \\\* \\\(\\\*\\\)\\\(int\\\)' \\\[-Wincompatible-pointer-types\\\]" } */
    {
      int *p3 = &p2; /* { dg-error "initialization of 'int \\\*' from incompatible pointer type 'int \\\*\\\*' \\\[-Wincompatible-pointer-types\\\]" } */
      p3 = &p2; /* { dg-error "assignment to 'int \\\*' from incompatible pointer type 'int \\\*\\\*' \\\[-Wincompatible-pointer-types\\\]" } */
    }
    f4 (&p2); /* { dg-error "passing argument 1 of 'f4' from incompatible pointer type \\\[-Wincompatible-pointer-types\\\]" } */
  }
  if (flag)
    return __builtin_abs; /* { dg-error "returning pointer to '__builtin_abs' of type 'int \\\(\\\*\\\)\\\(int\\\)' from a function with incompatible type 'int \\\*' \\\[-Wincompatible-pointer-types\\\]" } */
  else
    return incompatible_pointer_types; /* { dg-error "returning 'int \\\* \\\(\\\*\\\)\\\(int\\\)' from a function with incompatible return type 'int \\\*' \\\[-Wincompatible-pointer-types\\\]" } */
}

void
return_mismatch_1 (void)
{
  return 0; /* { dg-error "'return' with a value, in function returning void \\\[-Wreturn-mismatch\\\]" } */
}

int
return_mismatch_2 (void)
{
  return; /* { dg-bogus "-Wreturn-mismatch" } */
}
