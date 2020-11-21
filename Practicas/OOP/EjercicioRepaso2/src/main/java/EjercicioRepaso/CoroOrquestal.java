package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class CoroOrquestal extends Coro {
    private Corista[][] coristas;
    
    private int filaActual = 0;
    private int columnaActual = 0;
    
    
    public CoroOrquestal(Director director, int hileras, int integrantesPorHilera) {
        super(director, hileras * integrantesPorHilera);
        coristas = new Corista[hileras][integrantesPorHilera];
    }
    
    @Override
    public boolean estaBienFormado() {
        if (getTotalCoristas() != getMaxCoristas()) return false;
        
        for (int i = 0; i < coristas.length; i++) {
            int j = 0;
            if (i < (coristas.length - 1) && coristas[i][j].getTonoFundamental() != coristas[i + 1][j].getTonoFundamental()) {
                return false;
            }
            for (j = 1; j < coristas[0].length; j++) {
                if (coristas[i][j - 1].getTonoFundamental() != coristas[i][j].getTonoFundamental()) {
                    return false;
                }             
            }
        }        
        
        return true;
    }
    
    @Override
    public void agregarCorista(Corista c) {
        if (!estaLleno()) {
            coristas[filaActual][columnaActual] = c;
            actualizarFilaColumna();
            incrementarTotalCoristas();
        }
    }
    
    private void actualizarFilaColumna() {
        if (++columnaActual == coristas[0].length) {
            filaActual++;
            columnaActual = 0;
        }
    }
    
    @Override
    String toStringCoristas() {
        StringBuilder data = new StringBuilder();
        
        int i = 0, j = 0;
        while (i < filaActual) {
            data.append(coristas[i][j++].toString());
            
            if (j > columnaActual) {
                i++;
                j = 0;
            }
        }
        
        return data.toString();
    }
    
    public String toString() {
        return super.toString() + toStringCoristas();
    }
    
}
