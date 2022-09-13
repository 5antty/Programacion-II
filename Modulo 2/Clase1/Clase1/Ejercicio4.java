public class Ejercicio4 {
    public static void main() {
        for (int i = 1; i <= 9; i++) {
            if (i % 2 != 0) {
                int aux = i;
                for (int j = 1; j < i; j++) {
                    aux = j * aux;
                }
                System.out.println("El factorial del numero " + i + " es " + aux);
            }
        }
    }
}
