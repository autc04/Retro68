/* { dg-additional-options "-std=gnu89" } */

struct ack {
    char a, b, c;
};

main()
{
   struct ack bad;

   foo(bad);
}

foo(c)
   struct ack c;
{
}
