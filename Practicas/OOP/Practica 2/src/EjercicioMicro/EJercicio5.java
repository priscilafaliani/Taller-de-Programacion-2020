package EjercicioMicro;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class EJercicio5 {

    public static String generarDestinos(){
        String[] destinos = {"Capital", "La Plata", "Puerto Madero", "Lomas de Zamora", "Monte Grande", "Burzaco", "Berazategui", "Bahía Blanca", "Quilmes", "Florencio Varela", "Ezeiza", "Canning"};
        return destinos[GeneradorAleatorio.generarInt(destinos.length)];
    }

    public static String generarHorarios(){
        String[] horarios = {"08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"};
        return horarios[GeneradorAleatorio.generarInt(horarios.length)];
    }

    public static String generarPatentes(){
        String[] patentes = new String[20];
        // agrego patente de fin para el while y algunas conocidas para probar el programa
        patentes[0] = "ZZZ000";
        patentes[1] = "123ABC";
        patentes[2] = "1A2B3C";
        patentes[3] = "444AAA";
        for(int i = 4; i < patentes.length; i++){
            patentes[i] = GeneradorAleatorio.generarString(6);
        }        
        return patentes[GeneradorAleatorio.generarInt(patentes.length)];
    }

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        FlotaDeMicros flota = new FlotaDeMicros();

        Micro micro = new Micro(generarPatentes(), generarDestinos(), generarHorarios(), 20);        
        while(!flota.estaCompleta() && !micro.getPatente().equals("ZZZ000")){
            flota.agregarAFlota(micro);
            micro = new Micro(generarPatentes(), generarDestinos(), generarHorarios(), 20);  
        }

        flota.toStringMicros();

        System.out.println("Ingrese una patente de micro para eliminar: ");
        String patenteParaEliminar = Lector.leerString();
        if(flota.eliminarDeFlota(patenteParaEliminar)){
            System.out.println("Se elimino el micro!");
        } else if(flota.buscarPatente(patenteParaEliminar) == null){ // el micro no existía en la flota.
            System.out.println("El micro no está en la flota!");
        }

        System.out.println("Ingrese un destino: ");
        String destinoABuscar = Lector.leerString();
        Micro buscado = flota.buscarDestino(destinoABuscar);
        if(buscado != null){
            System.out.println("El micro con patente " + buscado.getPatente() + " va a ese destino!");
        } else {
            System.out.println("Ningún micro va ahí!");
        }
    }
}
