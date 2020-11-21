package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class CoroSemicircular extends Coro {
    private final Corista[] coristas;

    public CoroSemicircular(Director director, int cantCoristas) {
        super(director, cantCoristas);
        coristas = new Corista[cantCoristas];     
    }
    
    @Override
    public void agregarCorista(Corista c) {
        if (!estaLleno()) {
            coristas[getTotalCoristas()] = c;
            incrementarTotalCoristas();
        }
    }
    
    @Override
    public boolean estaBienFormado() {
        if (getTotalCoristas() != getMaxCoristas()) return false;
        
        for (int i = 1; i < coristas.length; i++) {
            if (coristas[i - 1].getTonoFundamental() < coristas[1].getTonoFundamental()) {
                return false;
            }
        }
        
        return true;
    }
    
    String toStringCoristas() {
        StringBuilder data = new StringBuilder();
        
        for (int i = 0; i < getTotalCoristas(); i++) {
            data.append(coristas[i].toString()).append("\n");
        }
        
        return data.toString();
    }
    
    public String toString() {
        return super.toString() + toStringCoristas();
    }
}
