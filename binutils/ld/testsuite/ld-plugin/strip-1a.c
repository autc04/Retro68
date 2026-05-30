extern void foo2(void);
extern void foo3(void);
void foo1(void) { foo3(); }
int main(void) { foo2(); }
