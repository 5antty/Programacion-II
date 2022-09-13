import java.util.Scanner;

public class Ejercicio1 {
    public static void main() {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese primer lado");
        double l1 = in.nextDouble();
        System.out.println("Ingrese segundo lado");
        double l2 = in.nextDouble();
        System.out.println("Ingrese tercer lado");
        double l3 = in.nextDouble();
        if ((l1 < l2 + l3) && (l2 < l1 + l3) && (l3 < l1 + l2)) {
            double p = l1 + l2 + l3;
            System.out.println("El perimetro del trinagulo es " + p);
        }
        in.close();
    }
}
