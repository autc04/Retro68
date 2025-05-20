/* PR c/61162 */
/* { dg-do compile } */
/* { dg-options "-fpermissive -Wc++-compat -Wpointer-sign -Wpedantic" } */

enum e { A };
struct s { int a; };

enum e
fn1 (void)
{
  return 0; /* { dg-warning "10:enum conversion from 'int' to 'enum e' in return" } */
}

int
fn2 (struct s s)
{
  return s; /* { dg-error "10:incompatible types when returning" } */
}

void
fn3 (void)
{
  return 3; /* { dg-warning "10:in function returning void" } */
}

int
fn4 (int *a)
{
  return a; /* { dg-warning "10:returning 'int \\*' from a function with return type 'int' makes integer from pointer without a cast" } */
}

int *
fn5 (int a)
{
  return a; /* { dg-warning "10:returning 'int' from a function with return type 'int \\*' makes pointer from integer without a cast" } */
}

unsigned int *
fn6 (int *i)
{
  return i; /* { dg-warning "10:pointer targets in returning 'int \\*' from a function with return type 'unsigned int \\*' differ" } */
}

void *
fn7 (void (*fp) (void))
{
  return fp; /* { dg-warning "10:ISO C forbids return between function pointer" } */
}
