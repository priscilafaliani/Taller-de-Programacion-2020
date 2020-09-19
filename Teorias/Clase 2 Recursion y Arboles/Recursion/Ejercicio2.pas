{ Realice un programa que lea números hasta leer el valor 0 e imprima
sus dígitos en el orden en que aparecen en el número. Si se lee 256, se
debe imprimir 2 5 y 6}
program ejercicio2;

procedure imprimirDigitos(num : integer);
begin
  if(num >= 10) then
    imprimirDigitos(num div 10);
  write(num mod 10, ' ');
end;

var
  num : integer;
begin
  writeln('LA LECTURA FINALIZA CON 0');
  writeln('NUMERO: ');
  readln(num);
  while(num <> 0) do begin
    imprimirDigitos(num);
    writeln();
    writeln('NUMERO: ');
    readln(num);
  end;
end.
