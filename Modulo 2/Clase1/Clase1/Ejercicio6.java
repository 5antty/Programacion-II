
/**
 * Write a description of class Ejercicio6 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class Ejercicio6{
public static void main(){
     Scanner in= new Scanner(System.in);
     int[][]matriz;
     matriz=new int[10][10];
     int i=0;
     for(int f=0;f<10;f++){
         for(int c=0;c<10;c++){
             matriz[f][c]=i;
             i=i+2;
             
         }
    }
    for(int f=0;f<10;f++){
         for(int c=0;c<10;c++){
             System.out.print(matriz[f][c]+" ");
         }
         System.out.println();
    }
    int suma=0;
    for(int f=1;f<=8;f++){
         for(int c=0;c<3;c++){
             suma=suma+matriz[f][c];
         }
    }
    System.out.println(suma);
    int[]vector;
    vector= new int[10];
    for(int f=0;f<10;f++){
         suma=0;
         for(int c=0;c<10;c++){
             suma=suma+matriz[c][f];
         }
         vector[f]=suma;
    }
    for (int j=0; j<10;j++)
        System.out.println("La suma de la columna "+(j+1)+" es "+vector[j]);
    System.out.println("Ingrese un valor entero: ");
    int e= in.nextInt();
    boolean con= false;
    for(int f=0;f<10;f++){
         for(int c=0;c<10;c++){
             if(matriz[f][c]==e){
             con=true;
             System.out.println("La fila es "+(f+1)+" y la columna es "+(c+1));
         }
    }
    }
    if(con!=true)
        System.out.println("No se encontro el elemento");
}
}
