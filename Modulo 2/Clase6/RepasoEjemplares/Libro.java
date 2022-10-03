public class Libro extends Ejemplar
{
    private String titulo;
    private int capitulos;
    private boolean bols;
    public Libro(String cod, int p, String res, int ap, Responsable resp, String titulo, int cap, boolean bols){
        super(cod, p, res, ap, resp);
        this.setTitulo(titulo);
        this.setCapitulos(cap);
        this.setBols(bols);
    }
    public void setTitulo(String titulo){
        this.titulo=titulo;
    }
    public void setCapitulos(int capitulos){
        this.capitulos=capitulos;
    }
    public void setBols(boolean bols){
        this.bols=bols;
    }
    public String getTitulo(){
        return titulo;
    }
    public int getCapitulos(){
        return capitulos;
    }
    public boolean getBols(){
        return bols;
    }
    public void publicar(){
        if(bols)
            this.setTitulo(this.getTitulo()+" -De Bolsillo");
        super.publicar();
    }
    @Override
    public String mostrarDatos(){
        String aux="Codigo identificatorio: "+super.getCod()+"\nTitulo: "+titulo+"\nNombre del responsable: "+super.getResponsable().getNombre();
        return aux;
    }
}