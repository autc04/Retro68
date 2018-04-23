#include "Stream.h"
#include <string.h>

Stream::Stream()
{
}

Stream::~Stream()
{
}

void Stream::notifyReceive(const uint8_t* p, size_t n)
{
    if(buffer_.empty())
    {
        size_t consumed = listener_ ? listener_->onReceive(p,n) : 0;
        if(consumed < n)
            buffer_.insert(buffer_.end(), p + consumed, p + n);
    }
    else
    {
        buffer_.insert(buffer_.end(), p, p+n);
    }

    while(!buffer_.empty())
    {
        size_t consumed = listener_ ? listener_->onReceive(buffer_.data(), buffer_.size()) : 0;
        buffer_.erase(buffer_.begin(), buffer_.begin()+consumed);
        
        if(!consumed)
            break;
    }
}

void Stream::notifyReset()
{
    if(listener_)
        listener_->onReset();
}

long Stream::read(void *p, size_t n)
{
    if(buffer_.size() <= n)
    {
        size_t bufsiz = buffer_.size();
        memcpy(p, buffer_.data(), buffer_.size());
        buffer_.clear();
        return bufsiz;
    }
    else
    {
        memcpy(p, buffer_.data(), n);
        buffer_.erase(buffer_.begin(), buffer_.begin()+n);
        return n;
    }
}

StreamWrapper::StreamWrapper(Stream* underlying)
    : underlying_(underlying)
{
    if(underlying_)
        underlying_->setListener(this);
}

StreamWrapper::~StreamWrapper()
{
    if(underlying_)
        underlying_->clearListener(this);
}

StreamWrapper::StreamWrapper(StreamWrapper&& other)
{
    underlying_ = other.underlying_;
    if(underlying_)
        underlying_->setListener(this);
    other.underlying_ = nullptr;
}

StreamWrapper& StreamWrapper::operator=(StreamWrapper&& other)
{
    if(underlying_)
        underlying_->clearListener(this);
    underlying_ = other.underlying_;
    if(underlying_)
        underlying_->setListener(this);
    other.underlying_ = nullptr;
}
