import java.util.Scanner;
/**
 * Write a description of class ProgramaRASE here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

public class ProgramaRASE
{
    public static void main(String[]args){
        Solicitud[] vector= new Solicitud[5];
        for(int i=0; i<5; i++){
            LeerSolicitud(vector[i]);
        }
    }
    public static void LeerPersona(Scanner in, Persona p){
        System.out.println("Ingrese nombre");
        String nom =in.next();
        System.out.println("Ingrese apellido");
        String ap=in.next();
        System.out.println("Ingrese CUIT");
        int cuit=in.nextInt();
        p=new Persona(nom, ap, cuit);
    }
    public static void LeerGasNatural(Scanner in, Solicitud s, String numg, String fecha, double ing, int integ, String reg, Persona p){
        System.out.println("Ingrese numero de medidor");
        int med=in.nextInt();
        System.out.println("Ingrese tamaño");
        double tam=in.nextDouble();
        System.out.println("Ingrese la cantidad de calefactores/estufas");
        int c=in.nextInt();
        s=new GasNatural(numg, fecha, ing, integ, reg, p, med, tam, c);
    }
    public static void LeerEnergiaElectrica(Scanner in, Solicitud s, String numg, String fecha, double ing, int integ, String reg, Persona p){
        System.out.println("Ingrese NIS");
        int nis=in.nextInt();
        System.out.println("Ingrese cantidad de electrodomesticos");
        int e=in.nextInt();
        s=new EnergiaElectrica(numg, fecha, ing, integ, reg, p, nis, e);
    }
    public static void LeerSolicitud(Solicitud s){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese numero de gestion");
        String numg = in.next();
        System.out.println("Ingrese fecha");
        String fecha=in.next();
        System.out.println("Ingrese ingresos");
        double ing=in.nextDouble();
        System.out.println("Ingrese integrantes");
        int integ=in.nextInt();
        System.out.println("Ingrese la region");
        String reg=in.next();
        Persona p=new Persona();
        LeerPersona(in, p);
        System.out.println("Ingrese el tipo de solicitud a ingresar gas natural o energia electrica (g/e)");
        String op = in.next();
        switch(op){
            case "g": LeerGasNatural(in, s, numg, fecha, ing, integ,reg, p);
            case "e": LeerEnergiaElectrica(in, s, numg, fecha, ing, integ,reg, p);
        }
        in.close();
    }
    
}
