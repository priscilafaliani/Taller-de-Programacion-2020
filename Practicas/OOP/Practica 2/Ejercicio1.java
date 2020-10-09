import PaqueteLectura.Lector;

public class Ejercicio1 {
    public static void main(String[] args) {
        System.out.println("Ingrese el largo de los 3 lados: ");
        Triangulo triangulo = new Triangulo(Lector.leerDouble(), Lector.leerDouble(), Lector.leerDouble());
        System.out.print("Ingrese el color del relleno: ");
        triangulo.setColorRelleno(Lector.leerString());
        System.out.print("Ingrese el color de la linea: ");
        triangulo.setColorLinea(Lector.leerString());
        System.out.println(triangulo.toString());
        System.out.println("Tiene un perimetro de: " + triangulo.calcularPerimetro());
        System.out.println("Tiene un area de: " + triangulo.calcularArea());
    }
}
