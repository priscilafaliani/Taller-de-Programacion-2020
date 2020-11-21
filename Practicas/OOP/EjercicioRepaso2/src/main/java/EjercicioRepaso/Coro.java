package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public abstract class Coro {
    private String nombre;
    private Director director;
    
    private int maxCoristas;
    private int totalCoristas;
    
    public Coro(Director director, int maxCoristas) {
        this.director = director;
        this.maxCoristas = maxCoristas;
        totalCoristas = 0;
    }
    
    public boolean estaLleno() {
        return maxCoristas == totalCoristas;
    }
    
    public int getMaxCoristas() {
        return maxCoristas;
    }
    
    public int getTotalCoristas() {
        return totalCoristas;
    }
    
    public void incrementarTotalCoristas() {
        totalCoristas++;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setDirector(Director director) {
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista c);
    
    public abstract boolean estaBienFormado();
    
    abstract String toStringCoristas();
    
    public String toString() {
        return "Nombre coro: " + getNombre() + "\nDirector: " + director.toString() + "\n";
    }
}
