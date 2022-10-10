public class Persona
{
    private String nombre;
    private String apellido;
    private int CUIT;
    public Persona(){
        
    }
    public Persona(String nombre, String apellido, int CUIT){
        this.setNombre(nombre);
        this.setApellido(apellido);
        this.setCUIT(CUIT);
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setApellido(String apellido){
        this.apellido=apellido;
    }
    public void setCUIT(int CUIT){
        this.CUIT=CUIT;
    }
    public String getNombre(){
        return nombre;
    }
    public String getApellido(){
        return apellido;
    }
    public int getCUIT(){
        return CUIT;
    }
}
