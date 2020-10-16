package Figura;
import PaqueteLectura.Lector;
public class Ejercicio2 {
    public static void main(String[] args) {
        System.out.println("Color de relleno, de linea y 3 lados: ");
        Triangulo triangulo = new Triangulo(Lector.leerString(), Lector.leerString(), Lector.leerDouble(), Lector.leerDouble(), Lector.leerDouble());
        System.out.println("Color de lado, de relleno y de linea: ");
        Cuadrado cuadrado = new Cuadrado(Lector.leerDouble(), Lector.leerString(), Lector.leerString());

        System.out.println("Area y perimetro del triangulo. Area: " + triangulo.calcularArea() + " Perimetro: " + triangulo.calcularPerimetro());
        System.out.println("Area y perimetro del Cuadrado. Area: " + cuadrado.calcularArea() + " Perimetro: " + cuadrado.calcularPerimetro());
    }
}
