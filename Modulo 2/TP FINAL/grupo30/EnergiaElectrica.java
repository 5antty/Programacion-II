public class EnergiaElectrica extends Solicitud
{
    private int NIS;
    private int e;
    private TarifasNacionalesPorRegion t;
    public EnergiaElectrica(String numg, String fecha, double ingresos, int integrantes, String region, Persona persona, int NIS, int e){
        super(numg, fecha, ingresos, integrantes, region, persona);
        this.setNIS(NIS);
        this.setE(e);
    }
    public void setNIS(int NIS){
        this.NIS=NIS;
    }
    public void setE(int e){
        this.e=e;
    }
    public int getNIS(){
        return NIS;
    }
    public int getE(){
        return e;
    }
    @Override
    public boolean subsidio (){
        boolean aux=false;
        boolean aux2=(super.getIngresos()/super.getIntegrantes())<(45*super.getIngresos()/100);
        if((t.puedeAccederAlSubsidio(super.getIngresos(), super.getRegion()))&&(aux2))
            aux=true;
        return aux;
    }
    @Override
    public double calcularGasto(){
        double aux=0;
        if(super.getIngresos()>300000){
            aux=500*e;
        }
        else if((super.getIngresos()>150000)&&(super.getIngresos()<300000)){
            aux=(100*(e/2))+((2*super.getIngresos())/100);
        }
        else if(super.getIngresos()<150000){
            aux=((1.5*super.getIngresos())/100)+(400*super.getIntegrantes());
        }
        return aux;
    }
}
