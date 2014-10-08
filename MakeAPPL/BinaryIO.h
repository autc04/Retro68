#ifndef BINARYIO_H
#define BINARYIO_H

#include <iosfwd>
#include <string>

void byte(std::ostream& out, int byte);
void word(std::ostream& out, int word);
void ostype(std::ostream& out, std::string type);
void longword(std::ostream& out, int longword);

int byte(std::istream& in);
int word(std::istream& in);
std::string ostype(std::istream& in);
int longword(std::istream& in);

#endif // BINARYIO_H
