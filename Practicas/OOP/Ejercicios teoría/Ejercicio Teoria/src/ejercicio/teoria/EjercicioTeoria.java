package ejercicio.teoria;

import PaqueteLectura.*;

public class EjercicioTeoria {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        final int pisos = 5;
        final int plazas = 10;
        Auto[][] estacionamiento = new Auto[pisos][plazas];

        
        

        int piso, plaza; String nombre; Auto auto;
        //int patente = GeneradorAleatorio.generarInt(100);
        int patente = Lector.leerInt();
        while(patente != 0) {     

            if(patente % 2 == 0) {
                System.out.println("*_________PUEDE PASAR _________*");
                System.out.println("Ingrese el piso y la plaza: ");
                piso = Lector.leerInt();
                plaza = Lector.leerInt();        
                System.out.println("Su nombre: ");
                nombre = Lector.leerString();
                // Asumiendo que el piso/plaza son válidas y está desocupado
                auto = new Auto(patente, nombre);
                estacionamiento[piso][plaza] = auto;
            }
            //patente = GeneradorAleatorio.generarInt(100);
            patente = Lector.leerInt();
        }

        int ocupacion = 0, masOcupado = -32767;
        piso = 0;
        for(int i = 0; i < pisos; i++) {
            for(int j = 0; j < plazas; j++){
                if(estacionamiento[i][j] != null)
                    ocupacion++;
            }
            if(ocupacion > masOcupado) {
                piso = i;
            }
        }

        System.out.println("____Se informa para cada piso y plaza, el auto que la ocupa____ ");
        for(int i = 0; i < pisos; i++) {
            for(int j = 0; j < plazas; j++){
                if(estacionamiento[i][j] != null)
                    System.out.println("Piso " + (i + 1) + ". Plaza: " + (j + 1) + " -> " + estacionamiento[i][j].toString());
            }
        }
        
    }
    
}
