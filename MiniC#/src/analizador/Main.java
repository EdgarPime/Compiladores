/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package analizador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Edgar
 */


public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException, Exception {
    //public static void main(String ubicacion) {
        
        
        String path = "C:/Users/Pimentel/Desktop/Compiladores/MiniC#/src/analizador/Lexer.flex";
        //String path =ubicacion;
        generarLexer(path);
        
        String path1 = "C:/Users/Pimentel/Desktop/Compiladores/MiniC#/alexico.flex";
        //String path =ubicacion;
        generarLexer(path1);
 
        String archSintactico = "C:/Users/Pimentel/Desktop/Compiladores/MiniC#/asintactico.cup";
        System.out.println("\n*** Procesando archivo default ***\n");
        String[] asintactico = {"-parser", "AnalizadorSintactico", archSintactico};
      
        java_cup.Main.main(asintactico);
        
        boolean mvAL = moverArch("AnalizadorLexico.java");
        boolean mvAS = moverArch("AnalizadorSintactico.java");
        boolean mvSym= moverArch("sym.java");
    }
    public static void generarLexer(String path){
        File file=new File(path);
        JFlex.Main.generate(file);
    }
    
    public static boolean moverArch(String archNombre) {
        boolean efectuado = false;
        File arch = new File(archNombre);
        if (arch.exists()) {
            System.out.println("\n*** Moviendo " + arch + " \n***");
            Path currentRelativePath = Paths.get("");
            String nuevoDir = currentRelativePath.toAbsolutePath().toString()
                    + File.separator + "src" + File.separator
                    + "analizador" + File.separator + arch.getName();
            File archViejo = new File(nuevoDir);
            archViejo.delete();
            if (arch.renameTo(new File(nuevoDir))) {
                System.out.println("\n*** Generado " + archNombre + "***\n");
                efectuado = true;
            } else {
                System.out.println("\n*** No movido " + archNombre + " ***\n");
            }

        } else {
            System.out.println("\n*** Codigo no existente ***\n");
        }
        return efectuado;
    }
    
    
}
