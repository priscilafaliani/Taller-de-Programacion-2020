package hospital;

public class Hospital {
    private final int totalCamas = 100;
    private final String direccion;
    private final String nombre;
    private final Cama[] camas;


    public Hospital(String nombre, String direccion) {
        this.camas = new Cama[totalCamas];
        prepararCamas();
        this.nombre = nombre;
        this.direccion = direccion;
    }

    private void prepararCamas() {
        for (int i = 0; i < totalCamas; i++) {
            camas[i] = new Cama();
        }
    }

    public void ingresarPaciente(Paciente paciente, int numero) {
        if (numero >= 0 && numero <= 100 && !camas[numero].isOcupada())
            camas[numero].registrarPaciente(paciente);
    }
    
    public void incrementarDias() {
        for (Cama c : camas) {
            if (c.isOcupada()) {
                c.incrementarDias();
            }
        }
    }

    private int buscarPaciente(int DNI) {
        for (int i = 0; i < totalCamas; i++) {
            if (camas[i].isOcupada() && camas[i].getPaciente().getDNI() == DNI) {
                return i;
            }
        }
        return -1;
    }

    public void darDeAlta(int DNI) {
        int cama = buscarPaciente(DNI);
        if (cama != -1) {
            System.out.println("¡Adios!");
            camas[cama].ordenarCama();
        } else {
            System.out.println("Ese paciente no existe.");
        }
    }

    public int totalInternados() {
        int total = 0;
        for (Cama c : camas) {
            if (c.isOcupada()) {
                total++;
            }
        }
        return total;
    }
}
