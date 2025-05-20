// PR c++/89513
// { dg-do compile { target c++14 } }
// { dg-options "" }

constexpr int foo ()
try {			// { dg-warning "function-try-block body of 'constexpr' function only available with" "" { target c++17_down } }
  int a;		// { dg-error "uninitialized variable 'a' in 'constexpr' function" "" { target c++17_down } }
  static double b = 1.0;// { dg-error "'b' defined 'static' in 'constexpr' function only available with" "" { target c++20_down } }
  goto l;		// { dg-error "'goto' in 'constexpr' function only available with" "" { target c++20_down } }
  l:;
  return 0;
} catch (...) {
  long int c;		// { dg-error "uninitialized variable 'c' in 'constexpr' function" "" { target c++17_down } }
  static float d = 2.0f;// { dg-error "'d' defined 'static' in 'constexpr' function only available with" "" { target c++20_down } }
  goto l2;		// { dg-error "'goto' in 'constexpr' function only available with" "" { target c++20_down } }
  l2:;
  return -1;
}

constexpr int bar ()
{
  int a;		// { dg-error "uninitialized variable 'a' in 'constexpr' function" "" { target c++17_down } }
  static long double b = 3.0;// { dg-error "'b' defined 'static' in 'constexpr' function only available with" "" { target c++20_down } }
  goto l;		// { dg-error "'goto' in 'constexpr' function only available with" "" { target c++20_down } }
  l:;
  try {			// { dg-warning "'try' in 'constexpr' function only available with" "" { target c++17_down } }
    short c;		// { dg-error "uninitialized variable 'c' in 'constexpr' function" "" { target c++17_down } }
    static float d;	// { dg-error "'d' defined 'static' in 'constexpr' function only available with" "" { target c++20_down } }
			// { dg-error "uninitialized variable 'd' in 'constexpr' function" "" { target c++17_down } .-1 }
    goto l2;		// { dg-error "'goto' in 'constexpr' function only available with" "" { target c++20_down } }
    l2:;
    return 0;
  } catch (int) {
    char e;		// { dg-error "uninitialized variable 'e' in 'constexpr' function" "" { target c++17_down } }
    static int f = 5;	// { dg-error "'f' defined 'static' in 'constexpr' function only available with" "" { target c++20_down } }
    goto l3;		// { dg-error "'goto' in 'constexpr' function only available with" "" { target c++20_down } }
    l3:;
    return 1;
  }
}
