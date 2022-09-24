import java.util.Scanner;
public class mainPersona2
{
    public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el nombre del entrenador");
        String nom = in.next();
        System.out.println("Ingrese los campeonatos del entrenador");
        int camp = in.nextInt();
        System.out.println("Ingrese sueldo base del entrenador");
        double sb = in.nextDouble();
        Persona2 entrenador = new Persona2(nom, sb, camp);
        System.out.println("El sueldo a cobrar del entrenador es "+entrenador.calcularSueldo());
    }
}