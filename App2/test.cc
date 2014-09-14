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

#include <stdio.h>
#include <string.h>
#include <string>
#include <sstream>
#include <cstdlib>
#include <iostream>

#include <Quickdraw.h>
#include <MacMemory.h>
#include <Sound.h>
#include <Events.h>
#include <Fonts.h>

#include "MacUtils.h"
#include "Console.h"

QDGlobals qd;
__attribute((constructor))
void cons()
{
	SysBeep(20);
}

//float something = 6.0;

class Foo
{
};

void foobar()
{
	throw Foo();
}

void foobaz()
{
}

extern ssize_t (*__write_hook)(int fd, const void*buf, size_t count);

extern "C" ssize_t consolewrite(int fd, const void *buf, size_t count)
{
	const char *p = (const char*)buf;
	for(int i = 0; i < count; i++)
		Console::currentInstance->putch(*p++);
	return count;
}

extern ssize_t (*__read_hook)(int fd, void*buf, size_t count);

extern "C" ssize_t consoleread(int fd, void *buf, size_t count)
{
	static std::string consoleBuf;
	if(consoleBuf.size() == 0)
	{
		consoleBuf = Console::currentInstance->ReadLine() + "\n";
	}
	if(count > consoleBuf.size())
		count = consoleBuf.size();
	memcpy(buf, consoleBuf.data(), count);
	consoleBuf = consoleBuf.substr(count);
	return count;
}

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
	__read_hook = &consoleread;

	printf("Hello, world.\n");
	std::cout << "Hello, world, again.\n";

	printf("Say something: ");
	fflush(stdout);
	printf("You said: %s\n", console.ReadLine().c_str());

	char buffer[100];
	printf("Say something else: ");
	fflush(stdout);
	fgets(buffer, 100, stdin);
	printf("You said: %s\n", buffer);


	for(int i = 0; i < 5; i++)
	{
		int n = i == 0 ? 1 : 100;
		printf("Exception speed test (%3d iterations): ", n); fflush(stdout);
		long start = TickCount();
		for(int j = 0; j < n; j++)
		{
			try { foobar(); } catch(...) {}
		}
		long end = TickCount();

		printf("%g ms per throw/catch\n",(end-start)*1000 / 60.0 / n);
	}

	const int n = 3;
	printf("Click mouse %d times...\n", n);
	for(int i = 0; i < n; i++)
	{
		while(!Button())
			;
		while(Button())
			;
		printf("Click #%d\n", i+1);
	}
	FlushEvents(everyEvent, 0);
	return 0;
}
