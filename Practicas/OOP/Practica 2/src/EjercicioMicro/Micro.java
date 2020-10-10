package EjercicioMicro;
public class Micro {    
    private String patente;
    private String destino;
    private String hora;
    // por defecto
    private int cantAsientos = 20;
    private boolean[] asientos;
    private int asientosOcupados;

    public Micro(String patente, String destino, String hora, int cantAsientos){
        this.patente = patente;
        this.destino = destino;
        this.hora = hora;     
        this.cantAsientos = cantAsientos;   
        asientos = new boolean[cantAsientos];        
        asientosOcupados = 0;
    }
    public Micro(String patente, String destino, String hora){
        this.patente = patente;
        this.destino = destino;
        this.hora = hora;
        asientos = new boolean[cantAsientos];
        asientosOcupados = 0;
    }

    // getters
    public String getPatente() {
        return patente;
    }

    public String getDestino() {
        return destino;
    }

    public String getHora() {
        return hora;
    }

    public int getAsientosOcupados() {
        return asientosOcupados;
    }

    // setters
    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
    
    public void setHora(String hora) {
        this.hora = hora;
    }

    // general methods
    public boolean estaLleno(){
        return asientosOcupados == cantAsientos;
    }

    // retorna true si es un asiento valido
    public boolean esAsientoValido(int asiento){
        return (asiento >= 0 && asiento < 20);
    }

    // retorna true si esta ocupado
    public boolean estaOcupado(int asiento){
        return asientos[asiento] == true ? true : false;
    }

    public void ocuparAsiento(int asiento){
        asientos[asiento] = true;
        asientosOcupados++;
    }

    public void liberarAsiento(int asiento){
        asientos[asiento] = false;
        asientosOcupados--;
    }

    public int primerAsientoLibre(){
        int i = 0;
        while(i < cantAsientos && asientos[i] != false){
            i++;
        }
        // puede ser que retorne 0 pero que el primer asiento esté ocupado igualmente
        return asientos[i] == false ? i : -1;
    }

    public String toString() {
        return "El micro con patente " + patente + " va hacia " + destino + " con salida a las " + hora;
    }
}
