#pragma once

class StreamListener;
class Stream;

class ConnectionProvider
{
protected:
    StreamListener *listener;
public:
    void setListener(StreamListener *l) { listener = l; }

    virtual ~ConnectionProvider() {}
    virtual Stream* getStream() = 0;
    virtual void idle() {}
    virtual void suspend() {}
    virtual void resume() {}

    virtual void* segmentToUnload() { return nullptr; }
};
