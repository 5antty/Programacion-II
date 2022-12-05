
Program recu;

Type 
  oferta = Record
    nombre_puesto: string;
    descripcion: String;
    cod_postal: integer;
    cant_vacantes: Integer;
  End;

  empresa = Record
    nombre: string;
    cod: Integer;
    ofertas: lista;
  End;

  lista = ^nodol;
  nodol = Record
    dato: oferta;
    sig: lista;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato : empresa;
    HI: arbol;
    HD: arbol;
  End;

Procedure LeerEmpresa(Var e:empresa);
Begin
  write('Ingrese el nombre de la empresa:');
  ReadLn(e.nombre);
  write('Ingrese el codigo de la empresa: ');
  ReadLn(e.cod);
End;

Procedure LeerOferta(Var o:oferta);
Begin
  Write('Ingrese el nombre del puesto: ');
  ReadLn(o.nombre_puesto);
  Write('Ingrese la descripcion: ');
  ReadLn(o.descripcion);
  Write('Ingrese el codigo postal: ');
  ReadLn(o.cod_postal);
  Write('Ingrese la cantidad de vacantes: ');
  ReadLn(o.cant_vacantes);
End;

Procedure agregarOferta(Var l: lista; o:oferta);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := o;
  aux^.sig := l;
  l := aux;
End;

Procedure insertar(Var a: arbol; e:empresa; o:oferta);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := e;
      agregarOferta(aux^.ofertas, o);
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (e.cod<a^.dato.cod) Then
        insertar(a^.HI, p)
      Else If (e.cod>a^.dato.cod) Then
             insertar(a^.HD, p)
      Else If (e.cod=a^.dato.cod) Then
             Begin
               agregarOferta(a^.dato.ofertas,  o)
             End;
    End;
End;


Begin

End.
