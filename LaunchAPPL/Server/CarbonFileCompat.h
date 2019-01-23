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

#include <Files.h>

#if TARGET_API_MAC_CARBON
inline OSErr Create(ConstStr255Param fileName, short vRefNum, OSType creator, OSType fileType)
{
    return HCreate(vRefNum, 0, fileName, creator, fileType);
}

inline OSErr OpenDF(ConstStr255Param fileName, short vRefNum, short *refNum)
{
    return HOpenDF(vRefNum, 0, fileName, fsCurPerm, refNum);
}

inline OSErr OpenRF(ConstStr255Param fileName, short vRefNum, short *refNum)
{
    return HOpenRF(vRefNum, 0, fileName, fsCurPerm, refNum);
}

inline OSErr FSDelete(ConstStr255Param fileName, short vRefNum)
{
    return HDelete(vRefNum, 0, fileName);
}

inline OSErr Rename(ConstStr255Param oldName, short vRefNum, ConstStr255Param newName)
{
    return HRename(vRefNum, 0, oldName, newName);
}
#endif
