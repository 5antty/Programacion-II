
Program grupo30;

Uses 
sysutils;
{poner la lista de jugadores en jugador}

Type 
  str70 = string[70];

  jugador = Record
    DNI: longint;
    nombre_apellido: str70;
    equipo: str70;
    goles: integer;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: jugador;
    sig: lista;
  End;

  fecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;

  partido = Record
    identificador: longint;
    local: str70;
    visitante: str70;
    fecha_partido: fecha;
    estadio: str70;
    goleadores: lista;
  End;

  listaPartidos = ^nodoPartidos;
  nodoPartidos = Record
    dato: partido;
    sig: listaPartidos;
  End;

  nombres = array [1..20] Of str70;

  ListaGoles = ^nodog;
  nodog = Record
    fecha: fecha;
    goles: Integer;
    sig: ListaGoles;
  End;

  arbol = ^nodoA;
  nodoA = Record
    dato: jugador;
    listag: ListaGoles;
    HI: arbol;
    HD: arbol;
  End;

  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;


     {Completar con los tipos de datos necesarios}

Procedure cargarFecha(Var f: fecha);
Begin
  f.dia := random(30)+1;
  f.mes := random(12)+1;
  If (f.mes = 2) And (f.dia > 28)Then
    f.dia := 28
  Else
    If ((f.mes = 4) Or (f.mes = 6) Or (f.mes =9) Or (f.mes = 11)) And (f.dia =
       31)Then
      f.dia := 30;
  f.anio := 2022;
End;

Procedure agregar(Var l: listaPartidos; p: partido);

Var 
  aux: listaPartidos;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Procedure agregarJugador(Var l: lista; j: jugador);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := j;
  aux^.sig := l;
  l := aux;
End;

Procedure cargarEquipos(Var v:nombres );
Begin
  v[1] := 'Atletico Tucuman';
  v[2] := 'Huracan';
  v[3] := 'Gimnasia LP';
  v[4] := 'Godoy Cruz';
  v[5] := 'Argentino Juniors';
  v[6] := 'River';
  v[7] := 'Boca';
  v[8] := 'Racing';
  v[9] := 'Platense';
  v[10] := 'San Lorenzo';
  v[11] := 'Patronato';
  v[12] := 'Estudiantes';
  v[13] := 'Union';
  v[14] := 'Newells';
  v[15] := 'Barracas';
  v[16] := 'Tigre';
  v[17] := 'Arsenal';
  v[18] := 'Sarmiento';
  v[19] := 'Central';
  v[20] := 'Colon';
End;

Procedure cargarJugadores(Var l: lista; local, visitante:str70);

Var 
  j: jugador;
  cant, i, pos, loc_vis: integer;
  v: nombres;
Begin
  cant := random(2);
  v[1] := 'Lionel Perez';
  v[2] := 'Martin Fernandez';
  v[3] := 'Mariano Gomez';
  v[4] := 'Alejandro Gonzalez';
  v[5] := 'Fermin Martinez';
  v[6] := 'Nicolas Castro';
  v[7] := 'Gonzalo Villareal';
  v[8] := 'Tadeo Parodi';
  v[9] := 'Juan Pablo Silvestre';
  v[10] := 'Mariano Sanchez';
  v[11] := 'Alejo Monden';
  v[12] := 'Agustin Paz';
  v[13] := 'Juan Salto';
  v[14] := 'Matias Pidone';
  v[15] := 'Luis Hernandez';
  v[16] := 'Cristian Herrera';
  v[17] := 'Santiago Manzur';
  v[18] := 'Julian Darino';
  v[19] := 'Victor Abila';
  v[20] := 'Luciano Segura';
  If ((local='Colon')Or(visitante='Colon'))Then
    Begin
      With (j) Do
        Begin
          DNI := 34807474;
          nombre_apellido := 'Leandro Romanut';
          equipo := 'Colon';
          goles := random(3)+1;
        End;
      agregarJugador(l, j);
    End;
  For i:=1 To cant Do
    Begin
      With (j) Do
        Begin
          DNI := random(18000000)+20000000;;
          pos := random(20)+1;
          nombre_apellido := v[pos];
          loc_vis := random(2)+1;
          If (loc_vis=1)Then
            equipo := local
          Else
            equipo := visitante;
          goles := random(3)+1;
        End;
      agregarJugador(l, j);
    End;
