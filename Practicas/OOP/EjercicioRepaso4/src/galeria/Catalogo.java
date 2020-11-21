package galeria;

import java.util.Arrays;

public class Catalogo {
    private final Artista[] artistas;
    private int cantArtistas;

    public Catalogo() {
        this.artistas = new Artista[15];
        this.cantArtistas = 0;
    }

    public void agregarArtista(Artista a) {
        if (cantArtistas < artistas.length) {
            artistas[cantArtistas++] = a;
        } else {
            System.out.println("No se pueden agregar más artistas.");
        }
    }

    public String buscarArteDestacadoDe(String nombre) {
        for (int i = 0; i < cantArtistas; i++) {
            if (artistas[i].getNombre().equals(nombre)) {
                return artistas[i].getArte();
            }
        }
        return "Ese artista no existe.";
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder(cantArtistas);

        for (int i = 0; i < cantArtistas; i++) {
            res.append("Representación del artista ").append(i).append(":\n").append(artistas[i]).append("\n");
        }

        return res.toString();
    }
}
