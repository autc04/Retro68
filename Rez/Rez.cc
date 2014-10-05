#include <fstream>
#include <iostream>


#include "RezParser.generated.hh"
#include "RezLexer.h"


int main()
{
	//RezLexer lexer("/home/wolfgang/Projects/Retro68/RIncludes/Types.r");
	RezLexer lexer("/home/wolfgang/Projects/Retro68/Rez/Test.r");

	RezParser parser(lexer);

	parser.parse();

	/*
	// The following preprocesses a given input file.
	// Open the file and read it into a string variable
	std::ifstream instream("/home/wolfgang/Projects/Retro68/RIncludes/Types.r");

	std::string input(
		std::istreambuf_iterator<char>(instream.rdbuf()),
		std::istreambuf_iterator<char>());

	context_type ctx(input.begin(), input.end(), "Types.r");

	// At this point you may want to set the parameters of the
	// preprocessing as include paths and/or predefined macros.
		ctx.add_include_path("/home/wolfgang/Projects/Retro68/RIncludes");
	//	ctx.add_macro_definition(...);

	auto first = ctx.begin();
	auto last = ctx.end();

	std::ostringstream out;

	try
	{
		while(first != last)
		{
			out << (*first).get_value();
			++first;
		}
	}
	catch(boost::wave::preprocess_exception& e)
	{
		std::cout << e.file_name() << ":" << e.line_no() << ": ";
		std::cout << e.description() << std::endl;
	}

	std::string str = out.str();


	std::cout << str.substr(0,100) << std::endl;*/

/*
	int i = 0;
		while (first != last) {
			std::cout << i << ": " << get_token_name(token_id(*first)) << " <<" << (*first).get_value() << ">>\n";
			++first;
			if(++i > 10)
				break;
		}*/
	return 0;
}
