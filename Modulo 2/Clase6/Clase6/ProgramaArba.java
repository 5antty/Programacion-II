import java.util.Scanner;
public class ProgramaArba
{
    final static int cantv=1;
    public static void LeerPropietario(Propietario p){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el nombre del propietario");
        String nom = in.next();
        System.out.println("Ingrese el apellido del propietario");
        String ap = in.next();
        System.out.println("Ingrese el CIT del propietario");
        int cit = in.nextInt(); 
        in.close();
        p =new Propietario(nom, ap, cit);
    }
    public static void LeerVehiculo(Vehiculo v){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese propietario");
        Propietario prop = new Propietario();
        LeerPropietario(prop);
        v.setPropietario(prop);
        System.out.println("Ingrese año");
        int a=in.nextInt();
        v.setAño(a);
        System.out.println("Ingrese importe");
        int i=in.nextInt();
        v.setImporte(i);
        System.out.println("Ingrese el tipo de vehiculo (Auto/Embarcacion)");
        String op = in.next();
        if(op.equals("Auto")){
            System.out.println("Ingrese patente");
            int p=in.nextInt();
            System.out.println("Ingrese importe adicional");
            double imp=in.nextDouble();
            System.out.println("Ingrese descripcion");
            String desc=in.next();
            v= new Automotor(p, imp, desc);
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
        in.close();
    }
    public static void main(String[]args){
        Vehiculo[] vector = new Vehiculo[cantv];
        for(int i=0;i<cantv;i++){
            LeerVehiculo(vector[i]);
        }
    }
}
