%require "3.0.2"
%defines
%define parser_class_name {RezParser}
%skeleton "lalr1.cc"

%locations;

%define api.token.constructor
%define api.value.type variant
%define parse.assert

%token<std::string> IDENTIFIER;
%token<std::string> CHARLIT;
%token<std::string> STRINGLIT;
%token<int> INTLIT;

%token<std::string> BADTOKEN;


%token LEFTBRACE "{";
%token RIGHTBRACE "}";
%token LEFTBRACKET "[";
%token RIGHTBRACKET "]";
%token LEFTPAREN "(";
%token RIGHTPAREN ")";
%token SEMICOLON ";";
%token COMMA ",";
%token PLUS "+";
%token MINUS "-";
%token DIVIDE "/";
%token STAR "*";
%token ASSIGN "=";
%token COLON ":";
%token SHIFTLEFT "<<";
%token SHIFTRIGHT ">>";
%token EQUAL "==";
%token NOTEQUAL "!=";
%token AND "&";
%token OR "|";
%token XOR "^";
%token COMPL "~";


%token TYPE "type";
%token RESOURCE "resource";
%token ARRAY "array";
%token SWITCH "switch";
%token CASE "case";
%token AS "as";
%token FILL "fill";
%token ALIGN "align";
%token HEX "hex";
%token KEY "key";
%token WIDE "wide";
%token LITERAL "literal";
%token UNSIGNED "unsigned";

%token BOOLEAN "boolean";
%token BIT "bit";
%token BYTE "byte";
%token CHAR "char";
%token WORD "word";
%token INTEGER "integer";
%token LONG "long";
%token LONGINT "longint";
%token PSTRING "pstring";
%token WSTRING "wstring";
%token STRING "string";
%token POINT "point";
%token RECT "rect";
%token BITSTRING "bitstring";

/*
%left "|";
%left "^";
%left "&";
%left "==" "!=";
%left ">>" "<<";
%left "+" "-";
%left "*" "/";
*/

%param { RezLexer& lexer }

%code requires {
	#define YY_NULLPTR nullptr
	class RezLexer;
}

%code provides {
	using yy::RezParser;
	//using RezSymbol = yy::RezParser::symbol_type;

	class RezSymbol : public yy::RezParser::symbol_type
	{
	public:
		RezSymbol() = default;
		RezSymbol(const yy::RezParser::symbol_type& x) : yy::RezParser::symbol_type(x) {}
	};
}

%code {
	#include "RezLexer.h"
	static yy::RezParser::symbol_type yylex(RezLexer& lexer)
	{
		return lexer.nextToken();
	}

	void yy::RezParser::error(const location_type& loc, std::string const& err)
	{
		std::cerr << loc << ": " << err << std::endl;
	}
}

%%
%start rez;

rez	: %empty
	| rez type_definition ";"
	| rez resource ";"
	;

simpletype	: "boolean"
			| "bit" | "byte" | "word" | "integer" | "long" | "longint" | "rect"
			| "point"
			| "char"
			| "pstring" array_count_opt
			| "wstring" array_count_opt
			| "string" array_count_opt;
		| "bitstring" "[" expression "]";

type_definition	: "type" type_spec "{" field_definitions "}"
				{ std::cout << "TYPE " << $2 << std::endl; }
				| "type" type_spec "as" type_spec
				{ std::cout << "TYPE " << $2 << std::endl; }
				;

%type <std::string> type_spec;
type_spec : CHARLIT { $$ = $1; }
		  | CHARLIT "(" INTLIT ")" { $$ = $1; }
		  ;

field_definitions	: %empty
					| field_definitions IDENTIFIER ":"
					| field_definitions ";"
					| field_definitions field_definition ";" ;

field_definition:  simple_field_definition
				| array_definition
				| switch_definition
				| fill_statement
				| align_statement;

fill_statement	: "fill" fill_unit array_count_opt;
align_statement	: "align" fill_unit;

fill_unit	: "bit" | "byte" | "word" | "long";

simple_field_definition: field_attributes simpletype value_spec;

value_spec : %empty
		   | named_values
		   | "=" expression;

named_values: named_value
			| named_values "," named_value
			| named_values named_value;

named_value	: IDENTIFIER
			| IDENTIFIER "=" expression ;

array_definition: array_attributes "array" array_name_opt array_count_opt "{" field_definitions "}" ;

array_count : "[" expression "]" ;
array_count_opt : %empty | array_count ;

array_name_opt : %empty | IDENTIFIER ;

array_attributes: %empty | "wide" ;
field_attributes: %empty | field_attributes field_attribute;
field_attribute : "hex" | "key" | "unsigned" | "literal";

switch_definition: "switch" "{"
		switch_cases
	"}" ;

switch_cases : %empty | switch_cases switch_case ;

switch_case : "case" IDENTIFIER ":" field_definitions ;

/*
expression
			| expression "^" expression
			| expression "&" expression
			| expression "|" expression
			| "~" expression
			| expression "==" expression
			| expression "!=" expression
			| expression ">>" expression
			| expression "<<" expression
			| expression "+" expression
			| expression "-" expression
			| "-" expression
			| expression "/" expression
			| expression "*" expression
			;
*/

expression	: expression1
			| expression "^" expression1
			;

expression1	: expression2
			| expression1 "&" expression2
			;

expression2 : expression3
			| expression2 "|" expression3
			;

expression3 : expression4
			| expression3 "==" expression4
			| expression3 "!=" expression4
			;

expression4 : expression5
			| expression4 ">>" expression5
			| expression4 "<<" expression5
			;

expression5 : expression6
			| expression5 "+" expression6
			| expression5 "-" expression6
			;

expression6 : expression7
			| expression6 "*" expression7
			| expression6 "/" expression7
			;
expression7	: expression8
			| "-" expression7
			| "+" expression7
			| "~" expression7
			;

expression8	: INTLIT
			| CHARLIT
			| STRINGLIT
			| IDENTIFIER
			| IDENTIFIER "(" function_argument_list ")"
			| IDENTIFIER "[" function_argument_list1 "]"
			| "(" expression ")"
			| "{" resource_body "}"
			;

function_argument_list : %empty | function_argument_list1 ;
function_argument_list1 : expression | function_argument_list "," expression ;

resource: "resource" CHARLIT "(" function_argument_list ")" "{" resource_body "}"
	{ std::cout << "RESOURCE " << $2 << std::endl; }

resource_body : %empty | resource_body1 ;
resource_body1	: resource_item
				| resource_body1 "," resource_item
				| resource_body1 ";" resource_item
				| resource_body1 ";"
				;

resource_item	: expression | IDENTIFIER "{" resource_body "}" ;

%%
