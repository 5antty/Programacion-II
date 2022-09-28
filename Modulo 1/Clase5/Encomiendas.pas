
Program Encomiendas;

Type 
  encomienda = Record
    codigo: integer;
    peso: integer;
  End;
  listac = ^nodoc;
  nodoc = Record
    code: integer;
    sig: listac;
  End;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = Record
    dato: encomienda;
    sig: lista;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato: encomienda;
    codes: listac;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;

{AgregarAdelante - Agrega una encomienda adelante en l}
Procedure agregarAdelante(Var l: Lista; enc: encomienda);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l := aux;
End;

{CREARLISTA - Genera una lista con datos de las encomiendas }
Procedure crearLista(Var l: Lista);

Var 
  e: encomienda;
  i: integer;
Begin
  l := Nil;
  For i:= 1 To 20 Do
    Begin
      e.codigo := i;
      e.peso := random (10);
      While (e.peso = 0) Do
        e.peso := random (10);
      agregarAdelante(L, e);
    End;
End;

{IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
      l := l^.sig;
    End;
End;

{CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

Function ContarElementos (l: listaNivel): integer;

Var c: integer;
Begin
  c := 0;
  While (l <> Nil) Do
    Begin
      c := c+1;
      l := l^.sig;
    End;
  contarElementos := c;
End;

{AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue: listaNivel;

Begin
  new (nue);
  nue^.info := a;
  nue^.sig := Nil;
  If l= Nil Then l := nue
  Else ult^.sig := nue;
  ult := nue;
End;

Procedure imprimir(a:arbol);
Begin
  writeln('El peso ', a^.dato.peso, ' tiene los siguientes codigos');
  While (a^.codes<>Nil) Do
    Begin
      write(a^.codes^.code, ' ');
      a^.codes := a^.codes^.sig;
    End;
End;

{IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }
Procedure imprimirpornivel(a: arbol);

Var 
  l, aux, ult: listaNivel;
  nivel, cant, i: integer;
Begin
  l := Nil;
  If (a <> Nil)Then
    Begin
      nivel := 0;
      agregarAtras (l,ult,a);
      While (l<> Nil) Do
        Begin
          nivel := nivel + 1;
          cant := contarElementos(l);
          write ('Nivel ', nivel, ': ');
          For i:= 1 To cant Do
            Begin
              imprimir(l^.info);
              If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
              If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
              aux := l;
              l := l^.sig;
              dispose (aux);
            End;
          writeln;
        End;
    End;
End;

Procedure agregarCodes(Var l: listac; c:Integer);

Var 
  aux: listac;
Begin
  new(aux);
  aux^.code := c;
  aux^.sig := l;
  l := aux;
End;

Procedure insertar(Var a: arbol; e: encomienda);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := e;
      agregarCodes(aux^.codes, e.codigo);
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (e.peso<a^.dato.peso) Then
        insertar(a^.HI, e)
      Else If (e.peso>a^.dato.peso) Then
             insertar(a^.HD, e)
      Else If (e.peso=a^.dato.peso) Then
             agregarCodes(a^.codes, e.codigo);
    End;
End;

Procedure cargarArbol(l:lista; Var a:arbol);
Begin
  While (l<>Nil) Do
    Begin
      insertar(a, l^.dato);
      l := l^.sig;
    End;
End;

Var 
  l: lista;
  a: arbol;
Begin
  Randomize;
  crearLista(l);
  writeln ('Lista de encomiendas generada: ');
  imprimirLista(l);
  cargarArbol(l, a);
  imprimirpornivel(a);
End.
