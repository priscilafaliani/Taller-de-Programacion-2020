package EjercicioMicro;
import PaqueteLectura.Lector;

public class Ejercicio4 {
    public static void main(String[] args) {
        Micro micro = new Micro("ABC123", "Mar del Plata", "5:00");

        System.out.print("Número de asiento: ");
        int asiento = Lector.leerInt();
        while(asiento != -1 && !micro.estaLleno()){
            if(micro.esAsientoValido(asiento) && !micro.estaOcupado(asiento)){
                System.out.println("¡El asiento está libre! Buen viaje :)");
                micro.ocuparAsiento(asiento);
            } else {
                System.out.println("¡Ese asiento está ocupado o es inválido!");
                System.out.println("El asiento número __" + micro.primerAsientoLibre() + "__ está libre");
            }
            System.out.print("Número de asiento: ");
            asiento = Lector.leerInt();
        }

        System.out.println("Cantidad de asientos ocupados del micro: " + micro.getAsientosOcupados());
    }
}
