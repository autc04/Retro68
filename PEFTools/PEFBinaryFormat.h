// PEFBinaryFormat.h from the Multiversal Interfaces
// generated from executor source code

/*****************************************************************************
 *                                                                           *
 *                             PEFBinaryFormat.h                             *
 *                             =================                             *
 *                                                                           *
 * Needs:                                                                    *
 *     MacTypes.h    OSType                                                  *
 *                                                                           *
 *                                                                           *
 *****************************************************************************/


#pragma pack(push, 2)


/*****************************************************************************/
enum
{
    kPEFTag1 = 'Joy!',
    kPEFTag2 = 'peff',
    kPEFVersion = 1,
};

/*****************************************************************************/
enum
{
    kPEFProcessShare = 1,
    kPEFGlobalShare = 4,
    kPEFProtectedShare = 5,
};

/*****************************************************************************/
enum
{
    kPEFCodeSection = 0,
    kPEFUnpackedDataSection,
    kPEFPatternDataSection,
    kPEFConstantSection,
    kPEFLoaderSection,
    kPEFDebugSection,
    kPEFExecutableDataSection,
    kPEFExceptionSection,
    kPEFTracebackSection,
};

/*****************************************************************************/
enum
{
    kPEFCodeSymbol,
    kPEFDataSymbol,
    kPEFTVectorSymbol,
    kPEFTOCSymbol,
    kPEFGlueSymbol,
};

/*****************************************************************************
 * flags for PEFImportedLibrary::options                                     *
 *****************************************************************************/
enum
{
    kPEFWeakImportLibMask = 64,
    kPEFInitLibBeforeMask = 128,
};

/*****************************************************************************
 *                             PEFContainerHeader                            *
 *****************************************************************************/
typedef struct PEFContainerHeader PEFContainerHeader;
struct PEFContainerHeader
{
    OSType tag1;
    OSType tag2;
    OSType architecture;
    uint32_t formatVersion;
    uint32_t dateTimeStamp;
    uint32_t oldDefVersion;
    uint32_t oldImpVersion;
    uint32_t currentVersion;
    uint16_t sectionCount;
    uint16_t instSectionCount;
    uint32_t reservedA;
};


/*****************************************************************************/
enum
{
    kPEFFirstSectionHeaderOffset = sizeof(PEFContainerHeader),
};

/*****************************************************************************
 *                              PEFSectionHeader                             *
 *****************************************************************************/
typedef struct PEFSectionHeader PEFSectionHeader;
struct PEFSectionHeader
{
    int32_t nameOffset;
    uint32_t defaultAddress;
    uint32_t totalLength;
    uint32_t unpackedLength;
    uint32_t containerLength;
    uint32_t containerOffset;
    uint8_t sectionKind;
    uint8_t shareKind;
    uint8_t alignment;
    uint8_t reservedA;
};


/*****************************************************************************
 *                            PEFLoaderInfoHeader                            *
 *****************************************************************************/
typedef struct PEFLoaderInfoHeader PEFLoaderInfoHeader;
struct PEFLoaderInfoHeader
{
    int32_t mainSection;
    uint32_t mainOffset;
    int32_t initSection;
    uint32_t initOffset;
    int32_t termSection;
    uint32_t termOffset;
    uint32_t importedLibraryCount;
    uint32_t totalImportedSymbolCount;
    uint32_t relocSectionCount;
    uint32_t relocInstrOffset;
    uint32_t loaderStringsOffset;
    uint32_t exportHashOffset;
    uint32_t exportHashTablePower;
    uint32_t exportedSymbolCount;
};


/*****************************************************************************
 *                             PEFImportedLibrary                            *
 *****************************************************************************/
typedef struct PEFImportedLibrary PEFImportedLibrary;
struct PEFImportedLibrary
{
    uint32_t nameOffset;
    uint32_t oldImpVersion;
    uint32_t currentVersion;
    uint32_t importedSymbolCount;
    uint32_t firstImportedSymbol;
    uint8_t options;
    uint8_t reservedA;
    uint16_t reservedB;
};


