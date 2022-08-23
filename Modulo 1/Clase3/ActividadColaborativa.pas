
Program ActividadColaborativa;

Type 
  nombres = string[15];
  destino = Record
    nombre: nombres;
    dist: real;
    vendidos: integer;
  End;
  arbol = ^nodo;
  nodo = Record
    dato: info;
    HI: arbol;
    HD: arbol;
  End;

Procedure insertar(Var a: arbol; d:destino);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := d;
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (d.nombre<a^.dato.nombre) Then
        insertar(a^.HI, d)
      Else If (d.nombre>a^.dato.nombre) Then
             insertar(a^.HD, d);
    End;
End;

Procedure mostrarMenu;
Begin
  writeln(


      '1- Inicializar las estructuras de datos a utilizar en su funcionamiento.'
  );
  WriteLn('2- Cargar un destino a la estructura utilizada.');
  WriteLn(


    '3- Imprimir la información contenida en la estructura de datos utilizada.'
  );
  WriteLn(


'4- Buscar un destino dentro de la estructura de datos utilizada y mostrar toda su información.'
  );
  WriteLn('5- Buscar e informar el destino más cercano.');
  WriteLn('6- Sumar una cantidad X de pasajes a un destino.');
End;
Procedure LeerDestino(Var d:destino);
Begin
  write('Ingrese el nombre del destino: ');
  readln(d.nombre);
  If (d.nombre<>'.') Then
    Begin
      Write('Ingrese la distancia: ');
      readln(d.dist);
      Write('Ingrese la cantidad de pasajes vendidos: ');
      ReadLn(d.vendidos);
    End;
End;

Var 
  a: arbol;
  d: destino;
  seleccion: Integer;

Begin
  a := Nil;
  mostrarMenu;
  Case seleccion Of 
    1: a := Nil;
    2:
       Begin
         LeerDestino(d);
         While (d.nombre<>'.') Do
           Begin
             insertar(a, d);
             LeerDestino(d)
           End;
       End;

  End;
End.
