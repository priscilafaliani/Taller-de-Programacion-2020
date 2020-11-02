package ejercicio.teoria.pkg3;

public class UrnaReferendum extends Urna{
    private int votosAFavor;
    private int votosEnContra;

    public UrnaReferendum(int numeroDeUrna){
        super.setNumeroDeUrna(numeroDeUrna);
    }

    // general methods
    public void votarAFavor(){
        votosAFavor++;
    }

    public void votarEnContra(){
        votosEnContra++;
    }

    // setVotosAFavor(getVotosAFavor()++);

    public void votar(int n) {
        if(n == 0){
            votarEnBlanco();
        } else if(n > 0){
            votarAFavor();
        } else {
            votarEnContra();
        }
    }

    public boolean huboEmpate(){
        return getVotosAFavor() == getVotosEnContra();
    }

    public int calcularGanador() {
        if(!huboEmpate()){
            return getVotosAFavor() > getVotosEnContra() ? 1 : 0;
        }
        return -1;
    }

    public int calcularTotalVotos() {
        return getVotosAFavor() + getVotosEnContra() + getVotosEnBlanco();
    }

    // getters y setters
    public int getVotosAFavor() {
        return votosAFavor;
    }

    public int getVotosEnContra() {
        return votosEnContra;
    }

    public void setVotosAFavor(int votosAFavor) {
        this.votosAFavor = votosAFavor;
    }

    public void setVotosEnContra(int votosEnContra) {
        this.votosEnContra = votosEnContra;
    }

    // to string
    public String toString() {
        return super.toString() + " Votos a favor: " + getVotosAFavor() + " Votos en contra: " + getVotosEnContra();
    }
}
