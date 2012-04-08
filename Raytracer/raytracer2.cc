#ifdef __APPLE__
#include <Carbon/Carbon.h>
#include <ApplicationServices/ApplicationServices.h>
#define PSTR(x) ("\p" x)

#else

#include <Quickdraw.h>
#include <MacMemory.h>
#include <Sound.h>
#include <Events.h>
#include <Fonts.h>
#include <NumberFormatting.h>

#ifdef __GNUC__
#include "MacUtils.h"
QDGlobals qd;
#else
#define PSTR(x) ("\p" x)
#endif

#endif


#include <cmath>
#include <algorithm>
#include <cstdlib>
#include <cstring>
#include <vector>

using std::sqrt;
using std::floor;

class fixed
{
	long val;
	
public:
	class raw {};
	fixed(long val, raw r) : val(val) {}	
	
	fixed() : val(0) {}
	fixed(int x) : val((long)x << 16) {}
	fixed(float f) : val(f * 65536) {}
	
	//operator int() { return val >> 16; }
	
	fixed operator+(fixed o) const { return fixed(val + o.val, raw()); }
	fixed operator-(fixed o) const { return fixed(val - o.val, raw()); }	
	fixed operator*(fixed o) const { return fixed((static_cast<long long>(val) * o.val) >> 16, raw()); }	
	fixed operator/(fixed o) const { return fixed((static_cast<long long>(val) << 16) / o.val, raw()); }
	
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
};

fixed operator*(fixed f, int x) { return fixed(f.val * x, fixed::raw()); }
fixed operator*(int x, fixed f) { return fixed(f.val * x, fixed::raw()); }

fixed operator*(fixed f, float x) { return f*fixed(x); }
fixed operator*(float x, fixed f) { return f*fixed(x); }


fixed sqrt(fixed f)
{
#if 1
	const int FRACBITS  = 16; /* Must be even! */
	const int ITERS = 15 + (FRACBITS >> 1);
	
	unsigned long root, remHi, remLo, testDiv, count;
	root = 0;			/* Clear root */
	remHi = 0;			/* Clear high part of partial remainder */
	remLo = f.val;			/* Get argument into low part of partial remainder */
	count = ITERS;		/* Load loop counter */
		
	do {
		remHi = (remHi << 2) | (remLo >> 30); remLo <<= 2; /* get 2 bits of arg */
		root <<= 1; /* Get ready for the next bit in the root */
		testDiv = (root << 1) + 1; /* Test radical */
		if (remHi >= testDiv) {
			remHi -= testDiv;
			root += 1;
		}
	} while (count-- != 0);

	return fixed(root, fixed::raw());
#else
	
	fixed lower = 0;
	fixed upper = 181;	// 181.019
	while(lower != upper)
	{
		fixed mid(lower.val/2 + upper.val/2, fixed::raw());
		fixed s = mid*mid;
		if(s <= f)
			lower = mid;
		if(s >= f)
			upper = mid;
	}
	return lower;
#endif
}

fixed floor(fixed f)
{
	return fixed(f.val & 0xFFFF0000L, fixed::raw());
}

int floor_to_int(fixed f)
{
	return f.val >> 16;
}

int floor_to_int(float f)
{
	return static_cast<int>(std::floor(f));
}

template<class T>
class vec3
{
public:
	T x,y,z;
	vec3(T x, T y, T z) : x(x), y(y), z(z) {}
	vec3() : x(0), y(0), z(0) {}
	
	vec3<T> operator+(const vec3<T>& other) const { return vec3(x + other.x, y + other.y, z + other.z); }
	vec3<T> operator-(const vec3<T>& other) const { return vec3(x - other.x, y - other.y, z - other.z); }
	vec3<T> operator*(T a) const { return vec3(x*a, y*a, z*a); }
	
