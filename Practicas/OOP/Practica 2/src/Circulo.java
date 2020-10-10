public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    // constructors
    public Circulo(double radio, String colorRelleno, String colorLinea){
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public Circulo(){
        
    }

    // getters
    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    // setters
    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    // general methods
    public double calcularArea(){
        return Math.PI * radio * radio;
    }

    public double calcularPerimetro(){
        return 2 * Math.PI * radio;
    }
}
