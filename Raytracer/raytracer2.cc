/*
    Copyright 2012 Wolfgang Thaller.

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

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

#include "fixed.h"

#include <cmath>
#include <algorithm>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <cstdio>

using std::sqrt;
using std::floor;



inline int floor_to_int(float f)
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
	const vec3<T> center(0.0f, 1.0f, -6.0f);
	const T r = 2.0f;
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
		const vec3<T> center(0.0f, 1.0f, -6.0f);
		const T r = 2.0f;
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
				
				vec3<T> dir2 = (p - center) * (T(1)/r);
				
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
	win = NewWindow(NULL, &r, "\pRaytracer (C++ Version)", true, 0, (WindowPtr)-1, false, 0);
    
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
	
	numtype preRandoms[29*31];
	for(int i = 0; i < 29*31; i++)
	{
		numtype thresh = rand1<numtype>::get();
		thresh = numtype(0.5f) + numtype(0.4f) * (thresh - numtype(0.5f));
		preRandoms[i] = thresh;
	}
	int randIdx = 0;

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

			numtype thresh = preRandoms[randIdx++];
			if(randIdx == 29*31)
				randIdx = 0;
			
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
	std::sprintf(buf+1, "pps = %d %ld %ld %ld %ld", (int)( (long)r.right * r.bottom * 60 / (endTime - startTime) ),
	             fixed::nMul, fixed::nIMul, fixed::nDiv, fixed::nSqrt);
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
