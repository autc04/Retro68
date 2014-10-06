%require "3.0.2"
%defines
%define parser_class_name {RezParser}
%skeleton "lalr1.cc"

%locations;

%define api.token.constructor
%define api.value.type variant
%define parse.assert

%token<std::string> IDENTIFIER;
%token<int> CHARLIT;
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
	#include "ResourceDefinitions.h"

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


type_definition	: "type" type_spec "{" field_definitions "}"
				{ std::cout << "TYPE " << $2 << std::endl; }
				| "type" type_spec "as" type_spec
				{ std::cout << "TYPE " << $2 << std::endl; }
				;

%type <ResType> res_type;
res_type : CHARLIT { $$ = ResType($1); } ;

%type <TypeSpec> type_spec;
type_spec : res_type { $$ = TypeSpec($res_type); }
		  | res_type "(" INTLIT ")" { $$ = TypeSpec($res_type, $INTLIT); }
		  ;

field_definitions	: %empty
					| field_definitions IDENTIFIER ":"
					| field_definitions ";"
					| field_definitions field_definition ";" ;

%type <FieldPtr> field_definition;
field_definition: simple_field_definition	{ $$ = $1; }
				| array_definition
				| switch_definition
				| fill_statement
				| align_statement;

%type <SimpleFieldPtr> simple_field_definition;
simple_field_definition: field_attributes simpletype array_count_opt value_spec_opt
	{
		$$ = std::make_shared<SimpleField>();
		$$->attrs = $field_attributes;
		$$->type = $simpletype;
		$$->arrayCount = $array_count_opt;
		$$->value = $value_spec_opt;
	}
	| simple_field_definition IDENTIFIER
	{ $$ = $1; $$->addNamedValue($IDENTIFIER); }
	| simple_field_definition IDENTIFIER "=" value
	{ $$ = $1; $$->addNamedValue($IDENTIFIER, $value); }
	| simple_field_definition "," IDENTIFIER
	{ $$ = $1; $$->addNamedValue($IDENTIFIER); }
	| simple_field_definition "," IDENTIFIER "=" value
	{ $$ = $1; $$->addNamedValue($IDENTIFIER, $value); }
	;

%type <ExprPtr> array_count array_count_opt value_spec_opt value ;
%type <ExprPtr> expression expression1 expression2 ;
%type <ExprPtr> expression3 expression4 expression5 expression6;
%type <ExprPtr> expression7 expression8;

value_spec_opt	: %empty { $$ = nullptr; } | "=" value { $$ = $2; } ;

%type <SimpleField::Type> simpletype;
simpletype	: "boolean"		{ $$ = SimpleField::Type::boolean; }
			| "byte"		{ $$ = SimpleField::Type::byte; }
			| "integer"		{ $$ = SimpleField::Type::integer; }
			| "longint"		{ $$ = SimpleField::Type::longint; }
			| "rect"		{ $$ = SimpleField::Type::rect; }
			| "point"		{ $$ = SimpleField::Type::point; }
			| "char"		{ $$ = SimpleField::Type::char_; }
			| "pstring" 	{ $$ = SimpleField::Type::pstring; }
			| "wstring"		{ $$ = SimpleField::Type::wstring; }
			| "string"		{ $$ = SimpleField::Type::string; }
			| "bitstring"	{ $$ = SimpleField::Type::bitstring; }
			;

fill_statement	: "fill" fill_unit array_count_opt;
align_statement	: "align" fill_unit;

fill_unit	: "bit" | "byte" | "word" | "long";


array_definition: array_attributes "array" array_name_opt array_count_opt "{" field_definitions "}" ;

array_count : "[" expression "]" { $$ = $2; }
array_count_opt : %empty { $$ = nullptr; } | array_count;

array_name_opt : %empty | IDENTIFIER ;

array_attributes: %empty | "wide" ;

%type <SimpleField::Attrs> field_attributes field_attribute;
field_attributes: %empty { $$ = SimpleField::Attrs::none; }
				| field_attributes field_attribute { $$ = $1 | $2; }
				;

field_attribute : "hex"			{ $$ = SimpleField::Attrs::hex; }
				| "key"			{ $$ = SimpleField::Attrs::key; }
				| "unsigned"	{ $$ = SimpleField::Attrs::unsigned_; }
				| "literal"		{ $$ = SimpleField::Attrs::literal; }
				;

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

value	: expression
		| "{" resource_body "}"
		| STRINGLIT				{ $$ = std::make_shared<StringExpr>($1); }
		;

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

expression8	: INTLIT	{ $$ = std::make_shared<IntExpr>($1); }
			| CHARLIT	{ $$ = std::make_shared<IntExpr>($1); }

			| IDENTIFIER
			| IDENTIFIER "(" function_argument_list ")"
			| IDENTIFIER "[" function_argument_list1 "]"
			| "(" expression ")"	{ $$ = $2; }

			;

function_argument_list : %empty | function_argument_list1 ;
function_argument_list1 : expression | function_argument_list "," expression ;

resource: "resource" res_type "(" function_argument_list ")" "{" resource_body "}"
	{ std::cout << "RESOURCE " << $2 << std::endl; }

resource_body : %empty | resource_body1 ;
resource_body1	: resource_item
				| resource_body1 "," resource_item
				| resource_body1 ";" resource_item
				| resource_body1 ";"
				;

resource_item	: value | IDENTIFIER "{" resource_body "}" ;

%%
