void a(void *);
class b {
  long ag;
  bool c();
  void m_fn2() {
    if (c())
      d(ag);
  }
  void d(long);

public:
  ~b() { m_fn2(); }
};
class Player {
  int *an;
  b ao;
  char be;

public:
  virtual ~Player() {
    a(&be);
    a(&be);
    a(&be);
    delete an;
  }
} e;
