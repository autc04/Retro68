/*
	 Copyright 2014 Wolfgang Thaller.

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

#include <string>

#include <Quickdraw.h>
#include <MacMemory.h>
#include <Sound.h>
#include <Events.h>
#include <Fonts.h>

#include <sys/types.h>
#include <string.h>

#include "MacUtils.h"
#include "Console.h"

QDGlobals qd;

void InitConsole()
{
	if(Console::currentInstance)
		return;

	WindowPtr win;
	InitGraf(&qd.thePort);
	InitFonts();
	InitWindows();
	InitMenus();
	
	Rect r;
	SetRect(&r, qd.screenBits.bounds.left + 5, qd.screenBits.bounds.top + 45, qd.screenBits.bounds.right - 5, qd.screenBits.bounds.bottom -5);
	win = NewWindow(NULL, &r, "\pRetro68 Console", true, 0, (WindowPtr)-1, false, 0);
	
	SetPort(win);
	EraseRect(&win->portRect);

	Console *console = new Console(win, win->portRect);
}

extern "C" ssize_t consolewrite(int fd, const void *buf, size_t count)
{
	if(!Console::currentInstance)
		InitConsole();

	Console::currentInstance->write((const char*)buf, count);
	return count;
}

extern "C" ssize_t consoleread(int fd, void *buf, size_t count)
{
	if(!Console::currentInstance)
		InitConsole();

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
