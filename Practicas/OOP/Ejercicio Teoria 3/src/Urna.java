package ejercicio.teoria.pkg3;

public abstract class Urna {
    private int numeroDeUrna;
    private int votosEnBlanco;

    // general methods
    public void votarEnBlanco(){
        votosEnBlanco++;
    }

    public abstract void votar(int n);
    public abstract int calcularGanador();
    public abstract int calcularTotalVotos();

    // getters y setters
    public int getNumeroDeUrna() {
        return numeroDeUrna;
    }

    public int getVotosEnBlanco() {
        return votosEnBlanco;
    }

    public void setNumeroDeUrna(int numeroDeUrna) {
        this.numeroDeUrna = numeroDeUrna;
    }

    public void setVotosEnBlanco(int votosEnBlanco) {
        this.votosEnBlanco = votosEnBlanco;
    }
    
    public String toString() {
        return " Numero de Urna: " + getNumeroDeUrna() + "Votos en blanco: " + getVotosEnBlanco();
    }
}
