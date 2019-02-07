#ifndef MINIVMAC_H
#define MINIVMAC_H

#include "LaunchMethod.h"


/* Adapted from http://sebastien.kirche.free.fr/python_stuff/MacOS-aliases.txt */
typedef struct
{
    int16_t type;                           /* type of data */
    int16_t size;                           /* length of variable length data */
    char data[];                            /* actual data */
} VarData;

typedef struct
{
    /* Type Code: alis */
    char userType[4] = {0, 0, 0, 0};        /* for application use, can be zeros */
    uint16_t size;                          /* alias record size, including variable length data */
    int16_t version = 2;                    /* alias version, current 2 */
    int16_t type = 0;                       /* file = 0, directory = 1 */
    char volumeNameSize;
    char volumeName[27];                    /* volume name */
    uint32_t volumeCreationDate;            /* volume creation date, seconds since 1904 */
    uint16_t volumeSig = 0x4244; /*BD*/     /* volume signature MFS = RW, HFS = BD */
    int16_t volumeType = 5;                 /* [HD] = 0, Foreign = 1, Floppy: 400K, 800K, 1400K = 2-4, OtherEjectable = 5 */
    int32_t parentDirID;                    /* parent directory ID, 0 for relative searches */
    char fileNameSize;
    char fileName[63];                      /* file or directory name */
    int32_t fileNum;                        /* file number or directory ID */
    uint32_t fileCreationDate;              /* file or directory creation date, seconds since 1904 */
    char typeCode[4];                       /* file type */
    char creatorCode[4];                    /* file's creator */
    int16_t nlvlFrom = 0;                   /* next level up from alias, used in relative searches */
    int16_t nlvlTo = 0;                     /* next level down to target, ditto */
    uint32_t volumeAttr = 0;                /* various flags (locked, ejectable), see link above */
    int16_t volumeFSID = 0;                 /* file system ID for the volume, 0 for MFS, HFS */
    int16_t unused = 0;
    uint32_t unused1 = 0;
    uint32_t unused2 = 0;
    VarData vdata[];                        /* variable length data, see link above */
} AliasData;


class MiniVMac : public LaunchMethod
{
public:
	virtual std::string GetName() { return "minivmac"; }
	virtual void GetOptions(options_description& desc);
	virtual bool CheckOptions(variables_map& options);

	virtual std::unique_ptr<Launcher> MakeLauncher(variables_map& options);
};

#endif // MINIVMAC_H
