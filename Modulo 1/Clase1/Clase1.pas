
Program Clase1;

Uses sysutils;

Type 
  texto = string[40];
  producto = Record
    codigo: integer;
    marca: texto;
    nombre: texto;
    anio: integer;
    precio: real;
  End;
  lista = ^nodo;
  nodo = Record
    dato: producto;
    sig: lista;
  End;

Procedure agregarAdelante(Var l: lista; p: producto);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Procedure crearLista(Var l: lista);

Var 
  i,j: integer;
  p: producto;

  v : array [1..10] Of string;
Begin
  v[1] := 'Abercom';
  v[2] := 'Aluminium';
  v[3] := 'ClearWindows';
  v[4] := 'IndArg';
  v[5] := 'La Foret';
  v[6] := 'Open';
  v[7] := 'Portal';
  v[8] := 'Puertamania';
  v[9] := 'PVCPremium';
  v[10] := 'Ventalum';

  For i:=random(10) Downto 1 Do {for de marca}
    Begin
      p.marca := v[i];
      For j:=random(5) Downto 1 Do {for de anio}
        Begin
          p.anio := 2016+j;
          p.codigo := random(10);
          While (p.codigo <> 0) Do
            Begin
              p.nombre := Concat('Producto-', IntToStr(random (200)));
              p.precio := random(1000000);
              agregarAdelante(l, p);
              p.codigo := random(10);
            End;
        End;
    End;
End;


{procedure informar(l:lista);
var i:integer;
begin
     i:=1;
     while(l<>nil)and(l^.dato.marca<'Abercom') do begin
        l:=l^.sig;
     end;
     while(l<>nil)and(l^.dato.marca='Abercom') do begin
        writeln('sda');
        if(l^.dato.anio>=2018)and(l^.dato.anio<=2020)and(l^.dato.precio>100000)then begin
           i:=i+1;
        end;
     end;
     writeln('La cantidad de productos es ',i);
     readln();
end;         }

Procedure informar(Var i:integer; p:producto);
Begin
  If (p.marca='Abercom')And(p.anio>=2018)And(p.anio<=2020)And(p.precio>100000)
    Then
    Begin
      i := i+1;
    End;
End;

{imprimir - Muestra en pantalla el producto}
Procedure imprimir(p: producto);
Begin
  With (p) Do
    Begin
      writeln(codigo,' ', nombre, ' ', precio:2:2, '$');
    End;
End;

Procedure reporte(l:lista);

Var aux1: texto;
  aux2, prodMarca, prodAnio: integer;
Begin
  While (l<>Nil) Do
    Begin
      aux1 := l^.dato.marca;
      writeln('Marca: ', l^.dato.marca);
      prodMarca := 0;
      While (l<>Nil)And(l^.dato.marca=aux1) Do
        Begin
          prodAnio := 0;
          aux2 := l^.dato.anio;
          writeln('Anio: ', l^.dato.anio);
          While (l<>Nil)And(l^.dato.marca=aux1)And(l^.dato.anio=aux2) Do
            Begin
              imprimir(l^.dato);
              prodAnio := prodAnio+1;
              l := l^.sig;
            End;
          writeln('El total de productos del anio ', aux2, ' es de ', prodAnio);
          prodMarca := prodMarca+prodAnio;
        End;
      writeln('El total de productos marca ', aux1, ' es de ', prodMarca);
    End;
End;

Var 
  l, aux: lista;
  i: integer;
Begin
  i := 0;
  l := Nil;
  crearLista(l);
  aux := l;
  While (aux<>Nil) Do
    Begin
      informar(i, aux^.dato);
      aux := aux^.sig;
    End;
  writeln('La cantidad de productos es ',i);
  {imprimirLista(l); }
  reporte(l);
  readln;
End.
