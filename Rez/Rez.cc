#include <fstream>
#include <iostream>


#include "RezParser.generated.hh"
#include "RezLexer.h"
#include "RezWorld.h"

#include "ResourceFiles.h"
#include "BinaryIO.h"

int main()
{
	//RezLexer lexer("/home/wolfgang/Projects/Retro68/RIncludes/Types.r");
	RezLexer lexer("/home/wolfgang/Projects/Retro68/Rez/Test.r");
	RezWorld world;
	RezParser parser(lexer, world);

	parser.parse();
	{
		std::ofstream dataOut("test.rsrc");
		system("mkdir -p .rsrc");
		std::ofstream rsrcOut(".rsrc/test.rsrc");

		world.getResources().writeFork(rsrcOut);
		system("mkdir -p .finf");
		std::ofstream finfOut(".finf/test.rsrc");
		ostype(finfOut, "rsrc");
		ostype(finfOut, "RSED");
		for(int i = 8; i < 32; i++)
			byte(finfOut, 0);
	}
	return 0;
}
