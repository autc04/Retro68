#include <OSUtils.h>
#include "ShowInitIcon.h"
#include "Retro68Runtime.h"

void _start(void)
{
    RETRO68_RELOCATE();
    Retro68CallConstructors();

    ShowInitIcon(130, false);
    Delay(20, NULL);
    ShowInitIcon(128, true);
    Delay(40, NULL);

    Retro68FreeGlobals();
}
