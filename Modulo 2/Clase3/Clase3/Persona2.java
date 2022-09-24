public class Persona2 {
    private String nombre;
    private double sueldo;
    private int campeonatos; 
    
    public Persona2(String unNombre, double unSueldo, int unCampeonato){
        nombre = unNombre;
        sueldo= unSueldo;
        campeonatos = unCampeonato; 
    }
    public double getSueldo() {
        return sueldo;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setSueldo(double unSueldo) {
        sueldo = unSueldo;
    }

    public void setEdad(int unCampeonato) {
        campeonatos = unCampeonato;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public double calcularSueldo(){
        double sueldoACobrar=sueldo;
        if((campeonatos>=1) && (campeonatos<=4)){
            sueldoACobrar+=5000;
        }
        else if((campeonatos>=5) && (campeonatos<=10)){
            sueldoACobrar+=30000;
        }
        else if (campeonatos>10){
            sueldoACobrar+=50000;
        } 
        return sueldoACobrar;
    }   
}