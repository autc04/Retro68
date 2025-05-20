// { dg-do compile { target c++20 } }

template <class T> concept is_const = __is_same(T, const T);

void f() {
  int x[] = {1,2};
  const int y[] = {3};
  const is_const auto [a,b] = x;	// { dg-error "structured binding declaration cannot have constrained 'auto' type 'const auto \\\[requires ::is_const<<placeholder>, >\\\]'" }
					// { dg-error "constraints" "" { target *-*-* } .-1 }
  const is_const auto [c] = y;		// { dg-error "structured binding declaration cannot have constrained 'auto' type 'const auto \\\[requires ::is_const<<placeholder>, >\\\]'" }
}
