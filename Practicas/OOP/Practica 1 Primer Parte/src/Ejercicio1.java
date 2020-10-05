import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int n = GeneradorAleatorio.generarInt(10);
        long result = 1L;
        if(n != 0){            
            for (int i = n; i > 0; i--)
                result = result * i;            
        }
        System.out.println(result);     
    }
    
}
