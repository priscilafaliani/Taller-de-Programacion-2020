import PaqueteLectura.*;
public class Ejercicio6 {

    static String darNombres() {
        String[] equipos = {"Boca", "River", "Gimnasia", "Estudiantes", "Argentinos Jr", "Racing", "Independiente", "Velez", "Newells", "San Lorenzo", "Huracan"};
        return equipos[GeneradorAleatorio.generarInt(equipos.length)];
    }

    static void mostrarPartidos(Partido[] partidos) {
        for(int i = 0; i < partidos.length; i++){
            System.out.println("Partido " + i + ": " + partidos[i].getLocal() + " vs " + partidos[i].getVisitante());
            System.out.println("Resultado (local, visitante): ("+ partidos[i].getGolesLocal() + ", " + partidos[i].getGolesVisitante() + ") ");
            System.out.println();
        }
    }

    public static void main(String[] args) {

        GeneradorAleatorio.iniciar();
        final int PARTIDOS = 20;
        Partido[] partidos = new Partido[PARTIDOS];
        int cantPartidos = 0;

        Partido partido = new Partido(darNombres(), darNombres(), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(1));
        while((cantPartidos < PARTIDOS) && !(partido.getVisitante().equals("ZZZ"))) {
            partidos[cantPartidos++] = partido;
            partido = new Partido(darNombres(), darNombres(), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarInt(10));
        }

        mostrarPartidos(partidos);        
        
        int empatados = 0, golesBoca = 0, ganoRiver = 0;
        for(int i = 0; i < cantPartidos; i++) {

            if(partidos[i].hayEmpate()) {
                empatados++;
            } else if (partidos[i].getGanador().equals("River")){
                ganoRiver++;
            }

            if(partidos[i].getLocal().equalsIgnoreCase("boca")){
                golesBoca += partidos[i].getGolesLocal();
            } else if (partidos[i].getVisitante().equals("Boca")){
                golesBoca += partidos[i].getGolesVisitante();
            }            

        }

        System.out.println("Cantidad de partidos empatados: " + empatados);
        System.out.println("Cantidad de goles de Boca: " + golesBoca);
        System.out.println("Cantidad de partidos que gano River: " + ganoRiver);
    }
}
