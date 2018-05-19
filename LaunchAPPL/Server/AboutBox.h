#pragma once

#include "Window.h"
#include <Windows.h>

class AboutBox : public Window
{
    WindowRef window;

    static AboutBox* aboutBox;

    AboutBox();
public:
    ~AboutBox();

    virtual void Update();

    static void ShowAboutBox();
};
