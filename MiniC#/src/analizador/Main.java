/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package analizador;

import java.io.File;

/**
 *
 * @author Carlos
 */


public class Main {

    /**
     * @param args the command line arguments
     */
    //public static void main(String[] args) {
    public static void main(String ubicacion) {
        
        
        //String path = "C:/Users/Pimentel/Desktop/MiniC#/src/analizador/Lexer.flex";
        String path =ubicacion;
        generarLexer(path);

    }
    public static void generarLexer(String path){
        File file=new File(path);
        JFlex.Main.generate(file);
    }
}
