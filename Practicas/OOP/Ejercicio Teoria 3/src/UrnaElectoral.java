package ejercicio.teoria.pkg3;

public class UrnaElectoral extends Urna {
    private int cantListas;
    private int[] votos;

    public UrnaElectoral(int numeroDeUrna, int cantListas){
        super.setNumeroDeUrna(numeroDeUrna);
        setCantListas(cantListas);
    }

    // general methods
    public boolean validarNumeroLista(int n){
        return (n >= 0) && (n < cantListas);
    }

    public void votarPorLista(int L){
        votos[L]++;
    }

    public void votar(int L){
        if(validarNumeroLista(L)){
            votarPorLista(L);
        } else {
            votarEnBlanco();
        }
    }

    public int devolverVotosPorLista(int L){
        return votos[L];
    }

    public int calcularGanador() {
        int indice = 0;
        int max = votos[0];        
        for(int i = 1; i < getCantListas(); i++){
            if(votos[i] > max){
                max = devolverVotosPorLista(i);
                indice = i;
            }
        }
        return indice;
    }

    public int calcularTotalVotos() {
       int total = getVotosEnBlanco();
       for(int i = 0; i < getCantListas(); i++){
            total += devolverVotosPorLista(i);
       }
       return total;
    }

    // getters y setters
    public int getCantListas() {
        return cantListas;
    }

    public void setCantListas(int cantListas) {
        this.cantListas = cantListas;
        votos = new int[cantListas];
    }

    // to string
    public String toString() {
        return super.toString() + " Cantidad de listas: " + getCantListas();
    }

}
