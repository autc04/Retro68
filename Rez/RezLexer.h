#ifndef REZLEXER_H
#define REZLEXER_H

#include <memory>

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
	~RezLexer();

	RezSymbol nextToken();

	void addDefine(std::string str);
	void addIncludePath(std::string path);
};

#endif // REZLEXER_H
