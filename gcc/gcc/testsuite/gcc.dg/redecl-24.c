/* We used to ICE in the gimplifier, PR 106560 */
/* { dg-do compile } */
/* { dg-options "-fpermissive -w" } */
void **a, **b; /* { dg-note "" } */
c(){b = a;}  
a = /* { dg-error "" } */
