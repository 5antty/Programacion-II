program CalculoDePotencia;

Function potencia1 (x,n: integer): real;
begin
   if(n=0)then potencia1 := 1
   else potencia1 := x * potencia1(x,n-1);
end;

{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin
     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln('El resultado es: ', potencia1(x,n):2:2);
     readln;
end.
