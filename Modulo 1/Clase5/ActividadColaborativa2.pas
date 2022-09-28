
Program ActividadColaborativa2;

Type 
  cadena15 = String[15];
  paciente = Record
    dni: LongInt;
    cp: Integer;
    ciudad: cadena15;
  End;





{lista = ^nodol;
  nodol = Record
    dato: paciente;
    cant: Integer;
    sig: lista;
  End;}
  listadni = ^nododni;
  nododni = Record
    dato: LongInt;
    sig: listadni;
  End;
  lista = ^nodol;
  nodol = Record
    dato: paciente;
    dni: listadni;
    sig: lista;
  End;
  arbol = ^nodoA;
  nodoA = Record
    dato: lista;
    HI: arbol;
    HD: arbol;
  End;
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;

Procedure LeerPaciente(Var p:paciente);
Begin
  write('Ingrese el DNI del paciente: ');
  readln(p.dni);
  If (p.dni<>0) Then
    Begin
      Write('Ingrese el codigo postal: ');
      ReadLn(p.cp);
      Write('Ingrese el nombre de la ciudad: ');
      ReadLn(p.ciudad);
    End;
End;

Procedure agregarAdelante(Var l: lista; p:paciente);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Procedure agregarDNI(Var l: listadni; p:paciente);

Var 
  aux: listadni;
Begin
  new(aux);
  aux^.dato := p.dni;
  aux^.sig := l;
  l := aux;
End;


Procedure insertar(Var a: arbol; l:lista);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := l;
      {aux^.dato^.cant := 1; EJERCICIO 1}
      agregarDNI(aux^.dato^.dni, l^.dato);
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (l^.dato.cp<a^.dato^.dato.cp) Then
        insertar(a^.HI, l)
      Else If (l^.dato.cp>a^.dato^.dato.cp) Then
             insertar(a^.HD, l)
      Else If (l^.dato.cp=a^.dato^.dato.cp) Then
        {a^.dato^.cant := a^.dato^.cant+1; EJERCICIO 1}
             agregarDNI(a^.dato^.dni, l^.dato);
    End;
End;

Procedure cargarArbol(l:lista; Var a:arbol);
Begin
  While (l<>Nil) Do
    Begin
      insertar(a, l);
      l := l^.sig;
    End;
End;

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




{writeln('La ciudad ', a^.dato^.dato.ciudad, ' con codigo ', a^.dato^.dato.cp,' tiene ', a^.dato^.cant, ' pacientes');}
  writeln('La ciudad ', a^.dato^.dato.ciudad, ' con codigo ', a^.dato^.dato.cp,
          ' tiene los pacintes: ');
  While (a^.dato^.dni<>Nil) Do
    Begin
      writeln(a^.dato^.dni^.dato);
      a^.dato^.dni := a^.dato^.dni^.sig;
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

Procedure busquedaAcotada(a: arbol; inf, sup:integer);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato^.dato.cp>= inf) Then
        If (a^.dato^.dato.cp<= sup) Then
          Begin
            imprimir(a);
            busquedaAcotada(a^.hi, inf, sup);
            busquedaAcotada (a^.hd, inf, sup);
          End
      Else
        busquedaAcotada(a^.hi, inf, sup)
      Else
        busquedaAcotada(a^.hd, inf, sup);
    End;
End;

Var l: lista;
  a: arbol;
  p: paciente;

Begin
  l := Nil;
  a := Nil;
  LeerPaciente(p);
  While (p.dni<>0) Do
    Begin
      agregarAdelante(l, p);
      LeerPaciente(p);
    End;
  cargarArbol(l, a);
  imprimirpornivel(a);
  busquedaAcotada(a, 1800, 1900);
End.
