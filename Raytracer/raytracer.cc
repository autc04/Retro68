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

#include "MacUtils.h"

QDGlobals qd;

#endif


#include <cmath>
#include <algorithm>
#include <cstdlib>
#include <cstring>
#include <vector>

bool hitSphere(float x0, float y0, float z0, float dx, float dy, float dz, float& t)
{
	const float xc = 0.0f, yc = 0.0f, zc = -6.0f, r = 1.0f;
	float x0c = x0 - xc;
	float y0c = y0 - yc;
	float z0c = z0 - zc;
	
	/*
	(x-xc)^2 + (y-yc)^2 + (z-zc)^2 = r^2;
	(x0c + dx * t)^2 + (y0c + dy * t)^2 + (z0c + dz * t)^2 = r^2;
	x0c^2 + 2*x0c*dx*t + dx^2*t^2 + y0c^2 + 2*y0c*dy*t + dy^2*t^2 + z0c^2 + 2 * z0c*dz*t + dz^2*t^2 = r^2
	
	(dx^2 + dy^2 + dz^2)*t^2 + (2*x0c*dx + 2*y0c&dy + 2*z0c*dz) * t + x0c^2+y0c^2+z0c^2-r^2
	*/
	float a = dx*dx + dy*dy + dz*dz;
	float b = 2*(x0c*dx + y0c*dy + z0c*dz);
	float c = x0c*x0c + y0c*y0c + z0c*z0c -r*r;
	
	float D = b*b - 4 * a * c;
	
	if(D >= 0)
	{
		t = (-b - std::sqrt(D)) / (2*a);
		return t >= 0;
	}
	return false;
}
const float lx = -2, ly = 4, lz = 3;
const float lenl = 1.0f / std::sqrt(lx*lx + ly*ly + lz*lz);
const float lxn = lx*lenl, lyn = ly*lenl, lzn = lz*lenl;

float ray(int n, float x0, float y0, float z0, float dx, float dy, float dz)
{
	{
		const float xc = 0.0f, yc = 0.0f, zc = -6.0f, r = 1.0f;
		float x0c = x0 - xc;
		float y0c = y0 - yc;
		float z0c = z0 - zc;
		
		/*
		(x-xc)^2 + (y-yc)^2 + (z-zc)^2 = r^2;
		(x0c + dx * t)^2 + (y0c + dy * t)^2 + (z0c + dz * t)^2 = r^2;
		x0c^2 + 2*x0c*dx*t + dx^2*t^2 + y0c^2 + 2*y0c*dy*t + dy^2*t^2 + z0c^2 + 2 * z0c*dz*t + dz^2*t^2 = r^2
		
		(dx^2 + dy^2 + dz^2)*t^2 + (2*x0c*dx + 2*y0c&dy + 2*z0c*dz) * t + x0c^2+y0c^2+z0c^2-r^2
		*/
		float a = dx*dx + dy*dy + dz*dz;
		float b = 2*(x0c*dx + y0c*dy + z0c*dz);
		float c = x0c*x0c + y0c*y0c + z0c*z0c -r*r;
		
		float D = b*b - 4 * a * c;
		
		if(D >= 0)
		{
			float t = (-b -  std::sqrt(D)) / (2*a);
			if(t > 0)
			{
				float x = x0 + dx * t;
				float y = y0 + dy * t;
				float z = z0 + dz * t;
				
				float dx2 = x - xc;
				float dy2 = y - yc;
				float dz2 = z - zc;
				
				
				float l = dx2 * dx + dy2 * dy + dz2 * dz;
				l *= 2;
				
				float reflected;
				if(n)
					reflected = ray(n-1, x,y,z, dx - l*dx2, dy - l*dy2, dz - l*dz2);
				else
					reflected = 0.0f;
				
				
				float lambert = dx2 * lxn + dy2 * lyn + dz2 * lzn;
				
				return 0.2f + 0.4f * std::max(0.0f,lambert) + 0.4f * reflected;
			}
		}
	}

	if(dy < 0)
	{
		float t = (-1.5f - y0) / dy;
		float x = x0 + dx * t;
		float z = z0 + dz * t;
		
		float color;
		if( (static_cast<int>( std::floor(x) )
			+ static_cast<int>( std::floor(z) )) % 2 )
			color = 0.8f;
		else
			color = 0.1f;
		
		float ts;
		if(hitSphere(x,-1.5f,z, lxn, lyn, lzn, ts))
			color *= 0.2f;
		
		return std::min(1.0f, color + 0.5f * ray(n-1, x,-2.0f,z,dx,-dy,dz));
	}
	
	return std::max(0.0f, dy * 0.3f);
}

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
    win = NewWindow(NULL, &r, PSTR("Raytracer"), true, 0, (WindowPtr)-1, false, 0);
    
#if !TARGET_API_MAC_CARBON	
	SetPort(win);
	r = win->portRect;
#else
	SetPortWindowPort(win);
	GetPortBounds(GetWindowPort(win), &r);
#endif
    EraseRect(&r);
	float accum = 0.0f;
	short cx = r.right /2;
	short cy = r.bottom / 2;
	
	long startTime = TickCount();
	std::vector<float> accumV(r.right);
	for(int y = 0; y < r.bottom; y++)
	{
		for(int x = 0; x < r.right; x++)
		{
			float pixel;
			
			// cam = (0,0,0)
			// ray = t * (x-r.right/2, - (y-r.bottom/2), -1)
			// plane: y = -2
			
			float dx = x - cx;
			float dy = - (y - cy);
			float dz = -cx;
			float n1 = 1.0f / std::sqrt(dx*dx + dy*dy + dz*dz);
			
			pixel = ray(1,0,0,0,n1*dx,n1*dy,n1*dz);
			
#if 0
			accum += pixel;
			if(accum >= 0.5f)
				accum -= 1.0f;
			else
			{
				MoveTo(x,y);
				Line(0,0);
			}
#elif 0
			accum += pixel;
			accum += accumV[x];
			if(accum >= 0.5f)
				accum -= 1.0f;
			else
			{
				MoveTo(x,y);
				Line(0,0);
			}
			accumV[x] = accum = accum / 2;
#elif 0			
			//if(pixel < Random() / 32767.0)
			if(pixel < (float)std::rand() / (32767.0f * 65536.0f))
			{
				MoveTo(x,y);
				Line(0,0);
			}
#else
			float thresh = (float)std::rand() / (32767.0f * 65536.0f);
			thresh = 0.5f + 0.4f * (thresh - 0.5f);
			accum += pixel;
			accum += accumV[x];
			if(accum >= thresh)
				accum -= 1.0f;
			else
			{
				MoveTo(x,y);
				Line(0,0);
			}
			accumV[x] = accum = accum / 2;			
#endif
		}
		if(Button())
			return 0;
#if TARGET_API_MAC_CARBON
//		QDFlushPortBuffer(GetWindowPort(win),NULL);
#endif
	}
	long endTime = TickCount();
	
	char buf[256];
	unsigned char* pstr = (unsigned char*)buf;
	std::sprintf(buf+1, "pps = %d", (int)( (float)r.right * r.bottom / (endTime - startTime) * 60.0f ));
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
