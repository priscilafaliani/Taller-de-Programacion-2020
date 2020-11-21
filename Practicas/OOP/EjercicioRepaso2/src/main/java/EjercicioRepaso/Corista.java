package EjercicioRepaso;

/**
 *
 * @author Prisc
 */
public class Corista extends Persona{
   int tonoFundamental;
   
   public Corista(String nombre, String dni, int tonoFundamental) {
       super(nombre, dni);
       setTonoFundamental(tonoFundamental);
   }
   
   public void setTonoFundamental(int tonoFundamental) {
       this.tonoFundamental = tonoFundamental;
   }
   
   public int getTonoFundamental() {
       return tonoFundamental;
   }
   
   @Override
   public String toString() {
       return super.toString() + "Tono fundamental: " + getTonoFundamental() + ".\n";
   }
}
