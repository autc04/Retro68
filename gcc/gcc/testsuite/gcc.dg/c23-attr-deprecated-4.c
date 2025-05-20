/* Test C23 deprecated attribute: duplicates (allowed after N2557).  */
/* { dg-do compile } */
/* { dg-options "-std=c23 -pedantic-errors" } */

[[deprecated, __deprecated__]] int a;
[[__deprecated__, deprecated("message")]] int b;
int c [[deprecated("message"), deprecated]];
[[deprecated, deprecated]];
/* { dg-error "ignored" "ignored" { target *-*-* } .-1 } */

[[deprecated]] [[deprecated]] int d [[deprecated]] [[deprecated]];
