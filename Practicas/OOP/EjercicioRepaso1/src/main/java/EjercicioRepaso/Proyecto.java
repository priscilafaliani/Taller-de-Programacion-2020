package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Proyecto {
    private final String nombre;
    private final int codigo;
    
    private Director director;
    
    private final Investigador[] investigadores;
    private int cantInvestigadores;
    
    public Proyecto(String nombre, int codigo) {
        this.nombre = nombre;
        this.codigo = codigo;
        investigadores = new Investigador[50];
        cantInvestigadores = 0;
    }
    
    public void setDirector(Director d) {
        this.director = d;
    }
    
    public void agregarInvestigador(Investigador i) {
        if (cantInvestigadores < 50) {
            investigadores[cantInvestigadores++] = i;
        } else {
            System.out.println("No se pueden agregar más investigadores al proyecto.");
        }
    }
    
    public double dineroTotalOtorgado() {
        double total = 0;
        for (Investigador investigador : investigadores) {
            total += investigador.montoTotalOtorgado();
        }
        return total;
    }
    
    public int cantidadDeSubsidios(String nombre_y_apellido) {
        String[] datos = nombre_y_apellido.split(" ");
        
        if (datos.length >= 2) {
            Investigador investigador = buscarInvestigador(datos[0], datos[1]);  
            
            if (investigador != null) {
                return investigador.getCantSubsidios(); 
            }            
        }
        
        return -1;
    }
    
    private Investigador buscarInvestigador(String nombre, String apellido) {
        for (Investigador investigador : investigadores) {
            if (investigador.getNombre().equals(nombre) && investigador.getApellido().equals(apellido)) {
                return investigador;
            }
        }
        return null;
    }
    
    public void otorgarTodos(String nombre_y_apellido) {
        String[] datos = nombre_y_apellido.split(" ");
        
        if (datos.length >= 2) {
            Investigador investigador = buscarInvestigador(datos[0], datos[1]);
            
            investigador.otorgarTodosLosSubsidios();
        }
    }
    
    public String toStringInvestigadores() {
        StringBuilder data = new StringBuilder(cantInvestigadores);
        
        for (int i = 0; i < cantInvestigadores; i++) {
            data.append(investigadores[i]).append("\n");
        }

        return data.toString();
    }
    
    @Override
    public String toString() {
        return "Nombre del proyecto: " + nombre + " Codigo: " + codigo + "\n" + director.toString() + "\n" + toStringInvestigadores();
    }
}
