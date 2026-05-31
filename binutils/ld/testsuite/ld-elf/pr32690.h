struct data1
{
  char c[0x1000];
} __attribute__ ((aligned (128)));

struct data2
{
  char c[872];
};

extern const struct data1 d1[];
extern const struct data2 d2;
extern const char c1[];

extern const int var0;
extern const int var1;
extern const int var2;
