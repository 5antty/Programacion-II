import java.util.Scanner;
public  class main{
    public static void main(){
    Scanner in=new Scanner(System.in);
    jugador j=new jugador("jose",498,26,600,20,28);
    entrenador en=new entrenador("mario",567,32,500,16);
    System.out.println(j.toString());
    System.out.println(en.toString());
    in.close();
 }
    
}
