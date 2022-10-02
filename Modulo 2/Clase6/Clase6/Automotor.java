
public class Automotor extends Vehiculo{
    private int patente;
    private double importeA;
    private String descripcion;
 public Automotor(int patente, double importeA,String descripcion){
    this.patente=patente;
    this.importeA=importeA;
    this.descripcion=descripcion;
 }
 public int getPatente(){
    return patente;
 }
 public double getImporteA(){
    return importeA;
 }
 public String getDescripcion(){
    return descripcion;
 }
 public void setPatente(int patente){
     this.patente=patente;
 }
 public void setImporte(double importeA){
     this.importeA=importeA;
 }
 public void setDescripcion(String descripcion){
     this.descripcion=descripcion;
 }
 @Override
 public double calcularCostoImpuestos(){
     double monto=getImporte()+importeA;
     return monto;
 }
}
