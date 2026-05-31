extern int printf (const char *, ...);
int foo ()
{
#ifdef SHARED
    printf ("PASS\n");
    return 0;
#else
    printf ("FAIL\n");
    return 1;
#endif
}
