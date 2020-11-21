package galeria;

import java.util.Scanner;

public class Main {

    static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        Catalogo catalogo = new Catalogo();

        for (int i = 0; i < 3; i++) {
            catalogo.agregarArtista(leerArtista());
        }

        System.out.println("Catalogo...");
        System.out.println(catalogo);

        System.out.println("Arte en el que se destaca Bruno: " + catalogo.buscarArteDestacadoDe("Bruno"));
    }

    public static Artista leerArtista() {
        System.out.println("Nombre del artista: ");
        String nombre = scanner.next();
        System.out.println("Arte en que se destaca: ");
        Artista a = new Artista(nombre, scanner.next());
        leerObras(a);
        return a;
    }

    public static void leerObras(Artista a) {
        System.out.println("Obras del artista " + a.getNombre());
        for (int i = 0; i < 2; i++) {
            System.out.println("Nombre de la obra: ");
            a.agregarObra(scanner.next());
        }
    }

}
