import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio1 {

    public static void main(String[] args) {
        Persona persona = new Persona(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarInt(2000), GeneradorAleatorio.generarInt(90));
        System.out.println(persona.toString());
    }
    
}
