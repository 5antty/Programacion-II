
 public abstract class empleado{
  private String nombre;
  private int dni;
  private int edad;
  private double sueldo;

 public empleado(String nombre,int dni,int edad,double sueldo){
     this.setNombre(nombre);
     this.setDni(dni);
     this.setEdad(edad);
     this.setSueldo(sueldo);
 }
 public String getNombre(){
    return nombre;
 }
 public int getDni(){
    return dni;
 }
 public int getEdad(){
    return edad;
 }
 public double getSueldo(){
    return sueldo;
 }
 public void setNombre(String nombre){
    this.nombre=nombre;
 }
  public void setDni(int dni){
    this.dni=dni;
 }
 public void setEdad(int edad){
    this.edad=edad;
  }
  public void setSueldo(double sueldo){
    this.sueldo=sueldo;
 }
 public abstract double calcularSueldoACobrar();
 @Override
  public String toString(){
     return("el empleado "+ nombre +" cobrará: ");
 }
 
}

