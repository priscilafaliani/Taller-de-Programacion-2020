import PaqueteLectura.Lector;

public class Ejercicio2 {
    public static void main(String[] args) {
        BalanzaComercial balanza = new BalanzaComercial();
        balanza.iniciarCompra();

        System.out.print("Peso del producto: ");
        double peso = Lector.leerDouble();
        System.out.print("Precio del producto: ");
        double precio = Lector.leerDouble();

        while(peso != 0){
            balanza.registrarProducto(precio, peso);
            System.out.println("Añadido! Monto total actual: " + balanza.devolverMontoAPagar());
            System.out.print("Siguiente producto... Peso: ");
            peso = Lector.leerDouble();
            System.out.print("Precio: ");
            precio = Lector.leerDouble();
        }

        System.out.println(balanza.devolverResumenDeCompra());
    }
}
