              dispose (aux);
            End;
          writeln;
        End;
    End;
End;

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

Function MayorGoleador(a:arbol; max:integer): str70;

Var equipo: str70;
Begin
  If (a<>Nil) Then
    Begin
      If (a^.dato.goles>max) Then
        Begin
          max := a^.dato.goles;
          equipo := a^.dato.equipo;
          equipo := MayorGoleador(a^.HI, max);
          equipo := MayorGoleador(a^.HD, max);
        End
      Else
        equipo := MayorGoleador(a^.HI, max);
      equipo := MayorGoleador(a^.HD, max)
    End;
  MayorGoleador := equipo;
End;

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

Function verMin(a:arbol): arbol;
Begin
  If (a^.HI=Nil) Then
    verMin := a
  Else
    verMin := verMin(a^.HI);
End;


Procedure borrar (Var a:arbol; dni:LongInt);

Var 
  aux: arbol;
Begin
  If (a<>Nil)Then
    If (a^.dato.DNI>dni)Then
      borrar(a^.HI,dni)
  Else