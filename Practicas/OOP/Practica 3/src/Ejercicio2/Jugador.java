package Ejercicio2;

public class Jugador extends Empleado {
    private int partidosJugados;
    private int golesAnotados;

    // constructor
    public Jugador(String nombre, double sueldoBasico, int partidosJugados, int golesAnotados){
        super(nombre, sueldoBasico);
        setGolesAnotados(golesAnotados);
        setPartidosJugados(partidosJugados);
    }

    // getters y setters
    public int getPartidosJugados() {
        return partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    // general methods
    public double calcularPromedioDeGoles(){
        return golesAnotados / partidosJugados;
    }

    public double calcularSueldoACobrar() {
        return calcularPromedioDeGoles() > 0.5 ? getSueldoBasico() * 2 : getSueldoBasico();
    }
}
