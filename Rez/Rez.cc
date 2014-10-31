#include <iostream>
#include "boost/program_options.hpp"
#include "boost/filesystem.hpp"
#include "boost/filesystem/fstream.hpp"

#include "RezParser.generated.hh"
#include "RezLexer.h"
#include "RezWorld.h"

#include "ResourceFork.h"
#include "BinaryIO.h"
#include "ResourceFile.h"

namespace po = boost::program_options;
namespace fs = boost::filesystem;

static po::options_description desc;

static void usage()
{
	std::cerr << "Usage: " << "Rez [options] input-file\n";
	std::cerr << desc << std::endl;
}

int main(int argc, const char *argv[])
{
	desc.add_options()
		("help,h", "show this help message")
		("output,o", po::value<std::string>()->default_value("rez.output.rsrc"), "output file")
		("append,a", "append to existing output file")
		("type,t", po::value<std::string>()->default_value("rsrc"), "output file finder type code")
		("creator,c", po::value<std::string>()->default_value("RSED"), "output file finder creator code")
		("define,D", po::value<std::vector<std::string>>(), "predefine preprocessor symbol")
		("include,I", po::value<std::vector<std::string>>(), "add include file path")
		("debug,d", "debug logging")
	;
	po::options_description hidden, alldesc;
	hidden.add_options()
		("input", po::value<std::vector<std::string>>(), "input file" )
	;
	alldesc.add(desc).add(hidden);

	po::variables_map options;
	try
	{
		auto parsed = po::command_line_parser(argc, argv)
				.options(alldesc)
				.positional(po::positional_options_description().add("input", -1))
				.style(po::command_line_style::default_style |
					   po::command_line_style::allow_long_disguise)
				.run();

		po::store(parsed, options);
	}
	catch(po::error& e)
	{
		std::cerr << "ERROR: " << e.what() << std::endl << std::endl;
		usage();
		return 1;
	}

	po::notify(options);

	if(options.count("help") || !options.count("input"))
	{
		usage();
		return 0;
	}

	RezWorld world;

	if(options.count("debug"))
		world.verboseFlag = true;

	std::string outfile = options["output"].as<std::string>();
	ResourceFile rsrcFile(outfile);

	if(options.count("append"))
	{
		rsrcFile.read();

		world.getResources().addResources(rsrcFile.resources);
	}

	for(std::string fn : options["input"].as<std::vector<std::string>>())
	{
		RezLexer lexer(fn);

		if(options.count("define"))
			for(std::string define : options["define"].as<std::vector<std::string>>())
				lexer.addDefine(define);
		if(options.count("include"))
			for(std::string path : options["include"].as<std::vector<std::string>>())
				lexer.addIncludePath(path);


		RezParser parser(lexer, world);
		parser.parse();
	}

	rsrcFile.resources = world.getResources();
	rsrcFile.creator = options["creator"].as<std::string>();
	rsrcFile.type = options["type"].as<std::string>();
	rsrcFile.write();
	return 0;
}
