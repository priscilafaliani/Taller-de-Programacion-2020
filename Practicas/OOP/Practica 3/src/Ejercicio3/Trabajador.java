package Ejercicio3;

public class Trabajador extends Persona {
    String tareaEnPredio;

    public Trabajador(String nombre, int DNI, int edad, String tareaEnPredio){
        super(nombre, DNI, edad);
        setTareaEnPredio(tareaEnPredio);
    }

    // getters y setters
    public String getTareaEnPredio() {
        return tareaEnPredio;
    }

    public void setTareaEnPredio(String tareaEnPredio) {
        this.tareaEnPredio = tareaEnPredio;
    }

    public String toString(){
        return super.toString() + " Trabajo de: " + getTareaEnPredio();
    }
}
