/* { dg-require-effective-target untyped_assembly } */
/* { dg-additional-options "-std=gnu89" } */

inline f(x){switch(x){case 6:case 4:case 3:case 1:;}return x;}
g(){f(sizeof("xxxxxx"));}
