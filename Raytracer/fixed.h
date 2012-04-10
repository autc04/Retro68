#ifndef FIXED_H
#define FIXED_H

#include <cstdint>

inline std::int32_t muls(std::int16_t x, std::int16_t y)
{
   return (std::int32_t)x*y;
}

inline std::uint32_t mulu(std::uint16_t x, std::uint16_t y)
{
   //return (std::uint32_t)x * y;
   std::uint32_t res;
   __asm("mulu %1, %0" : "=d"(res) : "d"(x), "0"(y));
   return res;
}

inline std::int32_t mulsu(std::int16_t x, std::uint16_t y)
{
   //return (std::int32_t)a * (std::uint32_t)b;
   std::int32_t res;
   __asm("mulu %1, %0" : "=d"(res) : "d"(x), "0"(y));
   if(x < 0)
      res -= ((std::uint32_t)y) << 16;
   return res;
}

#define COUNT_OP(var) ++var

class fixed
{
	std::int32_t val;
	
public:
	class raw {};
	fixed(std::int32_t val, raw r) : val(val) {}	
	
	fixed() : val(0) {}
	fixed(int x) : val((long)x << 16) {}
	fixed(float f) : val(f * 65536) {}
	
	//operator int() { return val >> 16; }
	
	fixed operator+(fixed o) const { return fixed(val + o.val, raw()); }
	fixed operator-(fixed o) const { return fixed(val - o.val, raw()); }	
	fixed operator*(fixed o) const {
		COUNT_OP(nMul);
		//return fixed((static_cast<long long>(val) * o.val) >> 16, raw());
		int16_t a = val >> 16;
	    int16_t c = o.val >> 16;
	 
	    uint16_t b = val;
	    uint16_t d = o.val;
	 
	    return fixed(((a*c) << 16)
					+ mulsu(a,d) + mulsu(c,b)
		             + (mulu(b,d) >> 16),raw());
	
	}	
	fixed operator/(fixed o) const { COUNT_OP(nDiv); return fixed((static_cast<long long>(val) << 16) / o.val, raw()); }
	
	fixed operator-() const { return fixed(-val, raw()); }
	
	fixed& operator+=(fixed o) { val += o.val; return *this; }
	fixed& operator-=(fixed o) { val -= o.val; return *this; }
	fixed& operator*=(fixed o) { return (*this = *this * o); }
	
	bool operator== (fixed o) const { return val == o.val; }
	bool operator!= (fixed o) const { return val != o.val; }
	bool operator> (fixed o) const { return val > o.val; }
	bool operator< (fixed o) const { return val < o.val; }
	bool operator>= (fixed o) const { return val >= o.val; }
	bool operator<= (fixed o) const { return val <= o.val; }
	
	friend fixed sqrt(fixed f);
	friend fixed floor(fixed f);
	friend fixed operator*(fixed f, int x);
	friend fixed operator*(int x, fixed f);
	friend int floor_to_int(fixed f);
	
	static long nMul;
	static long nIMul;
	static long nDiv;
	static long nSqrt;
};

/*fixed operator*(fixed f, int x) { return fixed(f.val * x, fixed::raw()); }
fixed operator*(int x, fixed f) { return fixed(f.val * x, fixed::raw()); }*/
inline fixed operator*(fixed f, int c)
{
	std::int16_t a = f.val >> 16;
 
    std::uint16_t b = f.val;
 
	COUNT_OP(fixed::nIMul);	
    return fixed(((a*c) << 16)
				+ mulsu(c,b),fixed::raw());
}
inline fixed operator*(int x, fixed f) { return f*x; }

inline fixed operator*(fixed f, float x) { return f*fixed(x); }
inline fixed operator*(float x, fixed f) { return f*fixed(x); }



fixed sqrt(fixed f);

inline fixed floor(fixed f)
{
	return fixed(f.val & 0xFFFF0000L, fixed::raw());
}

inline int floor_to_int(fixed f)
{
	return f.val >> 16;
}

#endif // FIXED_H
