import java.lang.Math;
public class Triangulo
{
    private double[] lados=new double[3];
    private String relleno;
    private String linea;
    public Triangulo(double unlado1,double unlado2,double unlado3,String unrelleno,String unalinea){
         lados[0]= unlado1;
         lados[1]= unlado2;
         lados[2]= unlado3;
         relleno= unrelleno;
         linea= unalinea;
    }
    
    public double getLado1(){
        return lados[0];
    }
    
    public double getLado2(){
        return lados[1];
    }
    
    public double getLado3(){
        return lados[2];
    }
    
    public String getRelleno(){
        return relleno;
    }
    
    public String getLinea(){
        return linea;
    }
    
    public void setLado1(double unlado1){
        lados[0]= unlado1;
    }
    
    public void setLado2(double unlado2){
        lados[1]= unlado2;
    }
    
    public void setLado3(double unlado3){
        lados[2]= unlado3;
    }
    
    public void setRelleno(String unrelleno){
        relleno= unrelleno;
    }
    
    public void setLinea(String unalinea){
        linea= unalinea;
    }
    
    public double Perimetro(){
        double perimetro= lados[0]+lados[1]+lados[2];
        return perimetro;
    }
    
    public double Area(){
        double s=(lados[0]+lados[1]+lados[2])/2;
        double area= Math.sqrt(s * (s - lados[0]) *(s-lados[1])  *(s-lados[2]))  ;
        return area;
    }
}
