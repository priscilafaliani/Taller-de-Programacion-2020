package Figura;
public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo(String colorRelleno, String colorLinea, double lado1, double lado2, double lado3){
        super(colorRelleno, colorLinea);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }

    // getters y setters
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    // general methods
    public double calcularArea(){
        double s = (getLado1() + getLado2() + getLado3()) / 2;
        return Math.sqrt(s * (s - getLado1()) * (s - getLado2()) * (s - getLado3()));
    }

    public double calcularPerimetro(){
        return getLado1() + getLado2() + getLado3();
    }

    public String toString() {
        return "Lado 1: " + getLado1() +  "cm. Lado 2: " + getLado2() + "cm. Lado 3: " + getLado3() + " cm. " + super.toString();
    }
}
