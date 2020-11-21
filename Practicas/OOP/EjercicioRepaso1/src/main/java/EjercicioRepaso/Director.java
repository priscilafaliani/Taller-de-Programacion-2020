package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Director {
    private final String nombre;
    private final String apellido;
    
    public Director(String nombre, String apellido) {
        this.nombre = nombre;
        this.apellido = apellido;
    }
    
    @Override
    public String toString() {
        return "Director: " + nombre + " " + apellido + ".\n";
    }
}
