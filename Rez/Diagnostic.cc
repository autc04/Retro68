#include "Diagnostic.h"

Diagnostic::Diagnostic()
{
}

Diagnostic::Diagnostic(Severity sev, std::string msg, yy::location loc)
	: severity(sev), message(msg), location(loc)
{

}


std::ostream &operator<<(std::ostream &out, const Diagnostic &d)
{
	return out << d.location << ": " << d.message;
}
