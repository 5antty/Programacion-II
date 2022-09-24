import java.util.Scanner;
public class mainBalanzas
{
    public static void main(String[]args){
        Scanner in=new Scanner(System.in);
        double peso;
        Balanzas b1 = new Balanzas();
        b1.iniciarCompra();
        do{
            System.out.println("El monto actual de la compra es "+b1.devolverMontoAPagar());
            System.out.println("Ingrese la cantidad de items");
            int items = in.nextInt();
            System.out.println("Ingrese el peso del producto");
            peso = in.nextDouble();
            System.out.println("Ingrese el precio por Kg del producto");
            double precioKg = in.nextDouble();
            b1.setItems(items);
            b1.registrarProducto(peso, precioKg);
        }while(peso!=0);
        /*System.out.println("Ingrese la cantidad de items");
        int items = in.nextInt();
        System.out.println("Ingrese el peso del producto");
        double peso = in.nextDouble();
        System.out.println("Ingrese el precio por Kg del producto");
        double precioKg = in.nextDouble();
        Balanzas b1 = new Balanzas();
        b1.iniciarCompra();
        while(peso!=0){
            b1.setItems(items);
            b1.registrarProducto(peso, precioKg);
            System.out.println("El monto actual de la compra es "+b1.devolverMontoAPagar());
            System.out.println("Ingrese la cantidad de items");
            items = in.nextInt();
            System.out.println("Ingrese el peso del producto");
            peso = in.nextDouble();
            System.out.println("Ingrese el precio por Kg del producto");
            precioKg = in.nextDouble();
        }*/
        System.out.println(b1.devolverResumenDeCompra());
    }
}
