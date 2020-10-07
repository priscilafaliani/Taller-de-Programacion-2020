import PaqueteLectura.Lector;
public class Ejercicio5 {
    public static void main(String[] args) {
        final int nPalabras = 10;
        String[] palabras = new String[nPalabras];

        for(int i = 0; i < nPalabras; i++){
            palabras[i] = new String(Lector.leerString());
        }

        for(int i = 0; i < nPalabras; i++) {
            System.out.print(palabras[i].charAt(0));
        }
    }
}
