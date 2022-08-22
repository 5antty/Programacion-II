program ProgramaGenerarArbol;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;

procedure insertar(var a: arbol; nro: integer);
var
  aux: arbol;
begin
  if(a=nil) then begin
    new(aux);
    aux^.dato := nro;
    aux^.HI:= nil;
    aux^.HD:=nil;
    a:=aux;
  end
  else begin
    if(nro<a^.dato) then
      insertar(a^.HI, nro)
    else if(nro>a^.dato) then
      insertar(a^.HD, nro);
  end;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;

procedure preOrden(a:arbol);
begin
  if(a<>nil) then begin
    write(a^.dato, ' ');
    preOrden(a^.HI);
    preOrden(a^.HD);
  end;
end;

{function Buscar1 (a:arbol; num: integer; var encontre:boolean):arbol
begin
	if(a<>nil) then begin
		if(num=a^.dato) then Buscar1:=a
		else begin
			Buscar1()
		end;
	end;
end;}

function Buscar2 (a: arbol; num: integer): arbol; 
begin
  if (num=a^.dato) or (a = nil) then 
	Buscar2:= a
  else 
    if (num>a^.dato) then  
      Buscar2:= Buscar2(a^.HD,num)
    else 
      Buscar2:= Buscar2(a^.HI,num); 
end;

function verMin(a:arbol):integer;
begin
	if(a=nil) then verMin:=-1
	else
		if(a^.HI=nil) then
			verMin:=a^.dato
		else
			verMin:=verMin(a^.HI);		
end;

function verMax(a:arbol):integer;
begin
	if(a=nil) then verMax:=-1
	else
		if(a^.HD=nil) then
			verMax:=a^.dato
		else
			verMax:=verMax(a^.HD);	 	
end;
Var

 l: lista;
 a:arbol;
 num:integer;

begin
 Randomize;
 a:=nil;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 while(l<>nil) do begin
   insertar(a, l^.dato);
   l:=l^.sig;
 end;
 imprimirpornivel(a);
 preOrden(a);
 writeln;

 writeln('Ingrese un numero: '); readln(num);
 if (Buscar2(a, num)<>nil) then writeln('El numero ', num, ' si se encuentra')
 else writeln('El numero no se encuentra');

 if (verMin(a)<>-1) then writeln('El menor numero es: ', verMin(a))
 else writeln('El arbol esta vacio');
 if (verMax(a)<>-1) then writeln('El mayor numero es: ', verMax(a))
 else writeln('El arbol esta vacio');

end.
