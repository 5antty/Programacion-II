public class Revista extends Ejemplar
{
    private String nombre;
    private int volumen;
    private int articulos;
    private Generador g=new Generador();
    public Revista(String cod, int p, String res, int ap, Responsable resp, String nombre, int articulos){
        super(cod, p, res, ap, resp);
        this.setNombre(nombre);
        volumen=g.getNroVolumen();
        this.setArticulos(articulos);
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setVolumen(int volumen){
        this.volumen=volumen;
    }
    public void setArticulos(int articulos){
        this.articulos=articulos;
    }
    public String getNombre(){
        return nombre;
    }
    public int getVolumen(){
        return volumen;
    }
    public int getArticulos(){
        return articulos;
    }
    public void publicar(){
        volumen = g.getNroVolumen();
        super.publicar();
    }
    @Override
    public String mostrarDatos(){
        String aux="Nombre revista: "+nombre+"\nVolumen: "+volumen;
        return aux;
    }
}
