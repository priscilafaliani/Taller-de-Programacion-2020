package ejercicio.teoria.pkg3;

import PaqueteLectura.Lector;

public class EjercicioTeoria3 {

    public static void main(String[] args) {
        UrnaElectoral urnaElec = new UrnaElectoral(203, 5);
        UrnaReferendum urnaRef = new UrnaReferendum(203);

        int numUrna;

        System.out.println("DNI: ");
        String DNI = Lector.leerString();
        while(!DNI.equals("0")){
            System.out.println("Ingrese numero de urna electoral: ");
            numUrna = Lector.leerInt();
            urnaElec.votar(numUrna);

            System.out.println("Ingrese numero para votar en la urna referendum: ");
            numUrna = Lector.leerInt();
            urnaRef.votar(numUrna);

            System.out.println("DNI: ");
            DNI = Lector.leerString();
        }

        int ganador = urnaElec.calcularGanador();
        double porcentaje = (urnaElec.devolverVotosPorLista(ganador) / (double)urnaElec.calcularTotalVotos()) * 100;
        System.out.println("Ganador de la urna electoral, lista: " + ganador);     
        System.out.println("Porcentaje de votos de la lista ganadora de la urna electoral con respecto al total de votos: " + porcentaje + "%");

        ganador = urnaRef.calcularGanador();
        System.out.print("Resultado de la urna referendum: ");
        if(ganador == 0){
            System.out.println("Hubo empate");
        } else if (ganador == -1){
            System.out.println("Se voto en contra");
            porcentaje = (urnaRef.getVotosEnContra()/(double)urnaRef.calcularTotalVotos()) * 100;
            System.out.println("Porcentaje de votos en contra con respecto al total de votos: " + porcentaje + "%");
        } else {
            System.out.println("Se voto a favor");
            porcentaje = (urnaRef.getVotosAFavor()/(double)urnaRef.calcularTotalVotos()) * 100;
            System.out.println("Porcentaje de votos a favor con respecto al total de votos: " + porcentaje + "%");
        }              
    }
    
}
