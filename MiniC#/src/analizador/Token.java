/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package analizador;

/**
 *
 * @author Pimentel
 */
public enum Token {
    T_CONST_BOOLEANO, T_CONST_ENTERO,T_CONST_DOUBLE,T_CONST_STRING,
    T_VOID, T_INT,T_DOUBLE,T_BOOL,T_STRING,T_CLASS,T_INTERFACE,T_NULL,T_THIS,T_EXTENDS,T_IMPLEMENTS,T_FOR,T_WHILE,T_IF,T_ELSE,T_RETURN,T_BREAK,T_NEW,T_NEWARRAY,
    T_SUMA,T_RESTA,T_MULTIPLICACION,T_DIVISION,T_PROCENTAJE,T_MENOR,T_MENORIGUAL,T_MAYOR,T_MAYORIGUAL,T_IGUAL,T_IGUALDAD, T_DIFERENTE, T_AND,T_OR,T_NEGACION,
    T_PUNTOYCOMA,T_COMA,T_PUNTO, T_CORCHIZQ,T_CORCHDER,T_PARENIZQ,T_PARENDER,T_LLAVEIZQ,T_LLAVEDER,T_CORCHETES,T_PARENTESIS,T_LLAVES, T_IDENTIFICADOR, ERROR,
    ENTER, WHITE, COMENTARIO1, COMENTARIO2, ERROR1
    
}
