package galeria;

public class Artista {
    private final String nombre;
    private final String[] obras;
    private int cantObras;
    private String arte;

    public Artista(String nombre, String arte) {
        this.nombre = nombre;
        this.obras = new String[5];
        this.cantObras = 0;
        setArte(arte);
    }

    public String getNombre() {
        return nombre;
    }

    public void setArte(String arte) {
        this.arte = arte;
    }

    public String getArte() {
        return arte;
    }

    public void agregarObra(String obra) {
        if (cantObras < obras.length) {
            obras[cantObras++] = obra;
        } else {
            System.out.println("No se pueden agregar más obras.");
        }
    }

    public String obrasToString() {
        StringBuilder obrasStr = new StringBuilder(cantObras);

        for (int i = 0; i < cantObras; i++) {
            obrasStr.append(obras[i]).append(" - ");
        }

        obrasStr.append(".\n");

        return obrasStr.toString();
    }

    @Override
    public String toString() {
        return "Nombre: " + nombre + ".\nArte: " + arte + ".\nObras: " + obrasToString() + ".\n";
    }
}
