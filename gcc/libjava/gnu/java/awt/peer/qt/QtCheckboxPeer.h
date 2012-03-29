
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __gnu_java_awt_peer_qt_QtCheckboxPeer__
#define __gnu_java_awt_peer_qt_QtCheckboxPeer__

#pragma interface

#include <gnu/java/awt/peer/qt/QtComponentPeer.h>
extern "Java"
{
  namespace gnu
  {
    namespace java
    {
      namespace awt
      {
        namespace peer
        {
          namespace qt
          {
              class QtCheckboxPeer;
              class QtToolkit;
          }
        }
      }
    }
  }
  namespace java
  {
    namespace awt
    {
        class Checkbox;
        class CheckboxGroup;
    }
  }
}

class gnu::java::awt::peer::qt::QtCheckboxPeer : public ::gnu::java::awt::peer::qt::QtComponentPeer
{

public:
  QtCheckboxPeer(::gnu::java::awt::peer::qt::QtToolkit *, ::java::awt::Checkbox *);
public: // actually protected
  virtual void init();
  virtual void setup();
private:
  void fireToggle(jboolean);
public:
  virtual void setCheckboxGroup(::java::awt::CheckboxGroup *);
  virtual void setLabel(::java::lang::String *);
  virtual void setState(jboolean);
private:
  ::java::awt::CheckboxGroup * __attribute__((aligned(__alignof__( ::gnu::java::awt::peer::qt::QtComponentPeer)))) group;
  static ::java::util::WeakHashMap * groupMap;
public:
  static ::java::lang::Class class$;
};

#endif // __gnu_java_awt_peer_qt_QtCheckboxPeer__