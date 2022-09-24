public class Flotas
{
    final int cantMicros=15;
    private int diml;
    private Micros[] flota= new Micros[cantMicros];
    
    public Flotas(){
        diml=0;
        for(int i=0; i<cantMicros; i++){
            flota[i]=null;
        }
    }
    public boolean FlotaCompleta(){
        boolean aux=true;
        int i=0;
        while((i<cantMicros)&&(aux)){
            if(flota[i]==null)
                aux=false;
            i++;
        }
        return aux;
    }
    public void setMicro(Micros unMicro){
        for(int i=0; i<diml; i++){
            if (flota[i]==null){
                flota[i]=unMicro;
                break;
            }
        }
    }
    public void AumentarDiml(){
        if(diml<cantMicros)
            diml++;
    }
    public void eliminarMicro(String p){
        for (int i=0; i<diml; i++){
            if(flota[i].getPatente().equals(p)){
                flota[i]=null;
                diml--;
            }
        }
    }
    public Micros buscarPatente(String p){
        Micros aux=null;
        for(int i=0; i<diml; i++){
            if(flota[i]!=null){
                if(flota[i].getPatente().equals(p))
                    aux=flota[i];
            }
        }
        return aux;
    }
    public Micros buscarDestino(String d){
        Micros aux=null;
        for(int i=0; i<diml; i++){
            if(flota[i]!=null){
                if(flota[i].getDestino().equals(d))
                    aux=flota[i];
            }
        }
        return aux;
    }
}
