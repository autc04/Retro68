#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "tm.h"
#include "tree.h"

#include "c-family/c-pragma.h"
#include "c-family/c-common.h"
#include "diagnostic-core.h"
#include "cpplib.h"

#include <string>
#include <map>
#include <vector>

std::map<std::string, int> pragma_parameter_register_names;
extern std::map< std::string, std::vector<int> > pragma_parameter_directives;


static int lookup_reg(std::string s)
{
  std::map<std::string, int>::const_iterator p = pragma_parameter_register_names.find(s);
  if(p == pragma_parameter_register_names.end())
    return -1;
  return p->second;
}

static void
m68k_pragma_parameter (cpp_reader * reader ATTRIBUTE_UNUSED)
{
  /* on off */
  tree token;
  enum cpp_ttype type;

  std::string name;
  std::vector<int> argregs;

  type = pragma_lex (&token);
  argregs.push_back(0);
  if (type == CPP_NAME)
    {
      name = IDENTIFIER_POINTER(token);
      type = pragma_lex (&token);
      if (type == CPP_NAME)
        {
          argregs.back() = lookup_reg(name);
          if(argregs.back() < 0)
            {
              error ("invalid register name %s", name.c_str());
              return;
            }
          name = IDENTIFIER_POINTER(token);
          type = pragma_lex (&token);
        }
      if (type == CPP_EOF)
        {
          pragma_parameter_directives[name] = argregs;
          return;
        }

      if (type == CPP_OPEN_PAREN)
        {
          type = pragma_lex (&token);
          while(argregs.size() == 1 ? type == CPP_NAME : type == CPP_COMMA)
            {
              if(argregs.size() != 1)
                type = pragma_lex (&token);
              if(type != CPP_NAME)
                break;
              
              argregs.push_back(lookup_reg(IDENTIFIER_POINTER(token)));
              if(argregs.back() < 0)
                {
                  error ("invalid register name %s", IDENTIFIER_POINTER(token));
                  return;
                }

              type = pragma_lex (&token);
            }

          if (type == CPP_CLOSE_PAREN)
            {
              type = pragma_lex (&token);
              if (type != CPP_EOF)
                {
                  error ("junk at end of #pragma parameter");
                }
              else
                {
                  pragma_parameter_directives[name] = argregs;
                }
              return;
            }
        }
    }
  error ("malformed #pragma parameter ");
}


void
m68k_register_pragmas()
{
  for(int i = 0; i < 8; i++)
    {
      std::string n(1, '0' + i);
      pragma_parameter_register_names["__D" + n] = i;
      pragma_parameter_register_names["__A" + n] = i + 8;
    }
  c_register_pragma (NULL, "parameter", m68k_pragma_parameter);

}
