program VectorOrdenado;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

{procedure Busqueda(b, diml:dim; v:vector);
var pos:dim;
begin
    if(diml=0)then
      writeln('no se encontro el numero')
    else begin
      pos:=diml div 2;
      if(v[pos]=b) then writeln('se encontro el numero')
      else
        if(b<v[pos]) then begin
           Busqueda(b, pos, v)
        end
        else begin
           pos:=pos+diml;
           writeln(pos);
           Busqueda(b, pos,v);
        end;
    end;
end;}
function busqueda(v: vector; ini, fin, dato: integer): integer;  //Devuelve la posicion
var
   central: integer;
begin
    if (ini = fin) then begin
        if (dato = v[fin]) then
            busqueda:= fin
        else
          busqueda:= 0;
    end
    else begin
      central:= (ini + fin) div 2;
      if (dato = v[central]) then
          busqueda:= central
      else
        if (dato < v[central]) then
            busqueda:= busqueda(v,ini,central-1,dato)
        else
          if (dato > v[central]) then
            busqueda:= busqueda(v,central+1,fin,dato);
    end;
end;

function Maximo(diml:integer;v:vector):integer;
var max, pos:integer;
begin
    max:=-1;
    pos:=diml;

    if(pos>0)then begin
      if(v[pos]>max) then begin
        max:=v[pos];
      end;
      pos:=pos+1;
      writeln(max);
      if(Maximo(pos, v)>max) then
        max:=Maximo(diml, v);
    end;
    Maximo:=max;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   num:integer;
begin
     cargarVectorOrdenado(v,dimL);
     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('ingrese num'); readln(num);
     if(busqueda(v, 1, diml, num)=0) then
       writeln('No se encontro el numero en el vector')
     else
       writeln('El numero se encuentra en la posicion: ', busqueda(v, 1, diml, num));
     {writeln('El maximo numero es: ', Maximo(1, v));}
     readln;
end.
