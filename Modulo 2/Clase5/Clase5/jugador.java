
 public class jugador extends empleado{
    private int partidos;
    private int goles;
    
 public jugador(String nombre,int dni,int edad,double sueldo,int partidos,int goles){
     super(nombre,dni,edad,sueldo);
     this.setPartidos(partidos);
     this.setGoles(goles);
 }
 public int getPartidos(){
    return partidos;
 }
 public int getGoles(){
    return goles;
 }
 public void setPartidos(int partidos){
     this.partidos=partidos;
 }
 public void setGoles(int goles){
     this.goles=goles;
 }
 @Override
 public double calcularSueldoACobrar(){
     double sueldoFinal=getSueldo();
     if((goles/partidos)>0.5)
       sueldoFinal=sueldoFinal+getSueldo();
     return sueldoFinal;
 }
 public String toString(){
     return (super.toString()+calcularSueldoACobrar());
 }
}
