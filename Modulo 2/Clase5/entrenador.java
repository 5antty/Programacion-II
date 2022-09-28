 public class entrenador extends empleado{
    private int campeonatos;
 
 public entrenador(String nombre,int dni,int edad,double sueldo,int campeonatos){
     super(nombre,dni,edad,sueldo);
     this.setCampeonatos(campeonatos);
 }    
 public int getCampeonatos(){
    return campeonatos;
 }
 public void setCampeonatos(int campeonatos){
     this.campeonatos=campeonatos;
 }
 @Override
 public double calcularSueldoACobrar(){
     double sueldoFinal=getSueldo();
     if ((campeonatos>=1)&&(campeonatos<=4))
       sueldoFinal=sueldoFinal+5000;
     else if((campeonatos>=5)&&(campeonatos<=10))
       sueldoFinal=sueldoFinal+30000;
     else if(campeonatos>10)
       sueldoFinal=sueldoFinal+50000;
     return sueldoFinal;
 }
 public String toString(){
     return (super.toString()+calcularSueldoACobrar());
 }
}