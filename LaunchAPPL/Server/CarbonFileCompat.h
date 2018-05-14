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
