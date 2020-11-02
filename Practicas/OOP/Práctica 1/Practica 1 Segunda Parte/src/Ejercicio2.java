import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        final int nPersonas = 15;
        Persona[] personas = new Persona[nPersonas];

        for(int i = 0; i < personas.length; i++){
            personas[i] = new Persona(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarInt(2000) + 1000, GeneradorAleatorio.generarInt(90));
        }

        int adultosMayores = 0;
        Persona minDNI = personas[0];

        for(Persona persona : personas){
            if(persona.getDNI() < minDNI.getDNI())
                minDNI = persona;
            if(persona.getEdad() > 65){
                adultosMayores++;
            }
        }

        System.out.println("Personas mayores a 65: " + adultosMayores);
        System.out.println("Persona con el menor DNI: ");
        System.out.println(minDNI.toString());
    }
}
