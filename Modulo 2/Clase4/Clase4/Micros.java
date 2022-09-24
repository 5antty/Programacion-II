public class Micros
{
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean[] asientos = new boolean[20];
    private int ocupados;
    
    public Micros(String patente, String destino, String horaSalida){
        this.patente=patente;
        this.destino=destino;
        this.horaSalida=horaSalida;
        for (int i=0; i<20; i++){
            asientos[i]=false;
        }
        ocupados=0;
    }
    
    public void setPatente(String p){
        patente=p;
    }
    public void setDestino(String d){
        destino=d;
    }
    public void setHoraSalida(String hs){
        horaSalida=hs;
    }
    public String getPatente(){
        return patente;
    }
    public String getDestino(){
        return destino;
    }
    public String getHoraSalida(){
        return horaSalida;
    }
    
    public int Ocupados(){
        return ocupados;
    }
    public boolean MicroLleno(){
        boolean aux=false;
        if (ocupados==20){
            aux=true;
        }
        return aux;
    }
    public boolean validarAsiento(int unAsiento){
        boolean aux=true;
        if(unAsiento<0){
            aux=false;
        }
        else if(unAsiento>20){
            aux=false;
        }
        return aux;
    }
    public boolean estadoAsiento(int unAsiento){
        return asientos[unAsiento];
    }
    public void OcuparAsiento(int unAsiento){
        asientos[unAsiento]=true;
        ocupados++;
    }
    public void LiberarAsiento(int unAsiento){
        asientos[unAsiento]=false;
        ocupados--;
    }
    public int primerLibre(){
        int i=0;
        int aux=0;
        boolean encontre=false;
        while((i<20)&&(!encontre)){
            if(asientos[i]==false){
                aux=i;
                encontre=true;
            }    
            i++;
        }
        return aux;
    }
}
