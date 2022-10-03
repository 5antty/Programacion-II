import java.util.Scanner;
public class ProgramaEditorial
{
    final static int cant=2;
    public static void LeerResponsable(Responsable r){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese DNI");
        int dni = in.nextInt();
        System.out.println("Ingrese el nombre del responsable");
        String nom = in.next();
        System.out.println("Ingrese el apellido del responsable");
        String ap = in.next();
        in.close();
    }
    public static void LeerDatos(String cod, int pag, String res, int ap, Responsable r){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el Codigo de identificacion");
        cod = in.next();
        System.out.println("Ingrese la cantidad de paginas");
        pag = in.nextInt();
        System.out.println("Ingrese el resumen");
        res = in.nextLine();
        System.out.println("Ingrese anio de publicacion");
        ap=in.nextInt();
        LeerResponsable(r);
        in.close();
    }
    public static void LeerLibro(Ejemplar e){
        Scanner in = new Scanner(System.in);
        String cod="", res="";
        int pag=0, ap=0;
        Responsable resp=new Responsable();
        LeerDatos(cod, pag, res, ap, resp);
        System.out.println("Ingrese el titulo");
        String tit = in.next();
        System.out.println("Ingrese cantidad capitulos");
        int cap = in.nextInt();
        System.out.println("Ingrese si es edicion de bolsillo o no (si/no)");
        String b = in.next();
        boolean bols=false;
        if(b.equals("si"))
            bols=true;
        e=new Libro(cod, pag, res, ap, resp, tit, cap, bols);
        in.close();
    }
    public static void LeerRevista(Ejemplar e){
        Scanner in = new Scanner(System.in);
        String cod="", res="";
        int pag=0, ap=0;
        Responsable resp=new Responsable();
        LeerDatos(cod, pag, res, ap, resp);
        System.out.println("Ingrese nombre");
        String nom = in.next();
        System.out.println("Ingrese la cantidad de articulos");
        int art = in.nextInt();
        e=new Revista(cod, pag, res, ap, resp, nom, art);
        in.close();
    }
    public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        Ejemplar[] vector= new  Ejemplar[cant];
        for (int i=0; i<cant;i++){
            System.out.println("Ingrese 'r' para ingresar una revista o 'l' para ingresar un libro");
            String op= in.next();
            if(op.equals("l")){
                LeerLibro(vector[i]);
                System.out.println("Desea publicar el libro? (si/no)");
                if(op.equals("si"))
                    vector[i].publicar();
            }else if(op.equals("r")){
                LeerRevista(vector[i]);
                System.out.println("Desea publicar la revista? (si/no)");
                op=in.next();
                if(op.equals("si"))
                    vector[i].publicar();
            }else
                System.out.println("Error ingrese 'r' o 'l'");
        }
        for(int i=0; i<cant;i++){
            System.out.println(vector[i].mostrarDatos());
        }
    }
}