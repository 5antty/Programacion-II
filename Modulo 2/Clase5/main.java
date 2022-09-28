import java.util.Scanner;
public  class main{
    public static void main(){
    Scanner in=new Scanner(System.in);
    System.out.println("Ingrese nombre");
    String nom = in.next();
    System.out.println("Ingrese DNI");
    int dni = in.nextInt();
    System.out.println("Ingrese edad");
    int edad = in.nextInt();
    System.out.println("Ingrese sueldo");
    double sueldo = in.nextDouble();
    System.out.println("Ingrese partidos jugados");
    int p = in.nextInt();
    System.out.println("Ingrese goles");
    int g = in.nextInt();
    jugador j=new jugador(nom, dni, edad, sueldo, p, g);
    entrenador en=new entrenador("mario",567,32,500,16);
    System.out.println(j.toString());
    System.out.println(en.toString());
    in.close();
 }
    
}
