import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio6 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        final int cantOp = 5;
        int[] operaciones = new int[cantOp];

        int op = GeneradorAleatorio.generarInt(6);
        while(op != 5) {
            operaciones[op]++;
            op = GeneradorAleatorio.generarInt(6);
        }

        int max = 0;
        for(int i = 0; i < cantOp; i++) {
            if(operaciones[max] < operaciones[i]) {
                max = i;
            }
            System.out.println("Cantidad de personas atendidas en esta operacion: " + operaciones[i] + ".");
        }
        System.out.println("OperaciÃ³n mÃ¡s solicitada: " + max + ".");
    }

}
