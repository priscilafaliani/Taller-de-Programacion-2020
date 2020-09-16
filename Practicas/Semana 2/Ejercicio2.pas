program ejercicio2;
const
  cantNumeros = 20;
type
  rangoNumeros = 1..cantNumeros;
  arrNumeros = array[rangoNumeros] of integer;

procedure cargarNumeros(var numeros : arrNumeros);
var i : integer;
begin
  randomize();
  for i := 1 to cantNumeros do
    numeros[i] := random(100) + 1;
end;

procedure imprimirVector(numeros : arrNumeros);
var i : integer;
begin
  for i := 1 to cantNumeros do
    writeln('Num en la posicion ', i, ') ', numeros[i]);
end;

function maximo(numeros : arrNumeros; cantNumeros, max : integer): integer;
begin
  // si recorrio todo el vector
  if(cantNumeros = 0) then maximo := max
  else begin
    // si encontro un nuevo maximo
    if (numeros[cantNumeros] > max) then max := numeros[cantNumeros];
    // sigue comparando numeros
    maximo :=  maximo(numeros, (cantNumeros - 1), max);
  end;
end;

function sumarValores(numeros : arrNumeros; cantNumeros, suma : integer): integer;
begin
  if(cantNumeros = 0) then sumarValores := suma
  else begin
    sumarValores := numeros[cantNumeros] + sumarValores(numeros, (cantNumeros - 1), suma);
  end;
end;

function sumarValores(numeros : arrNumeros; cantNumeros : integer): integer;
begin
  sumarValores := sumarValores(numeros, cantNumeros, 0);
end;

var
  numeros : arrNumeros;
begin
  cargarNumeros(numeros);
  imprimirVector(numeros);
  writeln('MAXIMO: ', maximo(numeros, cantNumeros, -32767));
  writeln('SUMA DE LOS NUMEROS: ', sumarValores(numeros, cantNumeros));
  readln;
end.
