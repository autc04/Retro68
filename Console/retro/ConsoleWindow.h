/*
    Copyright 2012-2020 Wolfgang Thaller, Davide Bucci

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

#include <Windows.h>
#include <vector>
#include <string>

#include "Console.h"

namespace retro
{
    class ConsoleWindow : public Console
    {
    public:
        ConsoleWindow(Rect r, ConstStr255Param title);
        ~ConsoleWindow();
    private:
        WindowPtr win;

        virtual char WaitNextChar();
    };
}
