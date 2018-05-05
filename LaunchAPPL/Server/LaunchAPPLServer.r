/*
	Copyright 2018 Wolfgang Thaller.

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

#include "Processes.r"
#include "Menus.r"
#include "Windows.r"
#include "MacTypes.r"

resource 'MENU' (128) {
    128, textMenuProc;
    allEnabled, enabled;
    apple;
    {
        "About LaunchAPPLServer...", noIcon, noKey, noMark, plain;
        "-", noIcon, noKey, noMark, plain;
    }
};

resource 'MENU' (129) {
    129, textMenuProc;
    allEnabled, enabled;
    "File";
    {
        "Quit", noIcon, "Q", noMark, plain;
    }
};

resource 'MENU' (130) {
    130, textMenuProc;
    0, enabled;
    "Edit";
    {
        "Undo", noIcon, "Z", noMark, plain;
        "-", noIcon, noKey, noMark, plain;
        "Cut", noIcon, "X", noMark, plain;
        "Copy", noIcon, "C", noMark, plain;
        "Paste", noIcon, "V", noMark, plain;
        "Clear", noIcon, noKey, noMark, plain;
    }
};

resource 'MENU' (131) {
    131, textMenuProc;
    allEnabled, enabled;
    "Speed";
    {
        "9600", noIcon, noKey, noMark, plain;
        "19200", noIcon, noKey, check, plain;
        "38400", noIcon, noKey, noMark, plain;
        "57600", noIcon, noKey, noMark, plain;
        "115200", noIcon, noKey, noMark, plain;
        "230400", noIcon, noKey, noMark, plain;
    }
};


resource 'MBAR' (128) {
    { 128, 129, 130, 131 };
};

data 'TEXT' (128) {
    "About LaunchAPPLShell\r\r"
    "Listens on the modem port for an application sent by Retro68's LaunchAPPL tool."
};

resource 'WIND' (128, "About") {
    {0, 0, 150, 320}, altDBoxProc;
    invisible;
    noGoAway;
    0, "";
    noAutoCenter;
};

resource 'WIND' (129, "Main") {
    {50, 10, 200, 400}, noGrowDocProc;
    visible;
    noGoAway;
    0, "Retro68 Application Launching Server";
    centerMainScreen;
};

resource 'STR#' (128) {
    {
        "Listening on Modem Port...";
        "Downloading Application...";
        "Running Application...";
        "Sending Results...";
    }
};



resource 'SIZE' (-1) {
	dontSaveScreen,
	acceptSuspendResumeEvents,
	enableOptionSwitch,
	canBackground,
	multiFinderAware,
	backgroundAndForeground,
	dontGetFrontClicks,
	ignoreChildDiedEvents,
	is32BitCompatible,
	isHighLevelEventAware,
	onlyLocalHLEvents,
	notStationeryAware,
	dontUseTextEditServices,
	notDisplayManagerAware,
	reserved,
	reserved,
	150 * 1024,
	136 * 1024
};
