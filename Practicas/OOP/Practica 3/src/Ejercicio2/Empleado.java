package Ejercicio2;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;

    public Empleado(String nombre, double sueldoBasico){
        setNombre(nombre);
        setSueldoBasico(sueldoBasico);
    }

    // getters y setters
    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    // general methods
    public abstract double calcularSueldoACobrar();

    public String toString() {
        return "Nombre: " + getNombre() + " sueldo basico: " + getSueldoBasico();
    }
}
