/* { dg-additional-options "-std=gnu89" } */

int v;static inline f(){return 0;}g(){return f();}void h(){return v++;}
