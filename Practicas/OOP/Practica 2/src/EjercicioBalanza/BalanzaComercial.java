package EjercicioBalanza;

public class BalanzaComercial {
    private double monto;
    private int items;
    private String resumen;

    public void iniciarCompra(){
        monto = 0;
        items = 0;
        resumen = "";
    }

    public void registrarProducto(Producto producto){
        items++;
        monto += producto.getPrecio() * producto.getPeso();
        resumen += producto.getDescripcion() +" - ";
    }

    public double devolverMontoAPagar(){
        return monto;
    }

    public String devolverResumenDeCompra(){
        return resumen + "Total a pagar " + monto + " por la compra de " + items + " productos.";
    }
}
