package hospital;

public class Cama {
    private static int numeros = 1;

    private final int numero = numeros++;

    private Paciente paciente;
    private int diasOcupada;
    private boolean ocupada;

    public Cama() {
        ordenarCama();
    }

    public void ordenarCama() {
        setOcupada(false);
        diasOcupada = 0;
    }

    public void registrarPaciente(Paciente paciente) {
        this.paciente = paciente;
        setOcupada(true);
    }

    private void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void incrementarDias() {
        this.diasOcupada++;
    }

    public Paciente getPaciente() {
        return paciente;
    }
}
