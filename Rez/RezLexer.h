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
};

#endif // REZLEXER_H
