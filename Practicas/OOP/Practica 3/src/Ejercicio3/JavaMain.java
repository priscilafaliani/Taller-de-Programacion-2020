package Ejercicio3;
import PaqueteLectura.GeneradorAleatorio;

public class JavaMain {
    public static void main(String[] args) {
        Persona persona = new Persona(Generadores.generarNombre(), GeneradorAleatorio.generarInt(10000000) + 10000000, GeneradorAleatorio.generarInt(80));
        Trabajador trabajador = new Trabajador(Generadores.generarNombre(), GeneradorAleatorio.generarInt(10000000) + 10000000, GeneradorAleatorio.generarInt(80), Generadores.generarTrabajo());

        System.out.println(persona);
        System.out.println(trabajador);
    }
}
