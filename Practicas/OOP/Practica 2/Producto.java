public class Producto {
    private double peso;
    private double precio;
    private String descripcion;

    public Producto(double peso, double precio, String descripcion){
        this.peso = peso;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public Producto(){

    };

    public double getPeso(){
        return peso;
    }

    public double getPrecio(){
        return precio;
    }

    public String getDescripcion(){
        return descripcion;
    }

    public void setPeso(double peso){
        this.peso = peso;
    }

    public void setPrecio(double precio){
        this.precio = precio;
    }

    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
}
