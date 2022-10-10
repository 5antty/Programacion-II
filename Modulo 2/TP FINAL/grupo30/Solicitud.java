public abstract class Solicitud
{
    private String numg;
    private String fecha;
    private double ingresos;
    private int integrantes;
    private String region;
    private Persona persona;
    public Solicitud(String numg, String fecha, double ingresos, int integrantes, String region, Persona persona){
        this.setNumg(numg);
        this.setFecha(fecha);
        this.setIngresos(ingresos);
        this.setIntegrantes(integrantes);
        this.setRegion(region);
        this.setPersona(persona);
    }
    public void setNumg(String numg){
        this.numg=numg;
    }
    public void setFecha(String fecha){
        this.fecha=fecha;
    }
    public void setIngresos(double ingresos){
        this.ingresos=ingresos;
    }
    public void setIntegrantes(int integrantes){
        this.integrantes=integrantes;
    }
    public void setRegion(String region){
        this.region=region;
    }
    public void setPersona(Persona persona){
        this.persona=persona;
    }
    public String getNumg(){
        return numg;
    }
    public String getFecha(){
        return fecha;
    }
    public double getIngresos(){
        return ingresos;
    }
    public int getIntegrantes(){
        return integrantes;
    }
    public String getRegion(){
        return region;
    }
    public Persona getPersona(){
        return persona;
    }
    public abstract double calcularGasto();
    public abstract boolean subsidio(); 
}
