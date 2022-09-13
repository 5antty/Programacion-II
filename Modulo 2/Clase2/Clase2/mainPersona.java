import java.util.Scanner;

public class mainPersona {
    final static int personas = 5;

    public static int mayores(Persona[] vector) {
        int cant = 0;
        for (int i = 0; i < personas; i++)
            if (vector[i].getEdad() > 65)
                cant++;
        return cant;
    }

    public static void menorDNI(Persona[] vector) {
        Persona aux = null;
        int min = 9999;
        for (int i = 0; i < personas; i++) {
            if (vector[i].getDNI() < min) {
                min = vector[i].getDNI();
                aux = vector[i];
            }
        }
        System.out.println(aux.toString());
    }

    public static void main(String[] args) {
        Persona[] vector = new Persona[personas];
        for (int i = 0; i < personas; i++) {
            Scanner in = new Scanner(System.in);
            System.out.println("Ingrese nombre");
            String nom = in.next();
            System.out.println("Ingrese dni");
            int dni = in.nextInt();
            System.out.println("Ingrese edad");
            int edad = in.nextInt();
            vector[i] = new Persona(nom, dni, edad);
            in.close();
        }
        System.out.println("La cantidad de personas mayores de 65 es " + mayores(vector));
        menorDNI(vector);
    }
}
