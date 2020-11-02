import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ejercicio4 {
    public static void main(String[] args) {
        /* Matriz de n*n */        
        final int filas = 10;
        final int columnas = 10;
        int[][] numeros = new int[filas][columnas];

        /* Inicializada con nÃºmeros entre 0 y 200*/
        for(int i = 0; i < filas; i++){

            for(int j = 0; j < columnas; j++){
                numeros[i][j] = GeneradorAleatorio.generarInt(200);
            }

        }

        /* Se muestra el contenido */
        for(int i = 0; i < filas; i++){

            for(int j = 0; j < columnas; j++){
                System.out.print(numeros[i][j] + "\t");
            }

            System.out.println();

        }

        /* Calcula la suma de los elementos entre filas 2 y 9 y columnas 0 y 3*/
        int total = 0;
        for (int i = 2; i < 10; i++) {

            for(int j = 0; j < 4; j++) {
                total += numeros[i][j];
            }

        }

        System.out.println("Suma de las filas y columas elegidas: " + total);

        /* Suma de todas las columnas de la matriz */
        int[] sumaColumnas = new int[10];

        for(int i = 0; i < columnas; i++){
            sumaColumnas[i] = 0;
        }
        
        for(int i = 0; i < columnas; i++) {

            for(int j = 0; j < filas; j++){
                sumaColumnas[i] += numeros[j][i]; 
            }

        }

        for(int i = 0; i < columnas; i++){
            System.out.println("Total de la columna " + i + ": " + sumaColumnas[i]);
        }

        /* Busca si n existe */
        System.out.print("Ingrese un numero a buscar en la matriz: ");
        int n = Lector.leerInt();

        int i = 0;
        int j = 0;
        while( (i < filas) && (numeros[i][j] != n)){
            j++;
            if(j >= columnas){
                j = 0;
                i++;
            }
        }

        if(i >= filas) {
            System.out.println("No se encontrÃ³ el elemento");
        } else {
            System.out.println("Numero encontrado en (" + i + ", " + j + ")");
        }


    }

}
