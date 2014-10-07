#include <fstream>
#include <iostream>


#include "RezParser.generated.hh"
#include "RezLexer.h"
#include "RezWorld.h"

int main()
{
	//RezLexer lexer("/home/wolfgang/Projects/Retro68/RIncludes/Types.r");
	RezLexer lexer("/home/wolfgang/Projects/Retro68/Rez/Test.r");
	RezWorld world;
	RezParser parser(lexer, world);

	parser.parse();
	return 0;
}
