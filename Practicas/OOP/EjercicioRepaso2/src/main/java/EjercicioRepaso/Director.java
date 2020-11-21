package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Director extends Persona {
    int antiguedad;
    
    public Director(String nombre, String dni, int antiguedad) {
        super(nombre, dni);
        setAntiguedad(antiguedad);
    }
    
    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }
    
    public String toString() {
        return super.toString() + "Antiguedad: " + getAntiguedad() + " años.\n";
    }
}
