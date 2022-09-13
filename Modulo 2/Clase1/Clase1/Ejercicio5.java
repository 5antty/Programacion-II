
/**
 * Write a description of class Ejercicio5 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Ejercicio5 {
    public static void main() {
        Scanner in = new Scanner(System.in);
        double[] vector;
        vector = new double[5];
        double suma = 0;
        for (int i = 0; i < 5; i++) {
            System.out.println("Ingrese una altura: ");
            vector[i] = in.nextDouble();
            suma = suma + vector[i];
        }
        double p = suma / 5;
        System.out.println("Promedio: " + p);
        int cant = 0;
        for (int i = 0; i < 5; i++) {
            if (vector[i] > p)
                cant++;
        }
        System.out.println("Cantidad de Jugadores que superan el promedio: " + cant);
        in.close();
    }
}
