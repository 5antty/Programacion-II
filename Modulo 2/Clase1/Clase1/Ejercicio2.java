import java.util.Scanner;

public class Ejercicio2 {
    public static void main() {
        Scanner in = new Scanner(System.in);
        double total = 0;
        double ing = 0;
        System.out.println("Ingrese patente");
        int p = in.nextInt();
        while (p != 0) {
            total++;
            if (p % 2 == 0) {
                System.out.println("El auto tiene permitido el paso");
                ing++;
            } else
                System.out.println("El auto tiene no permitido el paso");
            System.out.println("Ingrese siguiente patente");
            p = in.nextInt();
        }
        System.out.println("El porcentaje de autos que pasaron es " + (ing / total) * 100);
        in.close();
    }
}
