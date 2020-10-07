import PaqueteLectura.*;
public class Ejercicio4 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        final int dias = 5;
        final int turnos = 8;
        Persona[][] casting = new Persona[dias][turnos];
        
        int cuposDados = 0;
        int diasDados = 0; int turnosDados = 0;

        //Persona persona = new Persona(GeneradorAleatorio.generarString(3), GeneradorAleatorio.generarInt(1000)+1000, GeneradorAleatorio.generarInt(90) + 18);
        Persona persona = new Persona(Lector.leerString(), Lector.leerInt(), Lector.leerInt());
        while( (diasDados < dias) && !(persona.getNombre().equals("ZZZ")) ) {            
            if(turnosDados < turnos) {
                casting[diasDados][turnosDados++] = persona;
                cuposDados++;
            } else {
                turnosDados = 0;
                diasDados++;
            }
            //persona = new Persona(GeneradorAleatorio.generarString(3), GeneradorAleatorio.generarInt(1000)+1000, GeneradorAleatorio.generarInt(90) + 18);
            persona = new Persona(Lector.leerString(), Lector.leerInt(), Lector.leerInt());
        }        

        diasDados = 0; turnosDados = 0;
        for(int i = 0; i < cuposDados; i++) {
            if(turnosDados == turnos){
                turnosDados = 0;
                diasDados++;
            }
            System.out.println(casting[diasDados][turnosDados].getNombre() + " tiene turno el dia " + (diasDados + 1) + " de la semana, en el turno " + turnosDados++);
        }
    }

}
