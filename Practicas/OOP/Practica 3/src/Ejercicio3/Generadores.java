package Ejercicio3;
import PaqueteLectura.GeneradorAleatorio;

public class Generadores {
    static public String generarNombre(){
        GeneradorAleatorio.iniciar();
        String[] nombres = {"Lucas", "Lola", "Federico", "Priscila", "Fernando", "Elias", "Macarena", "Letizia", "Catalina", "Agustin", "Agustina", "Leandro", "Julian", "Jennifer", "Elizabeth"};
        return nombres[GeneradorAleatorio.generarInt(nombres.length)];
    }

    static public String generarTrabajo(){
        GeneradorAleatorio.iniciar();
        String[] trabajos = {"Manejador de grua", "Arquitecto", "Diseñador", "Llevador de cafes", "Asistente", "Conductor", "Jefe de area", "Jefe de grupo", "Jefe de equipo", "Jefe", "Guadian", "Limpieza"};
        return trabajos[GeneradorAleatorio.generarInt(trabajos.length)];    
    }
}
