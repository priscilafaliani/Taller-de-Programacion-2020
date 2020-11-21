package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Investigador {
    private final String nombre;
    private final String apellido;
    
    int categoria;
    String especialidad;
    
    Subsidio[] subsidios;
    int cantSubsidios;
    
    public Investigador(String nombre, String apellido, int categoria, String especialidad) {
        this.nombre = nombre;
        this.apellido = apellido;
       
        cantSubsidios = 0;
        subsidios = new Subsidio[5];
        
        setCategoria(categoria);
        setEspecialidad(especialidad);
    }
    
    public void agregarSubsidio(Subsidio s) {
        if (cantSubsidios < 5) {            
            subsidios[cantSubsidios++] = s;
        } else {
            System.out.println("No se pueden solicitar más subsidios.");
        }
    }
    
    public double montoTotalOtorgado() {
        double total = 0;
        for (int i = 0; i < cantSubsidios; i++) {
            if (subsidios[i].isOtorgado()) {
                total += subsidios[i].getMonto();
            }
        }
        return total;
    }
    
    public void otorgarTodosLosSubsidios() {
        for (int i = 0; i < cantSubsidios; i++) {
            subsidios[i].setOtorgado(true);
        }
    }
    
    public int getCantSubsidios() {
        return cantSubsidios;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public String getApellido() {
        return apellido;
    }
    
    public int getCategoria() {
        return categoria;
    }
    
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    @Override
    public String toString() {
        return "Investigador: " + getNombre() + " " + getApellido() + ".\n" + "Categoria: " + getCategoria() + ".\n" + "Dinero de sus subsidios: " + montoTotalOtorgado() + "\n";
    }     

    
}
