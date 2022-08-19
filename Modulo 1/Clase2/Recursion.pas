program Recursion;

{procedure digitoMaximo(n: integer; max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  writeln ('max: ', max);
end;  }

function digitoMaximo(n: integer):integer;
var
  max:integer;
  dig: integer;
begin
  max:=-1;
  dig:= n mod 10;
  if (dig>max) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then begin
    if(digitoMaximo(n)>max) then begin
      max:=digitoMaximo(n);
    end
  end;
  digitoMaximo:=max;
end;

var
  num, maximo: integer;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  {digitoMaximo (num);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo); }
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo(num));
  readln;
End.
