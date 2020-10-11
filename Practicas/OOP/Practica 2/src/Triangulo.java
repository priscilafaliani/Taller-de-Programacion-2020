public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;

    // constructor    
    public Triangulo(double lado1, double lado2, double lado3){
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea){
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    public Triangulo(){
        
    }

    // getters
    public double getLado1(){
        return lado1;
    }
    
    public double getLado2(){
        return lado2;
    }
    
    public double getLado3(){
        return lado3;
    }

    public String getColorRelleno(){
        return colorRelleno;
    }

    public String getColorLinea(){
        return colorLinea;
    }

    // setters
    public void setLado1(double lado1){
        this.lado1 = lado1;
    }
    
    public void setLado2(double lado2){
        this.lado2 = lado2;
    }
    
    public void setLado3(double lado3){
        this.lado3 = lado3;
    }

    public void setColorRelleno(String colorRelleno){
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea){
        this.colorLinea = colorLinea;
    }

    // printing
    public String toString(){
        return "Este triangulo tiene color de relleno " + colorRelleno + " y color de linea " + colorLinea +
        ". Su lado uno mide " + lado1 + "cm, su lado dos " + lado2 + "cm y su lado tres " + lado3 + "cm.";
    }

    // general methods
    // HACE FALTA CHEQUEAR SI LOS LADOS INGRESADOS FORMAN UN TRIANGULO PARA QUE ESTA FORMULA FUNCIONE!!111
    public double calcularArea(){
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }

    public double calcularPerimetro(){
        return lado1 + lado2 + lado3;
    }
}
