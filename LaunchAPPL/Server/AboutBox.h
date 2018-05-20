#pragma once

#include "Window.h"
#include <Windows.h>
#include <TextEdit.h>

class AboutBox : public Window
{
    WindowRef window;
    TEHandle textEdit;

    static AboutBox* aboutBox;

    AboutBox();
public:
    ~AboutBox();

    virtual void Update();

    static void ShowAboutBox();
};
