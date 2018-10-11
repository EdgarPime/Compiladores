package analizador;
import static analizador.Token.*;
%%
%class Lexer
%type Token


//TOKEN PARA CONSTANTES
CONSTBOOLEANAS=("true")|("false")
CONSTENTERO=([0-9]+|0[xX][0-9a-fA-F]+|0[bB][01]+)
CONSTDOUBLE=(([0-9]+(".")[0-9]*) ([eE]([+-])?[0-9]+)?)
//CONSTSTRING= (("\"")(~["\""]))
CONSTSTRING=(((\")[^\n]*(\")))


//TOKEN PARA IDENTIFICADORES
L = [a-zA-Z]
D = [0-9]


//TOKEN DE PALABRAS RESERVADAS

VOID=("void")
INT=("int")
DOUBLE=("double")
BOOL=("bool")
STRING=("string")
CLASS=("class")
INTERFACE=("interface")
NULL=("null")
THIS=("this")
EXTENDS=("extends")
IMPLEMENTS=("implements")
FOR=("for")
WHILE=("while")
IF=("if")
ELSE=("else")
RETURN=("return")
BREAK=("break")
NEW=("New")
NEWARRAY=("NewArray")

//TOKEN PARA OPERADORES Y CARACTERES DE PUNTUACION
SUMA=("+")
RESTA=("-")
MULTIPLICACION=("*")
DIVISION=("/")
PORCENTAJE=("%")
MENOR=("<")
MENORIGUAL=("<=")
MAYOR=(">")
MAYORIGUAL=(">=")
IGUAL=("=")
IGUALDAD=("==")
DIFERENTE=("!=")
AND=("&&")
OR=("||")
NEGACION=("!")
PUNTOYCOMA=(";")
COMA=(",")
PUNTO=(".")
CORCHIZQ=("[")
CORCHDER=("]")
PARENIZQ=("(")
PARENDER=(")")
LLAVEIZQ=("{")
LLAVEDER=("}")
CORCHETES=("[]")
PARENTESIS=("()")
LLAVES=("{}")

ENTER=[\n]
WHITE=[ \t\r\n]

%{
public String lexeme;
%}
%%
//{WHITE} {/*Ignore*/}

//TOKEN PARA COMENTARIOS

//("/*")([^*]|("*")[^/])*("*/") {lexeme=yytext(); return COMENTARIO1;}
"/*"~"*/" {lexeme=yytext(); return COMENTARIO1;}
("//"[^\n]*) {lexeme=yytext(); return COMENTARIO2;} 


//TOKEN PARA ERRORES

//({D}|("_"))+({L}|{D}("_"))+ {lexeme=yytext(); return ERROR;}
//(("."){D}+)+([eE]([+-])?[0-9]+)? {lexeme=yytext(); return ERROR;}
//({D}+("."))(({D})|("."))+([eE]([+-])?[0-9]+)? {lexeme=yytext(); return ERROR;}
//("/*")([^*]|("*")[^/])* {lexeme=yytext(); return ERROR1;}

"/*"[^"*/"]* {lexeme=yytext(); return ERROR1;}




//TOKEN PARA CONSTANTES
{CONSTBOOLEANAS} {lexeme=yytext(); return T_CONST_BOOLEANO;}
{CONSTENTERO} {lexeme=yytext(); return T_CONST_ENTERO;}
{CONSTDOUBLE} {lexeme=yytext(); return T_CONST_DOUBLE;}
{CONSTSTRING} {lexeme=yytext(); return T_CONST_STRING;}
//{PRUEBA} {lexeme=yytext(); return ERROR;}

//TOKEN DE PALABRAS RESERVADAS
{VOID} {lexeme=yytext(); return T_VOID;}
{INT} {lexeme=yytext(); return T_INT;}
{DOUBLE} {lexeme=yytext(); return T_DOUBLE;}
{BOOL} {lexeme=yytext(); return T_BOOL;}
{STRING} {lexeme=yytext(); return T_STRING;}
{CLASS} {lexeme=yytext(); return T_CLASS;}
{INTERFACE} {lexeme=yytext(); return T_INTERFACE;}
{NULL} {lexeme=yytext(); return T_NULL;}
{THIS} {lexeme=yytext(); return T_THIS;}
{EXTENDS} {lexeme=yytext(); return T_EXTENDS;}
{IMPLEMENTS} {lexeme=yytext(); return T_IMPLEMENTS;}
{FOR} {lexeme=yytext(); return T_FOR;}
{WHILE} {lexeme=yytext(); return T_WHILE;}
{IF} {lexeme=yytext(); return T_IF;}
{ELSE} {lexeme=yytext(); return T_ELSE;}
{RETURN} {lexeme=yytext(); return T_RETURN;}
{BREAK} {lexeme=yytext(); return T_BREAK;}
{NEW} {lexeme=yytext(); return T_NEW;}
{NEWARRAY} {lexeme=yytext(); return T_NEWARRAY;}

//TOKEN PARA OPERADORES Y CARACTERES DE PUNTUACION
{SUMA} {lexeme=yytext(); return T_SUMA;}
{RESTA} {lexeme=yytext(); return T_RESTA;}
{MULTIPLICACION} {lexeme=yytext(); return T_MULTIPLICACION;}
{DIVISION} {lexeme=yytext(); return T_DIVISION;}
{PORCENTAJE} {lexeme=yytext(); return T_PROCENTAJE;}
{MENOR} {lexeme=yytext(); return T_MENOR;}
{MENORIGUAL} {lexeme=yytext(); return T_MENORIGUAL;}
{MAYOR} {lexeme=yytext(); return T_MAYOR;}
{MAYORIGUAL} {lexeme=yytext(); return T_MAYORIGUAL;}
{IGUAL} {lexeme=yytext(); return T_IGUAL;}
{IGUALDAD} {lexeme=yytext(); return T_IGUALDAD;}
{DIFERENTE} {lexeme=yytext(); return T_DIFERENTE;}
{AND} {lexeme=yytext(); return T_AND;}
{OR} {lexeme=yytext(); return T_OR;}
{NEGACION} {lexeme=yytext(); return T_NEGACION;}
{PUNTOYCOMA} {lexeme=yytext(); return T_PUNTOYCOMA;}
{COMA} {lexeme=yytext(); return T_COMA;}
{PUNTO} {lexeme=yytext(); return T_PUNTO;}
{CORCHIZQ} {lexeme=yytext(); return T_CORCHIZQ;}
{CORCHDER} {lexeme=yytext(); return T_CORCHDER;}
{PARENIZQ} {lexeme=yytext(); return T_PARENIZQ;}
{PARENDER} {lexeme=yytext(); return T_PARENDER;}
{LLAVEIZQ} {lexeme=yytext(); return T_LLAVEIZQ;}
{LLAVEDER} {lexeme=yytext(); return T_LLAVEDER;}
{CORCHETES} {lexeme=yytext(); return T_CORCHETES;}
{PARENTESIS} {lexeme=yytext(); return T_PARENTESIS;}
{LLAVES} {lexeme=yytext(); return T_LLAVES;}


{L}({L}|{D}|"_")* {lexeme=yytext(); return T_IDENTIFICADOR;}

{ENTER} {lexeme=yytext(); return ENTER;}
{WHITE} {lexeme=yytext(); return WHITE;}



. {lexeme=yytext(); return ERROR;}