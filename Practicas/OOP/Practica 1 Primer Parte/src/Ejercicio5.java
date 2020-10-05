import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio5 {

    public static void main(String[] args) {
        final int pisos = 8;
        final int oficinas = 4;

        int[][] edificio = new int[pisos][oficinas];

        /* Simulo llegada de personas */
        int piso, oficina;

        piso = GeneradorAleatorio.generarInt(9);
        while((piso != 8)) {
            oficina = GeneradorAleatorio.generarInt(4);
            edificio[piso][oficina]++;
            piso = GeneradorAleatorio.generarInt(9);        }

        /* Imprime la cantidad de personas por oficina y piso*/
        for(int i = 0; i < pisos; i++) {

            for(int j = 0; j < oficinas; j++) {
                System.out.println("Vinieron " + edificio[i][j] + " personas hoy a la oficina " + j + " del piso " + i + ". ");
            }

        }
    }

}
