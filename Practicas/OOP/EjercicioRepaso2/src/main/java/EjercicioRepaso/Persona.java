package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public abstract class Persona {
    private final String nombre;
    private final String dni;
    private int edad;
    
    public Persona(String nombre, String dni) {
        this.nombre = nombre;
        this.dni = dni;
    }
    
    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public String getDni() {
        return dni;
    }
    
    public String toString() {
        return getNombre() + "\nDNI: " + getDni() + "\n";
    }
}
