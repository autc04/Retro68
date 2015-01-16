#ifndef REZLEXER_H
#define REZLEXER_H

#include <memory>
#include <string>

class RezSymbol;

class RezLexer
{
	struct Priv;
	std::unique_ptr<Priv> pImpl;

	std::string curFile;

	class WaveToken;

	bool atEnd();
	WaveToken nextWave();
	WaveToken peekWave();

public:
	RezLexer(std::string filename);
	RezLexer(std::string filename, const std::string& data);
	~RezLexer();

	RezSymbol nextToken();

	void addDefine(std::string str);
	void addIncludePath(std::string path);
};

#endif // REZLEXER_H
