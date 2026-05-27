void b(void *);
class c {
public:
  long am;
  bool d();
  void e() {
    if (d())
      f(am);
  }
  void f(long);
  ~c() { e(); }
};
class g {
public:
  virtual ~g();
};
class Player {
  int *bh;
  c bi;
  char bj;

public:
  virtual ~Player() {
    b(&bj);
    b(&bj);
    b(&bj);
    delete bh;
  }
};
class h {
public:
  ~h() {
    Player *a[0];
    delete a[0];
  }
};
class i : g {
  h bo;
  virtual int j();
};
int i::j() {}
