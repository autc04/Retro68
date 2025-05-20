/* { dg-do compile { target { ia32 } } } */
/* { dg-options "-O2 -mno-accumulate-outgoing-args" } */

struct small{ short a,b; };

void call_func(void)
{
    extern int func(struct small X);
    static struct small const s = { 1,2 };
    func(s);
}

/* { dg-final { scan-assembler "pushl\[ \\t]*\\\$131073" } } */
