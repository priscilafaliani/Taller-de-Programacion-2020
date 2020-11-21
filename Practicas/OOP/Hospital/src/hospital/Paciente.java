package hospital;

public class Paciente {
    private final int DNI;
    private final String nombre;
    private final String obraSocial;

    public Paciente(int DNI, String nombre, String obraSocial) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.obraSocial = obraSocial;
    }

    public int getDNI() {
        return DNI;
    }
}
