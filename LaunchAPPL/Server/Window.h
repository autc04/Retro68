#pragma once

class Window
{
public:
    virtual ~Window() {}
    virtual void Update() = 0;
};
