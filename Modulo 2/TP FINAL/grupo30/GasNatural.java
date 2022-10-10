public class GasNatural extends Solicitud
{
    private int medidor;
    private double tamaño;
    private int c;
    private TarifasNacionalesPorRegion t;
    public GasNatural(String numg, String fecha, double ingresos, int integrantes, String region, Persona persona, int medidor, double tamaño, int c){
        super(numg, fecha, ingresos, integrantes, region, persona);
        this.setMedidor(medidor);
        this.setTamaño(tamaño);
        this.setC(c);
    }
    public void setMedidor(int medidor){
        this.medidor=medidor;
    }
    public void setTamaño(double tamaño){
        this.tamaño=tamaño;
    }
    public void setC(int c){
        this.c=c;
    }
    public int getMedidor(){
        return medidor;
    }
    public double getTamaño(){
        return tamaño;
    }
    public int getC(){
        return c;
    }
    @Override
    public boolean subsidio (){
        boolean aux=false;
        boolean aux2=(super.getIngresos()/(super.getIntegrantes()+c))<(40*super.getIngresos()/100);
        if((t.puedeAccederAlSubsidio(super.getIngresos(), super.getRegion()))&&(aux2))
            aux=true;
        return aux;
    }
    @Override
    public double calcularGasto(){
        double aux=0;
        if(super.getIngresos()>300000){
            aux=250*(this.getTamaño()/2)+750*c;
        }
        else if((super.getIngresos()>150000)&&(super.getIngresos()<300000)){
            aux=100*(this.getTamaño()/3)+500*c;
        }
        else if(super.getIngresos()<150000){
            aux=((2*getIngresos())/100)+1000;
        }
        return aux;
    }
}
