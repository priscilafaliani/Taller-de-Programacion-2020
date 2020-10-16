package Ejercicio2;

public class Entrenador extends Empleado {
    private int campeonatosGanados;


    // constructor
    public Entrenador(String nombre, double sueldoBasico, int campeonatosGanados){
        super(nombre, sueldoBasico);
        setCampeonatosGanados(campeonatosGanados);
    }

    // getters
    public int getCampeonatosGanados(){
        return campeonatosGanados;
    }

    // setters 
    public void setCampeonatosGanados(int campeonatosGanados){
        this.campeonatosGanados = campeonatosGanados;
    }

    // general methods
    public double calcularSueldoACobrar(){
        double adicional = 0;

        if(campeonatosGanados >= 1 && campeonatosGanados <= 4){
            adicional = 5000;
        } else if(campeonatosGanados >= 5 && campeonatosGanados <= 10){
            adicional = 30000;
        } else if(campeonatosGanados > 10){
            adicional = 50000;
        }

        return getSueldoBasico() + adicional;
    }
}
