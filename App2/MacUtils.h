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

inline const unsigned char* operator"" _pstr(const char*p, size_t n)
{
	unsigned char *pp = reinterpret_cast<unsigned char*>(const_cast<char*>(p));
	pp[0] = n-1;
	return pp;
}
#define PSTR(s) ("*" s ## _pstr)

