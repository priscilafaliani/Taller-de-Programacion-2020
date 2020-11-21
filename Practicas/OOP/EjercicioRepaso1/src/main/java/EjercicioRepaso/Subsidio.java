package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Subsidio {
    private final double monto;
    private final String motivo;
    private boolean otorgado;
    
    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        setOtorgado(false);
    }
    
    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    public double getMonto() {
        return monto;
    }
    
    public boolean isOtorgado() {
        return otorgado;
    }
}