	T length() const { return sqrt(x*x + y*y + z*z); }
	T operator*(const vec3<T>& other) const { return x*other.x + y*other.y + z*other.z; }
	
#if 1
	vec3<T> normalize() const { 
		T l = length();
		//if(l == 0)
		//	return *this;
		//else
			return (*this) * (T(1) / length());
	}
#else
	vec3<T> normalize() const { 
		T l = length();
		if(l == 0)
			return *this;
		else
			return vec3<T>(x/l, y/l, z/l);
	}
#endif
};

template<class T>
bool hitSphere(vec3<T> p0, vec3<T> dir, T& t)
{
	const vec3<T> center(0.0f, 0.0f, -6.0f);
	const T r = 1.0f;
	vec3<T> p0c(p0 - center);
	
	/*
	(x-xc)^2 + (y-yc)^2 + (z-zc)^2 = r^2;
	(x0c + dx * t)^2 + (y0c + dy * t)^2 + (z0c + dz * t)^2 = r^2;
	x0c^2 + 2*x0c*dx*t + dx^2*t^2 + y0c^2 + 2*y0c*dy*t + dy^2*t^2 + z0c^2 + 2 * z0c*dz*t + dz^2*t^2 = r^2
	
	(dx^2 + dy^2 + dz^2)*t^2 + (2*x0c*dx + 2*y0c&dy + 2*z0c*dz) * t + x0c^2+y0c^2+z0c^2-r^2
	*/
	T a = dir*dir;
	T b = 2*(p0c*dir);
	T c = p0c*p0c - r*r;
	
	T D = b*b - 4 * a * c;
	
	if(D >= 0)
	{
		t = (-b - sqrt(D)) / (2*a);
		return t >= 0;
	}
	return false;
}


template<class T>
T ray(int n, vec3<T> p0, vec3<T> dir)
{
#if 1
	static const vec3<T> light = vec3<T>(-2,4,3).normalize();
	
	if(1){
		const vec3<T> center(0.0f, 0.0f, -6.0f);
		const T r = 1.0f;
		vec3<T> p0c(p0 - center);
		
		/*
		(x-xc)^2 + (y-yc)^2 + (z-zc)^2 = r^2;
		(x0c + dx * t)^2 + (y0c + dy * t)^2 + (z0c + dz * t)^2 = r^2;
		x0c^2 + 2*x0c*dx*t + dx^2*t^2 + y0c^2 + 2*y0c*dy*t + dy^2*t^2 + z0c^2 + 2 * z0c*dz*t + dz^2*t^2 = r^2
		
		(dx^2 + dy^2 + dz^2)*t^2 + (2*x0c*dx + 2*y0c&dy + 2*z0c*dz) * t + x0c^2+y0c^2+z0c^2-r^2
		*/
		T a = dir*dir;
		T b = 2*(p0c*dir);
		T c = p0c*p0c - r*r;
		
		T D = b*b - 4 * a * c;
		
		if(D >= 0)
		{
			T t = (-b -  sqrt(D)) / (2*a);
			if(t > 0)
			{
				vec3<T> p = p0 + dir * t;
				
				vec3<T> dir2 = p - center;
				
				T l = dir2*dir;
				
				T reflected;
				if(n)
					reflected = ray(n-1, p, dir - dir2*(l*2));
				else
					reflected = 0.0f;
				
				
				T lambert = dir2 * light;
				
				return T(0.2f) + T(0.4f) * std::max(T(0),lambert) + T(0.4f) * reflected;
			}
		}
	}

	if(dir.y < 0)
	{
		T t = (T(-1.5f) - p0.y) / dir.y;
		vec3<T> p = p0 + dir*t;
		
		T color;
		if( (floor_to_int(p.x)
			+ floor_to_int(p.z)) % 2 )
			color = 0.8f;
		else
			color = 0.1f;
		
		T ts;
		if(hitSphere(p, light, ts))
			color *= T(0.2f);
		
		return std::min(T(1), color + T(0.5f) * ray(n-1, p,vec3<T>(dir.x, -dir.y, dir.z)));
	}
#endif
	return std::max(T(0), dir.y * T(0.3f));
}

