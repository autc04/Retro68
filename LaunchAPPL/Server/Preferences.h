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

#pragma once

#include <MacTypes.h>

enum class Port : int
{
    modemPort = 0,
    printerPort,
    macTCP,
    openTptTCP,
    sharedFiles
};

struct Prefs
{
    const static int currentVersion = 2;
    int version = currentVersion;
    Port port = Port::modemPort;
    long baud = 19200;
    bool inSubLaunch = false;
    Str255 sharedDirectoryPath;
};

extern Prefs gPrefs;

void ChooseSharedDirectory();

void ReadPrefs();
void WritePrefs();
