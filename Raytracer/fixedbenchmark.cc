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

#include <iostream>
#include <cstdlib>
#include <cstdio>


#include <Quickdraw.h>
#include <MacMemory.h>
#include <Sound.h>
#include <Events.h>
#include <Fonts.h>

#include "MacUtils.h"
#include "Console.h"

QDGlobals qd;

extern ssize_t (*__write_hook)(int fd, const void*buf, size_t count);

extern "C" ssize_t consolewrite(int fd, const void *buf, size_t count)
{
	const char *p = (const char*)buf;
	for(int i = 0; i < count; i++)
		Console::currentInstance->putch(*p++);
	return count;
}

#include "fixed.h"

class timer
{
	long t;
public:
	timer() : t(TickCount()) {}
	float elapsed() { return (TickCount() - t) / 60.15f; }
};
int main(int argc, char** argv)
{
	//GrafPort port;
	WindowPtr win;
	InitGraf(&qd.thePort);
	InitFonts();
	InitWindows();
	InitMenus();
	
	Rect r;
	SetRect(&r, qd.screenBits.bounds.left + 5, qd.screenBits.bounds.top + 45, qd.screenBits.bounds.right - 5, qd.screenBits.bounds.bottom -5);
	win = NewWindow(NULL, &r, PSTR("Retro68 Console"), true, 0, (WindowPtr)-1, false, 0);
	
	SetPort(win);
	EraseRect(&win->portRect);
	new char[32];
	Console console(win, win->portRect);
	__write_hook = &consolewrite;
	
	std::cout << "Hello, world.\n";
	
	std::cout << "Generating numbers..." << std::flush;
	
	const int n = 1000;   
	std::vector<fixed> numbers(n);
	for(int i = 0; i < numbers.size(); i++)
		numbers[i] = fixed(std::rand(), fixed::raw());
	std::vector<fixed> outputs(n);
	
	
	std::cout << "done.\n";
	
	std::cout << "Testing Multiplication..." << std::flush;
	{
		timer t;
		for(int i = 0; i < n; i++)
		{
			outputs[i] = numbers[i] * numbers[n - i - 1];
		}
		std::cout << 1000 * t.elapsed() / n << "ms\n";
	}
	
	std::cout << "Testing Division..." << std::flush;
	{
		timer t;
		for(int i = 0; i < n; i++)
		{
			outputs[i] = numbers[i] / numbers[n - i - 1];
		}
		std::cout << 1000 * t.elapsed() / n << "ms\n";
	}

	std::cout << "Testing Square Root..." << std::flush;
	{
		timer t;
		for(int i = 0; i < n; i++)
		{
			outputs[i] = sqrt(numbers[i]);
		}
		std::cout << 1000 * t.elapsed() / n << "ms\n";
	}

	std::cout << "Press Enter to Exit ;-)\n";
	
	console.ReadLine();
	
	return 0;
}