typedef fixed numtype;


template<class T>
struct rand1
{
	static T get()
	{
		return T(std::rand()) / T(32767.0f * 65536.0f);
	}
};

template<>
struct rand1<fixed>
{
	static fixed get()
	{
		return fixed(std::rand() >> 15, fixed::raw());
	}
};

int main()
{
	WindowPtr win;
	Debugger();
#if !TARGET_API_MAC_CARBON
    InitGraf(&qd.thePort);
    InitFonts();
    InitWindows();
    InitMenus();

	Rect r = qd.screenBits.bounds;
#else
	BitMap bm;
	GetQDGlobalsScreenBits(&bm);
	Rect r = bm.bounds;
#endif    
    SetRect(&r, r.left + 5, r.top + 45, r.right - 5, r.bottom -5);
    win = NewWindow(NULL, &r, PSTR("Raytracer"), true, 0, (WindowPtr)-1, false, 0);
    
#if !TARGET_API_MAC_CARBON	
	SetPort(win);
	r = win->portRect;
#else
	SetPortWindowPort(win);
	GetPortBounds(GetWindowPort(win), &r);
#endif
    EraseRect(&r);
	numtype accum = 0.0f;
	short cx = r.right /2;
	short cy = r.bottom / 2;
	
	long startTime = TickCount();
	std::vector<numtype> accumV(r.right);
	BitMap line;
	std::vector<unsigned char> bits(((r.right + 31) / 8) & ~0x3);
	SetRect(&line.bounds, 0,0,r.right,1);
	line.rowBytes = bits.size();
	line.baseAddr = (char*)(&bits[0]);
	
	for(int y = 0; y < r.bottom; y++)
	{
		std::fill(bits.begin(),bits.end(), 0);
		for(int x = 0; x < r.right; x++)
		{
			numtype pixel;
			
			// cam = (0,0,0)
			// ray = t * (x-r.right/2, - (y-r.bottom/2), -1)
			// plane: y = -2
			pixel = ray(1,vec3<numtype>(),vec3<numtype>(numtype(x-cx)/numtype(cx),-numtype(y-cy)/numtype(cx),-1).normalize());

			numtype thresh = rand1<numtype>::get();
			
			thresh = numtype(0.5f) + numtype(0.4f) * (thresh - numtype(0.5f));
			accum += pixel;
			accum += accumV[x];
			if(accum >= thresh)
				accum -= 1;
			else
			{
				//MoveTo(x,y);
				//Line(0,0);
				bits[x / 8] |= (0x80 >> (x%8));
			}
			accumV[x] = accum = accum / numtype(2);			
		}
		Rect r2;
		SetRect(&r2,0,y,r.right,y+1);
		CopyBits(&line, &win->portBits, &line.bounds, &r2, srcCopy, NULL);
		if(Button())
			return 0;
#if TARGET_API_MAC_CARBON
//		QDFlushPortBuffer(GetWindowPort(win),NULL);
#endif
	}
	long endTime = TickCount();
	
	char buf[256];
	unsigned char* pstr = (unsigned char*)buf;
	std::sprintf(buf+1, "pps = %d", (int)( (long)r.right * r.bottom * 60 / (endTime - startTime) ));
	buf[0] = std::strlen(buf+1);
	
	SetRect(&r, 10, 10, 10 + StringWidth(pstr) + 10, 30);
	PaintRect(&r);
	PenMode(patXor);
	FrameRect(&r);
	MoveTo(15,25);
	TextMode(srcBic);
	DrawString(pstr);
#if TARGET_API_MAC_CARBON
	QDFlushPortBuffer(GetWindowPort(win),NULL);
#endif
	
	while(!Button())
		;
	FlushEvents(everyEvent, -1);
	return 0;
}
