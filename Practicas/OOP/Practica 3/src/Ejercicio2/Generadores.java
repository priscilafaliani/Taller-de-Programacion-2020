package Ejercicio2;
import PaqueteLectura.GeneradorAleatorio;

public class Generadores {
    static public String generarNombre(){
        GeneradorAleatorio.iniciar();
        String[] nombres = {"Lucas", "Lola", "Federico", "Priscila", "Fernando", "Elias", "Macarena", "Letizia", "Catalina", "Agustin", "Agustina", "Leandro", "Julian", "Jennifer", "Elizabeth"};
        return nombres[GeneradorAleatorio.generarInt(nombres.length)];
    }
}
