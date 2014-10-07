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
%param { RezWorld& world }

%code requires {
	#include "ResourceDefinitions.h"
	#include "Expression.h"

	#define YY_NULLPTR nullptr
	class RezLexer;
	class RezWorld;
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
	#include "RezWorld.h"
	#include "ResourceCompiler.h"

	static yy::RezParser::symbol_type yylex(RezLexer& lexer, RezWorld&)
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

type_definition	: "type" type_spec
					{
						TypeDefinitionPtr td = std::make_shared<TypeDefinition>();
						world.addTypeDefinition($type_spec, td);
						world.fieldLists.push(td);
					}
				"{" field_definitions "}"
				{ world.fieldLists.pop(); std::cout << "TYPE " << $2 << std::endl; }
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
					| field_definitions IDENTIFIER ":"			{ world.fieldLists.top()->addLabel($2); }
					| field_definitions ";"
					| field_definitions field_definition ";"	{ world.fieldLists.top()->addField($2); }
					;

%type <FieldPtr> field_definition;
field_definition: simple_field_definition	{ $$ = $1; }
				| array_definition			{ $$ = $1; }
				| switch_definition			{ $$ = nullptr; }
				| fill_statement			{ $$ = nullptr; }
				| align_statement			{ $$ = nullptr; }
				;

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

%type <ExprPtr> array_count array_count_opt value_spec_opt value resource_item;
%type <ExprPtr> expression expression1 expression2 ;
%type <ExprPtr> expression3 expression4 expression5 ;
%type <ExprPtr> expression6 expression7 expression8;

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

%type <FieldPtr> array_definition;
array_definition:
	array_attributes "array" array_name_opt array_count_opt
	{
		ArrayFieldPtr af = std::make_shared<ArrayField>($array_name_opt, $array_count_opt);
		world.fieldLists.push(af);
	}
	"{" field_definitions "}"
	{
		$$ = world.fieldLists.top();
		world.fieldLists.pop();
	}
	;

array_count : "[" expression "]" { $$ = $2; }
array_count_opt : %empty { $$ = nullptr; } | array_count { $$ = $1; };

%type <std::string> array_name_opt;
array_name_opt : %empty { $$ = ""; } | IDENTIFIER { $$ = $1; } ;

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

value	: expression	{ $$ = $1; }
		| "{" resource_body "}"	{ $$ = $2; }
		| STRINGLIT				{ $$ = std::make_shared<StringExpr>($1); }
		;

expression	: expression1	{ $$ = $1; }
			| expression "^" expression1	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::XOR, $1, $3); }
			;

expression1	: expression2	{ $$ = $1; }
			| expression1 "&" expression2	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::AND, $1, $3); }
			;

expression2 : expression3	{ $$ = $1; }
			| expression2 "|" expression3	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::OR, $1, $3); }
			;

expression3 : expression4	{ $$ = $1; }
			| expression3 "==" expression4	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::EQUAL, $1, $3); }
			| expression3 "!=" expression4	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::NOTEQUAL, $1, $3); }
			;

expression4 : expression5	{ $$ = $1; }
			| expression4 ">>" expression5	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::SHIFTRIGHT, $1, $3); }
			| expression4 "<<" expression5	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::SHIFTLEFT, $1, $3); }
			;

expression5 : expression6	{ $$ = $1; }
			| expression5 "+" expression6	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::PLUS, $1, $3); }
			| expression5 "-" expression6	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::MINUS, $1, $3); }
			;

expression6 : expression7	{ $$ = $1; }
			| expression6 "*" expression7	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::MULTIPLY, $1, $3); }
			| expression6 "/" expression7	{ $$ = std::make_shared<BinaryExpr>(BinaryOp::DIVIDE, $1, $3); }
			;
expression7	: expression8		{ $$ = $1; }
			| "-" expression7	{ $$ = std::make_shared<UnaryExpr>(UnaryOp::MINUS, $2); }
			| "+" expression7	{ $$ = $2; }
			| "~" expression7	{ $$ = std::make_shared<UnaryExpr>(UnaryOp::COMPLEMENT, $2); }
			;

expression8	: INTLIT	{ $$ = std::make_shared<IntExpr>($1); }
			| CHARLIT	{ $$ = std::make_shared<IntExpr>($1); }

			| IDENTIFIER	/* ### */
			| IDENTIFIER "(" function_argument_list ")"
			| IDENTIFIER "[" function_argument_list1 "]"
			| "(" expression ")"	{ $$ = $2; }

			;

function_argument_list : %empty | function_argument_list1 ;
function_argument_list1 : expression | function_argument_list "," expression ;

resource	: "resource" res_type "(" expression resource_attributes ")" "{" resource_body "}"
			{
				int id = $expression->evaluateInt(nullptr);
				std::cout << "RESOURCE " << $2 << "(" << id << ")" << std::endl;
				TypeDefinitionPtr type = world.getTypeDefinition($res_type, id);
				ResourceCompiler compiler;
				std::cout << "(first pass)\n";
				type->compile($resource_body, &compiler, true);
				std::cout << "(second pass)\n";
				type->compile($resource_body, &compiler, false);
				std::cout << "(done)\n";
			}
			;

%type <int> resource_attributes resource_attribute;
resource_attributes	: %empty { $$ = 0; }
					| resource_attributes "," resource_attribute { $$ = $1 | $3; }
					;
resource_attribute	: IDENTIFIER { $$ = 0; }	 /* ### */

%type <CompoundExprPtr> resource_body resource_body1;
resource_body	: %empty { $$ = std::make_shared<CompoundExpr>(); }
				| resource_body1 { $$ = $1; }
				;
resource_body1	: resource_item	{ $$ = std::make_shared<CompoundExpr>(); $$->addItem($1); }
				| resource_body1 "," resource_item	{ $$ = $1; $$->addItem($3); }
				| resource_body1 ";" resource_item	{ $$ = $1; $$->addItem($3); }
				| resource_body1 ";" { $$ = $1; }
				;

resource_item	: value { $$ = $1; }
				| IDENTIFIER "{" resource_body "}" // ###
				;

%%
