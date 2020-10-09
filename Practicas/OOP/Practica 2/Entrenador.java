public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatosGanados;

    // constructors
    public Entrenador(String nombre, double sueldoBasico, int campeonatosGanados){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.campeonatosGanados = campeonatosGanados;
    }

    public Entrenador(String nombre, double sueldoBasico){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
    }

    public Entrenador(String nombre, int campeonatosGanados){
        this.nombre = nombre;
        this.campeonatosGanados = campeonatosGanados;
    }

    public Entrenador(String nombre){
        this.nombre = nombre;
    }

    public Entrenador(){

    }

    // getters
    public String getNombre(){
        return nombre;
    }

    public double getSueldoBasico(){
        return sueldoBasico;
    }

    public int getCampeonatosGanados(){
        return campeonatosGanados;
    }

    // setters 
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setCampeonatosGanados(int campeonatosGanados){
        this.campeonatosGanados = campeonatosGanados;
    }

    // general methods
    public double calcualrSueldoACobrar(){
        double adicional = 0;

        if(campeonatosGanados >= 1 && campeonatosGanados <= 4){
            adicional = 5000;
        } else if(campeonatosGanados >= 5 && campeonatosGanados <= 10){
            adicional = 30000;
        } else if(campeonatosGanados > 10){
            adicional = 50000;
        }

        return sueldoBasico + adicional;
    }
}
