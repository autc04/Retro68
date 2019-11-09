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

/*
    Library source file exporting two functions.
    Note that Retro68 does not yet correctly implement exporting variables.
 */

#include "library.h"
#include <Sound.h>

void beep()
{
    SysBeep(20);
}

/*
 * is_computer_on
 * 
 * For compatibility with BeOS ;-)
 * 
 * Returns true if the computer is currently powered on.
 * Note that a function by this name was an actual, documented part
 * of the BeOS API.
 */
Boolean is_computer_on()
{
    return true;
}
