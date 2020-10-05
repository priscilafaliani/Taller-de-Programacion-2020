import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio3 {   
    
    public static void main(String[] args) {
        
        final int cantJugadores = 15;      
        
        int[] alturas = new int[cantJugadores];
        double promedio = 0;
        
        GeneradorAleatorio.iniciar();
        for(int i = 0; i < cantJugadores; i++){
            alturas[i] = GeneradorAleatorio.generarInt(200);
            promedio += alturas[i];
        }
        
        promedio = promedio / cantJugadores;
        int supera = 0;
        
        for(int i = 0; i < cantJugadores; i++){
            if(alturas[i] > promedio){
                supera++;
            }
        }
        
        System.out.println("Altura promedio: " + promedio);
        System.out.println("Cantidad que superan el promedio: " + supera);
        
    }
    
}
