
/**
 * Write a description of class Ejercicio3 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class Ejercicio3
{
    public static void main(){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese numero");
        int num = in.nextInt(); int aux=num;
        for (int i=1; i<num; i++){
            aux=i*aux;
        }
        System.out.println("El factorial del numero " + aux);
    }
}