End;

Procedure crearLista(Var l: listaPartidos);

Var 
  p: partido;
  cant,i,pos,loc,vis: integer;
  v, v2: nombres;
Begin
  cant := random(20)+1;
  v[1] := 'Antonio Vespucio Liberti';
  v[2] := 'Mario Alberto Kempes';
  v[3] := 'Alberto Armando';
  v[4] := 'Ciudad de La Plata';
  v[5] := 'Presidente Peron';
  v[6] := 'Jose Amalfitani';
  v[7] := 'Tomas Adolfo Duco';
  v[8] := 'Libertadores de America';
  v[9] := 'Pedro Bidegain';
  v[10] := 'Nestor Diaz Perez';
  v[11] := 'Marcelo Bielsa';
  v[12] := 'Gigante de Arroyito';
  v[13] := 'Malvinas Argentinas';
  v[14] := 'Brigadier General Estanislao Lopez';
  v[15] := 'Eduardo Gallardon';
  v[16] := 'Jose Maria Minella';
  v[17] := 'Florencio Sola';
  v[18] := 'Monumental Jose Fierro';
  v[19] := 'Nueva Espa�a';
  v[20] := 'Nuevo Francisco Urbano';
  cargarEquipos(v2);
  For i:=1 To cant Do
    Begin
      With (p) Do
        Begin
          identificador := random (100000)+1;
          pos := random(20)+1;
          estadio := v[pos];
          loc := random(20)+1;
          local := v2[loc];
          vis := random(20)+1;
          visitante := v2[vis];
          While (local=visitante) Do
            Begin
              vis := random(20)+1;
              visitante := v2[vis];
            End;
          cargarFecha(fecha_partido);
          goleadores := Nil;
          cargarJugadores(goleadores, local, visitante);
        End;
      agregar(l, p);
    End;
End;


Procedure imprimirJugador(j: jugador);
Begin
  With (j) Do
    Begin
      writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ',
              equipo, ' | GOLES: ', goles);
    End;
End;

Procedure imprimirJugadores(l: lista);
Begin
  While (l <> Nil) Do
    Begin
      imprimirJugador(l^.dato);
      l := l^.sig;
    End;
End;

Procedure imprimir(p: partido);
Begin
  With (p) Do
    Begin
      writeln('');
      writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local,
              ' | EQ. VISITANTE: ', visitante, ' | FECHA: ', fecha_partido.dia,
              '/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ',
              estadio);
      imprimirJugadores(goleadores);
    End;
End;

Procedure imprimirLista(l: listaPartidos);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;

{Agrega goles a la lista de goles}
Procedure agregarGoles(Var l:ListaGoles; p:partido);

Var 
  aux: ListaGoles;
Begin
  new(aux);
  aux^.fecha := p.fecha_partido;
  aux^.goles := p.goleadores^.dato.goles;
  aux^.sig := l;
  l := aux;
End;

{Inserta elementos dentro del arbol}
Procedure insertar(Var a: arbol; p:partido);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := p.goleadores^.dato;
      aux^.listag := Nil;
      agregarGoles(aux^.listag,p);
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (p.goleadores^.dato.DNI<a^.dato.DNI) Then
        insertar(a^.HI, p)
      Else If (p.goleadores^.dato.DNI>a^.dato.DNI) Then
             insertar(a^.HD, p)
      Else If (p.goleadores^.dato.DNI=a^.dato.DNI) Then
             Begin
               agregarGoles(a^.listag,p);
             End;
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

{Imprime el registro de fecha}
Procedure impFecha(f:fecha);
Begin
  write('En la fecha dia ', f.dia, ' mes ', f.mes, ' anio ', f.anio, ' ');
End;

