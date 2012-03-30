#include <Quickdraw.h>

class PortSetter
{
   GrafPtr save;
public:
   PortSetter(GrafPtr port)
   {
      ::GetPort(&save);
      ::SetPort(port);
   }

   ~PortSetter()
   {
      ::SetPort(save);
   }
};


