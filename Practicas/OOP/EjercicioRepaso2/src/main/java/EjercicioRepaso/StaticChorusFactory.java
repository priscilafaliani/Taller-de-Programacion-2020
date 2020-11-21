/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjercicioRepaso;

import java.util.Scanner;

/**
 *
 * @author Prisc
 */
public class StaticChorusFactory {
    
    static final Scanner scanner = new Scanner(System.in);
        
    public static CoroSemicircular crearCoroSemicircular(){
        System.out.println("Coro semicircular...");
        
        System.out.println("Cantidad de coristas: ");
        int cantidadCoristas = scanner.nextInt();    
        
        Director d = leerDirector();        
        
        CoroSemicircular c =   new CoroSemicircular(d, cantidadCoristas);
        
        leerCoristas(c);
        
        return c;        
    }
    
    public static CoroOrquestal crearCoroOrquestal() {
        System.out.println("Coro orquestal...");
        
        System.out.println("Cantidad de hileras: ");
        int hileras = scanner.nextInt();
        
        System.out.println("Cantidad de integrantes por hilera: ");
        int iPorHilera = scanner.nextInt();
        
        Director d = leerDirector();
        
        CoroOrquestal c = new CoroOrquestal(d, hileras, iPorHilera);
        
        leerCoristas(c);
        
        return c;
    }
    
    public static Director leerDirector() {
        System.out.println("Nombre del director: ");
        String nombre = scanner.next();
        
        System.out.println("Dni del director: ");
        String dni = scanner.next();
        
        System.out.println("Antiguedad: ");
        int antiguedad = scanner.nextInt();
        
        return new Director(nombre, dni, antiguedad);
    }
    
    public static Corista leerCorista() {
        System.out.println("Nombre del corista: ");
        String nombre = scanner.next();
        
        System.out.println("Dni del corista: ");
        String dni = scanner.next();
        
        System.out.println("Tono fundamental: ");
        int tonoFundamental = scanner.nextInt();
        
        return new Corista(nombre, dni, tonoFundamental);
    }
    
    public static void leerCoristas(Coro c) {
        while (c.getTotalCoristas() != c.getMaxCoristas()) {
            c.agregarCorista(leerCorista());
        }
    }

}
