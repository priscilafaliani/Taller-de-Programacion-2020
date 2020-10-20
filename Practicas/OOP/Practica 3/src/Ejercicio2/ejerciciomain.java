package Ejercicio2;
import PaqueteLectura.GeneradorAleatorio;
public class ejerciciomain {
    public static void main(String[] args) {
        Empleado[] empleados = new Empleado[4];
        for(int i = 0; i < 2; i++){
            empleados[i] = new Jugador(Generadores.generarNombre(), GeneradorAleatorio.generarDouble(20000) + 10000, GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(50));
            empleados[i + 1] = new Entrenador(Generadores.generarNombre(), GeneradorAleatorio.generarDouble(20000) + 10000, GeneradorAleatorio.generarInt(50));
        }

        for(int i = 0; i < 2; i++){
            System.out.println(empleados[i].toString() + " sueldo a cobrar: " + empleados[i].calcularSueldoACobrar());
            System.out.println(empleados[i + 1].toString() + " sueldo a cobrar: " + empleados[i + 1].calcularSueldoACobrar());
        }
        
    }
}
