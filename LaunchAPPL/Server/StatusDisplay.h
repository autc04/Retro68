#include <MacTypes.h>
#include <Windows.h>
#include <TextUtils.h>

enum class AppStatus
{
    empty = 0,
    ready = 1,
    downloading = 2,
    running = 3,
    uploading = 4
};

class StatusDisplay
{
    WindowPtr statusWindow;
    Str255 statusString = "\p";
    AppStatus status = AppStatus::empty;
    int progressDone, progressTotal = 0;
    long freeMem;

    RgnHandle background;
    Rect statusRect;
    Rect progressRect;
    Rect memRect;
public:
    StatusDisplay();
    ~StatusDisplay();

    WindowPtr GetWindow() { return statusWindow; }
    void Update();

    void Idle();

    void SetStatus(AppStatus s);
    void SetProgress(int done = 0, int total = 0);
    void SetStatus(AppStatus stat, int done, int total);
};
