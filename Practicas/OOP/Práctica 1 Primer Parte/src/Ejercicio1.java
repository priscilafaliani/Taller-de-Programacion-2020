import PaqueteLectura.Lector;
public class Ejercicio1 {

    public static void main(String[] args) {
        int n = Lector.leerInt();
        long result = 1L;
        if(n < 0){
            System.out.println("Indefinido");
        }
        else if(n != 0){            
            for (int i = n; i > 0; i--)
                result = result * i;
            System.out.println(result);
        }        
    }
    
}
