import java.lang.Math;
import java.util.Scanner;
public class mainTriangulo
{
 public static void main(String[]args){
     Scanner in=new Scanner(System.in);
     double[] vector = new double[3];
     for(int i=0;i<3;i++){
       System.out.println("Ingrese el lado "+(i+1));
       vector[i]= in.nextDouble();
     }
     System.out.println("Ingrese el color de relleno ");
     String relleno= in.next();
     System.out.println("Ingrese el color de linea ");
     String linea= in.next();
     in.close();
     Triangulo t1= new Triangulo(vector[0], vector[1], vector[2], relleno, linea);
     System.out.println("Perimetro: "+t1.Perimetro()+" area: "+t1.Area());
    }
 }