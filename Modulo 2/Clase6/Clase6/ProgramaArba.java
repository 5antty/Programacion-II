import java.util.Scanner;
public class ProgramaArba
{
    final int cantv=1;
    public static void LeerVehiculo(Vehiculo v){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el tipo de vehiculo (Auto/Embarcacion)");
        String op = in.next();
        if(op.equals("Auto")){
            
        }
        else if(op.equals("Embarcacion")){
            System.out.println("Ingrese REY");
            String rey=in.next();
            System.out.println("Ingrese nombre");
            String nom=in.next();
            System.out.println("Ingrese tipo de embarcacion");
            String tipo=in.next();
            System.out.println("Ingrese eslora");
            double e=in.nextDouble();
            System.out.println("Ingrese tonelaje");
            double ton=in.nextDouble();
            System.out.println("Ingrese valor");
            double valor=in.nextDouble();
            v= new Embarcaciones(rey, nom, tipo, e, ton, valor);
        }
    }
    public static void main(String[]args){
        
    }
}
