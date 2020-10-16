package Ejercicio3;

public class Persona {
    String nombre;
    int DNI;
    int edad;


    public Persona(String nombre, int DNI, int edad){
        setNombre(nombre);
        setDNI(DNI);
        setEdad(edad);
    }

    // getters y setters
    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String toString() {
        return getNombre() + " tiene DNI: " + getDNI() + " y tiene " + getEdad() + " años. ";
    }
}