/*****************************************************************************
 *                         PEFLoaderRelocationHeader                         *
 *****************************************************************************/
typedef struct PEFLoaderRelocationHeader PEFLoaderRelocationHeader;
struct PEFLoaderRelocationHeader
{
    uint16_t sectionIndex;
    uint16_t reservedA;
    uint32_t relocCount;
    uint32_t firstRelocOffset;
};


/*****************************************************************************/
enum
{
    kExponentLimit = 16,
    kAverageChainLimit = 10,
};

/*****************************************************************************/
enum
{
    kPEFHashLengthShift = 16,
    kPEFHashValueMask = 65535,
};

/*****************************************************************************/
enum
{
    FIRST_INDEX_SHIFT = 0,
    FIRST_INDEX_MASK = 262143,
    CHAIN_COUNT_SHIFT = 18,
    CHAIN_COUNT_MASK = 16383,
};

/*****************************************************************************
 *                             PEFExportedSymbol                             *
 *****************************************************************************/
typedef struct PEFExportedSymbol PEFExportedSymbol;
struct PEFExportedSymbol
{
    uint32_t classAndName;
    uint32_t symbolValue;
    int16_t sectionIndex;
};


/*****************************************************************************
 *                             PEFImportedSymbol                             *
 *****************************************************************************/
typedef struct PEFImportedSymbol PEFImportedSymbol;
struct PEFImportedSymbol
{
    uint32_t classAndName;
};

/*****************************************************************************
 *                            PEFExportedSymbolKey                           *
 *****************************************************************************/
typedef uint32_t PEFExportedSymbolKey;

/*****************************************************************************
 *                         PEFExportedSymbolHashSlot                         *
 *****************************************************************************/
typedef uint32_t PEFExportedSymbolHashSlot;

/*****************************************************************************/
enum
{
    NAME_MASK = 16777215,
};

/*****************************************************************************
 *                           PEFExportedSymbolClass                          *
 *****************************************************************************/
#define PEFExportedSymbolClass(classAndName) (((classAndName) >> 24) & 0xFF)


/*****************************************************************************
 *                        PEFExportedSymbolNameOffset                        *
 *****************************************************************************/
#define PEFExportedSymbolNameOffset(classAndName) ((classAndName)&0xFFFFFF)


/*****************************************************************************
 *                          PEFComposeImportedSymbol                         *
 *****************************************************************************/
#define PEFComposeImportedSymbol(cls, nameOffset)                             \
    ((((uint32_t)cls) << 24) | (uint32_t)(nameOffset))


/*****************************************************************************
 *                           PEFRelocComposeBySectC                          *
 *****************************************************************************/
#define PEFRelocComposeBySectC(runLength) (0x4000 | ((uint16_t)(runLength)-1))


/*****************************************************************************
 *                           PEFRelocComposeBySectD                          *
 *****************************************************************************/
#define PEFRelocComposeBySectD(runLength) (0x4200 | ((uint16_t)(runLength)-1))


/*****************************************************************************
 *                       PEFRelocComposeSetPosition_1st                      *
 *****************************************************************************/
#define PEFRelocComposeSetPosition_1st(fullOffset)                            \
    (0xA000 | (uint16_t)((uint32_t)(fullOffset) >> 16))


/*****************************************************************************
 *                       PEFRelocComposeSetPosition_2nd                      *
 *****************************************************************************/
#define PEFRelocComposeSetPosition_2nd(fullOffset)                            \
    ((uint16_t)((uint32_t)(fullOffset)))


/*****************************************************************************
 *                       PEFRelocComposeLgByImport_1st                       *
 *****************************************************************************/
#define PEFRelocComposeLgByImport_1st(fullIndex)                              \
    (0xA400 | (uint16_t)((uint32_t)(fullIndex) >> 16))


/*****************************************************************************
 *                       PEFRelocComposeLgByImport_2nd                       *
 *****************************************************************************/
#define PEFRelocComposeLgByImport_2nd(fullIndex)                              \
    ((uint16_t)((uint32_t)(fullIndex)))


#pragma pack(pop)