{Imprime la cantidad de goles que hizo cada jugador}
Procedure impGoles(a:arbol);
Begin
  writeln('El jugador ', a^.dato.nombre_apellido, ' con DNI ', a^.dato.DNI,
          ' en el equipo ', a^.dato.equipo, ' tiene los siguientes goles');
  While (a^.listag<>Nil) Do
    Begin
      impFecha(a^.listag^.fecha);
      writeln(' tuvo ', a^.listag^.goles, ' goles ');
      a^.listag := a^.listag^.sig;
    End;
End;

{Imprime el arbol por niveles}
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
          writeln ('Nivel ', nivel, ': ');
          For i:= 1 To cant Do
            Begin
              impGoles(l^.info);
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

{Carga el arbol con los datos de la lista de listas}
Procedure cargarArbol(l:listaPartidos; Var a:arbol);
Begin
  While (l<>Nil) Do
    Begin
      While (l<>Nil) And (l^.dato.goleadores<>Nil) Do
        Begin
          insertar(a, l^.dato);
          l^.dato.goleadores := l^.dato.goleadores^.sig;
        End;
      l := l^.sig;
    End;
End;










{Utilizamos procedimiento en vez de funcion porque nesecitabamos devolver un dato compuesto y las funciones devuelven  tipos de datos simples, ademas de modificar variables por referencia}
Procedure MayorGoleador(a:arbol; Var max:Integer; Var equipo:str70);
Begin
  If (a<>Nil) Then
    Begin
      If (a^.dato.goles>max) Then
        Begin
          max := a^.dato.goles;
          equipo := a^.dato.equipo;
          MayorGoleador(a^.HI, max, equipo);
          MayorGoleador(a^.HD, max, equipo);
        End
      Else
        Begin
          MayorGoleador(a^.HI, max, equipo);
          MayorGoleador(a^.HD, max, equipo)
        End;
    End;
End;

{Busqueda acotada en un rango dentro del arbol}
Procedure busquedaAcotada(a: arbol; inf, sup:LongInt);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato.DNI>= inf) Then
        If (a^.dato.DNI<= sup) Then
          Begin
            busquedaAcotada(a^.hi, inf, sup);
            imprimirJugador(a^.dato);
            busquedaAcotada (a^.hd, inf, sup);
          End
      Else
        busquedaAcotada(a^.hi, inf, sup)
      Else
        busquedaAcotada(a^.hd, inf, sup);
    End;
End;

{Deveuelve menor arbol a la izquierda}
Function verMin(a:arbol): arbol;
Begin
  If (a^.HI=Nil) Then
    verMin := a
  Else
    verMin := verMin(a^.HI);
End;

{Borra elemento de un arbol}
Procedure borrar (Var a:arbol; dni:LongInt);

Var 
  aux: arbol;
Begin
  If (a<>Nil)Then
    If (a^.dato.DNI>dni)Then
      borrar(a^.HI,dni)
  Else
    If (a^.dato.DNI<dni) Then
      borrar(a^.HD,dni)
  Else
    If (a^.HI=Nil) Then
      Begin
        aux := a;
        a := a^.HD;
        dispose(aux);
      End
  Else
    If (a^.HD=Nil) Then
      Begin
        aux := a;
        a := a^.HI;
        dispose(aux);
      End
  Else
    Begin
      aux := verMin(a^.HD);
      borrar(a^.HD,aux^.dato.DNI);
    End;
End;

Var 
  l: listaPartidos;
  a: arbol;
  max: integer;
  equipo: str70;
Begin
  Randomize;
  max := -1;
  l := Nil;
  crearLista(l); {carga automatica de la estructura disponible}
  writeln ('LISTA GENERADA: ');
  imprimirLista(l);
  cargarArbol(l, a);
  WriteLn('Arbol antes de borrar:');
  imprimirpornivel(a);
  WriteLn;
  MayorGoleador(a, max, equipo);
  WriteLn('El equipo del mayor goleador es ', equipo);
  WriteLn('Busqueda Acotada: ');
  busquedaAcotada(a, 28000000, 32000000);
  borrar(a, 34807474);
  WriteLn('Arbol despues de borrar:');
  imprimirpornivel(a);
  writeln('Fin del programa');
  readln;
End.
