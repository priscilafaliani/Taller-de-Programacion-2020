package EjercicioBalanza;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio2 {
    public static void main(String[] args) {
        BalanzaComercial balanza = new BalanzaComercial();
        balanza.iniciarCompra();

        Producto producto = new Producto(Lector.leerDouble(), GeneradorAleatorio.generarDouble(20), Lector.leerString());
        while(producto.getPeso() != 0){
            balanza.registrarProducto(producto);
            System.out.println("Añadido! Monto total actual: " + balanza.devolverMontoAPagar());
            producto = new Producto(Lector.leerDouble(), GeneradorAleatorio.generarDouble(20), Lector.leerString());
        }

        System.out.println(balanza.devolverResumenDeCompra());
    }
}
