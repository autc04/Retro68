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

#include "Processes.r"
#include "Menus.r"
#include "Windows.r"
#include "MacTypes.r"
#include "Finder.r"
#include "Dialogs.r"

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
        "Close", noIcon, "W", noMark, plain;
        "-", noIcon, noKey, noMark, plain;
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
    "Connection";
    {
        "MacTCP", noIcon, noKey, noMark, plain;
        "OpenTransport TCP", noIcon, noKey, noMark, plain;
        "Modem Port", noIcon, noKey, noMark, plain;
        "Printer Port", noIcon, noKey, noMark, plain;
        "Shared Files", noIcon, noKey, noMark, plain;
        "-", noIcon, noKey, noMark, plain;
        "9600", noIcon, noKey, noMark, plain;
        "19200", noIcon, noKey, check, plain;
        "38400", noIcon, noKey, noMark, plain;
        "57600", noIcon, noKey, noMark, plain;
        "115200", noIcon, noKey, noMark, plain;
        "230400", noIcon, noKey, noMark, plain;
        "-", noIcon, noKey, noMark, plain;
        "Choose Shared Directory...", noIcon, noKey, noMark, plain;
    }
};


resource 'MBAR' (128) {
    { 128, 129, 130, 131 };
};

data 'TEXT' (128, purgeable) {
    "This application is the counterpart to Retro68's LaunchAPPL tool.\r"
    "\r"
    "It will listen via TCP or via serial port for applications sent by "
    "the LaunchAPPL tool from a modern system and execute it on this Mac.\r"
    "\r"
    "Pick your connection type from the \"Connection\" menu. "
    "Not all connection types are available on all Macs and system software versions."

};

resource 'WIND' (128, "About") {
    {0, 0, 242, 320}, noGrowDocProc;
    invisible;
    goAway;
    0, "About LaunchAPPLServer";
    noAutoCenter;
};

resource 'WIND' (129, "Main") {
    {50, 10, 200, 400}, noGrowDocProc;
    invisible;
    noGoAway;
    0, "Retro68 Application Launching Server";
    centerMainScreen;
};

resource 'STR#' (128, purgeable) {
    {
        "Listening on Modem Port...";
        "Listening on Printer Port...";
        "Listening on TCP port 1984 (MacTCP)...";
        "Listening on TCP port 1984 (OpenTransport)...";
        "Waiting for shared files...";
        "Downloading Application...";
        "Downloading Upgrade...";
        "Running Application...";
        "Sending Results...";
    }
};

resource 'STR#' (129, purgeable) {
    {
        "Heap Size:", " KB";
        "Free Memory:", " KB";
        "File Size:", " KB";
        "Transferred:", " KB";
        "Speed:", " B/s";
        "Time remaining:", " s";
        "Transmission errors:", "";
    }
};

resource 'SIZE' (-1) {
	reserved,
	acceptSuspendResumeEvents,
	reserved,
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
	500 * 1024,
	136 * 1024
};

type 'R68L' as 'STR ';
resource 'R68L' (0, purgeable) {
    "LaunchAPPLServer (c) 2018"
};

resource 'FREF' (128, purgeable) {
    'APPL',
    0,
    ""
};

resource 'BNDL' (128, purgeable) {
    'R68L',
    0,
    {
        'ICN#', {
            0, 128
        },
        'FREF', {
            10, 128
        }
    }
};

resource 'DLOG' (128, purgeable)
{
	{0, 0, 225, 348},
	dBoxProc,
	invisible,
	noGoAway,
	0x0,
	128,
	"",
	noAutoCenter
};

resource 'DITL' (128, purgeable)
{
	{
		/* [1] */
		{138, 256, 156, 336},
		Button { enabled, "Open" },
		/* [2] */
		{1152, 59, 1232, 77},
		Button { enabled, "" },
		/* [3] */
		{188, 256, 206, 336},
		Button { enabled, "Cancel" },
		/* [4] */
		{39, 232, 59, 347},
		UserItem { disabled },
		/* [5] */
		{68, 256, 86, 336},
		Button { enabled, "Eject" },
		/* [6] */
		{93, 256, 111, 336},
		Button { enabled, "Drive" },
		/* [7] */
		{39, 12, 210, 230},
		UserItem { enabled },
		/* [8] */
		{39, 229, 210, 246},
		UserItem { enabled },
		/* [9] */
		{124, 252, 125, 340},
		UserItem { disabled },
		/* [10] */
		{1044, 20, 1145, 116},
		StaticText { disabled, "" },
		/* [11] */
        {163, 256, 181, 336},
		Button { enabled, "Choose" }
	}
};

resource 'DLOG' (129, purgeable)
{
    {0, 0, 200, 344}, dBoxProc, invisible, noGoAway, 0,
    129, "", noAutoCenter
};
resource 'DITL'(129)
{
    {
        {169, 252, 189, 332}, Button { enabled, "Open" },
        {107, 252, 127, 332}, Button { enabled, "Cancel" },
        {0, 0, 0, 0}, HelpItem { disabled, HMScanhdlg {-6042}},
        {8, 235, 24, 337}, UserItem { enabled },
        {32, 252, 52, 332}, Button { enabled, "Eject" },
        {60, 252, 80, 332}, Button { enabled, "Desktop" },
        {29, 12, 193, 230}, UserItem { enabled },
        {6, 12, 25, 230}, UserItem { enabled },
        {93, 251, 94, 333}, Picture  { disabled, 11 },
        {138, 252, 158, 332}, Button { enabled, "Choose" },
    }
};
