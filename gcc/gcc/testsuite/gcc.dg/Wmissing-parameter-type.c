/* { dg-do compile } */
/* { dg-options "-std=gnu89 -Wmissing-parameter-type" } */

int foo(bar) { return bar; } /* { dg-warning "type of 'bar' defaults to 'int' \\\[-Wmissing-parameter-type\\\]" } */


