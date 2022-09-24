public class Balanzas
{
    private double precioTotal;
    private int items;
    public void iniciarCompra(){
        precioTotal=0;
        items=0;
    }
    public void setItems(int unItem){
        items+=unItem;
    }
    public void registrarProducto(double unPesoKg, double unPrecioPorKg){
        precioTotal=precioTotal+unPrecioPorKg*unPesoKg*items;
    }
    public double devolverMontoAPagar(){
        return precioTotal;
    }
    public String devolverResumenDeCompra(){
        String aux;
        aux="Total a pagar "+precioTotal+" por la compra de "+items+" productos";
        return aux;
    }
}
