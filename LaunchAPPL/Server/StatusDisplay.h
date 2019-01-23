/*
    Copyright 2019 Wolfgang Thaller.

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

#include <MacTypes.h>
#include <Windows.h>
#include <TextUtils.h>

#include "Window.h"
#ifdef DEBUG_CONSOLE
#include <retro/Console.h>
#endif

enum class AppStatus
{
    empty = 0,
    readyModem = 1,
    readyPrinter,
    readyMacTCP,
    readyOpenTpt,
    readySharedFiles,
    downloading,
    upgrading,
    running,
    uploading
};

class StatusDisplay : public Window
{
    WindowPtr statusWindow;
    Str255 statusString = "\p";
    AppStatus status = AppStatus::empty;
    int progressDone, progressTotal = 0;
    long freeMem;
    long startTime;
    long speed = -1;
    long timeRemaining = -1;
    int errorCount = -1;

    RgnHandle background;
    Rect statusRect;
    Rect progressRect;

    static const int nValues = 7;
    Rect valueRects[nValues];
    short columnWidths[6];

    PixPatHandle progressBg, progressFg;

#ifdef DEBUG_CONSOLE
    Rect consoleRect;
    retro::Console console;
#endif

    enum class Stat : short;

    void DrawValue(Stat stat, ConstStr255Param str);
    void DrawValue(Stat stat, long val);
    void Inval(const Rect& r);

public:
    StatusDisplay();
    ~StatusDisplay();

    WindowPtr GetWindow() { return statusWindow; }
    virtual void Update() override;

    void Idle();

    void SetStatus(AppStatus s);
    void SetProgress(int done = 0, int total = 0);
    void SetStatus(AppStatus stat, int done, int total);
    void SetErrorCount(int errorCount);
};
