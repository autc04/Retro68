/* { dg-do compile } */
/* { dg-options "-march=rv64imaefcv -mabi=lp64d" } */
int foo()
{
}

/* { dg-error "i, e or g must be the first extension" "" { target *-*-* } 0 } */
