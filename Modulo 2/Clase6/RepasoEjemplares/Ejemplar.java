public abstract class Ejemplar
{
    private String cod;
    private int pag;
    private String resumen;
    private int anioP;
    private Responsable resp;
    public Ejemplar(String cod, int pag, String resumen, int anioP, Responsable resp){
        this.setCod(cod);
        this.setPag(pag);
        this.setResumen(resumen);
        this.setAnioP(anioP);
        this.setResponsable(resp);
    }
    public void setCod(String cod){
        this.cod=cod;
    }
    public void setPag(int pag){
        this.pag=pag;
    }
    public void setResumen(String resumen){
        this.resumen=resumen;
    }
    public void setAnioP(int anioP){
        this.anioP=anioP;
    }
    public void setResponsable(Responsable resp){
        this.resp=resp;
    }
    public String getCod(){
        return cod;
    }
    public int getPag(){
        return pag;
    }
    public String getResumen(){
        return resumen;
    }
    public int getAnioP(){
        return anioP;
    }
    public Responsable getResponsable(){
        return resp;
    }
    public void publicar(){
        anioP=2022;
    }
    public abstract String mostrarDatos();
}