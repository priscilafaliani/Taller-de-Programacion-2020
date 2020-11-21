package EjercicioRepaso;


import java.util.Scanner;
/**
 *
 * @author Prisc
 */
public class Main {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        Coro[] coros = new Coro[4];        
        
        for (int i = 0; i < 4; i++) {
            System.out.println("Tipo de coro: ");
            String tipo = scanner.next();
            if (tipo.equalsIgnoreCase("Semicircular")) {
                coros[i] = StaticChorusFactory.crearCoroSemicircular();                           
            } else {
                coros[i] = StaticChorusFactory.crearCoroOrquestal();
            }
            System.out.println("Nombre del coro: "); 
            coros[i].setNombre(scanner.next());
        }
        
        
        for (Coro c : coros) {
            System.out.print(c);
            System.out.println("Esta bien formado = " + c.estaBienFormado() + "\n");
        }
    }

}
