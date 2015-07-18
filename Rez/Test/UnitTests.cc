#define BOOST_TEST_MODULE UnitTests
#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MAIN
#include <boost/test/unit_test.hpp>

#include "RezLexer.h"
#include "RezParser.generated.hh"
#include "ResourceCompiler.h"
#include "RezWorld.h"

#include <iostream>

BOOST_AUTO_TEST_SUITE(LexSuite)

#define CHECKSYM(TOKEN, TYPE, VAL)	\
	do {	\
		RezSymbol t = lex.nextToken();	\
		BOOST_CHECK_EQUAL(t.token(), TOKEN);	\
		if(t.token() == TOKEN)	\
			BOOST_CHECK_EQUAL(t.value.as<TYPE>(), VAL);	\
	} while(0)
#define CHECKSYM_(TOKEN)	\
	do {	\
		RezSymbol t = lex.nextToken();	\
		BOOST_CHECK_EQUAL(t.token(), TOKEN);	\
	} while(0)

BOOST_AUTO_TEST_CASE(basicInt)
{
	RezWorld world;
	RezLexer lex(world, "test", "123 0x456 0xaBcd9\n");

	CHECKSYM(RezParser::token::INTLIT, int, 123);
	CHECKSYM(RezParser::token::INTLIT, int, 0x456);
	CHECKSYM(RezParser::token::INTLIT, int, 0xabcd9);
	CHECKSYM_(0);
}

BOOST_AUTO_TEST_CASE(alternateHex)
{
	RezWorld world;
	RezLexer lex(world, "test", "$456 $aBcd9\n");

	CHECKSYM(RezParser::token::INTLIT, int, 0x456);
	CHECKSYM(RezParser::token::INTLIT, int, 0xabcd9);
	CHECKSYM_(0);
}

BOOST_AUTO_TEST_CASE(noNewlineAtEOF)
{
	RezWorld world;
	RezLexer lex(world, "test", "123 456");
	CHECKSYM(RezParser::token::INTLIT, int, 123);
	CHECKSYM(RezParser::token::INTLIT, int, 456);
	CHECKSYM_(0);
}

BOOST_AUTO_TEST_CASE(strings)
{
	RezWorld world;
	RezLexer lex(world, "test", R"rez(
		"Hello, world."
		"Foo \n"
		"\r Quux"
		"\001\002\003"
		"\0x42\0x43"
		"Blah \$5F"
	)rez" "\n");
	CHECKSYM(RezParser::token::STRINGLIT, std::string, "Hello, world.");
	CHECKSYM(RezParser::token::STRINGLIT, std::string, "Foo \n");
	CHECKSYM(RezParser::token::STRINGLIT, std::string, "\r Quux");
	CHECKSYM(RezParser::token::STRINGLIT, std::string, "\001\002\003");
	CHECKSYM(RezParser::token::STRINGLIT, std::string, "\x42\x43");
	CHECKSYM(RezParser::token::STRINGLIT, std::string, "Blah \x5F");
	CHECKSYM_(0);
}

BOOST_AUTO_TEST_SUITE_END()

BOOST_AUTO_TEST_SUITE(BinarySuite)

BOOST_AUTO_TEST_CASE(bytes)
{
	BinaryOutput out;
	out.write(8, 'a');
	out.write(8, 'b');
	out.write(8, 'c');
	BOOST_CHECK_EQUAL(out.resourceData(), "abc");
}

BOOST_AUTO_TEST_CASE(multibyte)
{
	BinaryOutput out;
	out.write(32, 'abcd');
	BOOST_CHECK_EQUAL(out.resourceData(), "abcd");
}

BOOST_AUTO_TEST_CASE(subbyte)
{
	BinaryOutput out;
	out.write(4, 6);
	out.write(4, 1);

	out.write(2, 1);
	out.write(2, 2);
	out.write(4, 2);

	out.write(3, 3);
	out.write(2, 0);
	out.write(3, 3);
	BOOST_CHECK_EQUAL(out.resourceData(), "abc");
}


BOOST_AUTO_TEST_CASE(peek)
{
	BinaryOutput out;
	for(char c : "Hello, world.")
		if(c != 0)
			out.write(8, c);

	BOOST_CHECK_EQUAL(out.resourceData(), "Hello, world.");

	BOOST_CHECK_EQUAL(out.peek(0,8), 'H');
	BOOST_CHECK_EQUAL(out.peek(32,8), 'o');

	BOOST_CHECK_EQUAL(out.peek(0,32), 'Hell');
	BOOST_CHECK_EQUAL(out.peek(40,32), ', wo');

	BOOST_CHECK_EQUAL(out.peek(1,8), 'H' * 2);
	BOOST_CHECK_EQUAL(out.peek(2,8), 0x21);

	BOOST_CHECK_EQUAL(out.peek(2,30), 'Hell' & 0x3FFFFFFF);
	BOOST_CHECK_EQUAL(out.peek(2,32), ('Hell' & 0x3FFFFFFF) << 2 | ('o' >> 6) );

	BOOST_CHECK_EQUAL(out.peek(4,3), 4);
}

BOOST_AUTO_TEST_SUITE_END()
