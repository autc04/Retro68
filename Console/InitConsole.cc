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

namespace Retro
{
	void InitConsole();
}

using namespace Retro;

void Retro::InitConsole()
{
	if(Console::currentInstance)
		return;

	WindowPtr win;
	GrafPtr port;
	
#if !TARGET_API_MAC_CARBON
	InitGraf(&qd.thePort);
	InitFonts();
	InitWindows();
	InitMenus();

	Rect r = qd.screenBits.bounds;
#else
	Rect r = (*GetMainDevice())->gdRect;
#endif

	r.top += 40;
	InsetRect(&r, 5,5);
	win = NewWindow(NULL, &r, "\pRetro68 Console", true, 0, (WindowPtr)-1, false, 0);

#if !TARGET_API_MAC_CARBON
	port = win;
	Rect portRect = port->portRect;
#else
	port = GetWindowPort(win);
	Rect portRect;
	GetPortBounds(port, &portRect);
#endif

	SetPort(port);
	EraseRect(&portRect);

	Console *console = new Console(port, portRect);
}

extern "C" ssize_t _consolewrite(int fd, const void *buf, size_t count)
{
	if(!Console::currentInstance)
		InitConsole();
	if(Console::currentInstance == (Console*)-1)
		return 0;

	Console::currentInstance->write((const char*)buf, count);
	return count;
}

extern "C" ssize_t _consoleread(int fd, void *buf, size_t count)
{
	if(!Console::currentInstance)
		InitConsole();
	if(Console::currentInstance == (Console*)-1)
		return 0;

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
