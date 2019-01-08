#include <MacTypes.h>
#include <Windows.h>
#include <TextUtils.h>

#include "Window.h"

enum class AppStatus
{
    empty = 0,
    readyModem = 1,
    readyPrinter,
    readyMacTCP,
    readyOpenTpt,
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
