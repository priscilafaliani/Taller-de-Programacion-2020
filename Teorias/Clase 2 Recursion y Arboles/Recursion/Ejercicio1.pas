{ Realice un programa que lea 8 valores enteros. Genere una lista donde los
elementos se inserten adelante. Al finalizar implemente un modulo recursivo
que imprima los valores de la lista }

{¿En que orden se imprimen los datos?¿Cómo los imprimo de forma inversa?}

program ejercicio1;

type
  listaPtr = ^regNodo;
  regNodo = record
    num : integer;
    sig : listaPtr;
  end;

function crearNodo(num : integer): listaPtr;
var
  nodo : listaPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.sig := nil;
  crearNodo := nodo;
end;

procedure insertarAdelante(var numeros : listaPtr; num : integer);
var
  nodo : listaPtr;
begin
  nodo := crearNodo(num);
  nodo^.sig := numeros;
  numeros := nodo;
end;

procedure cargarOchoNumeros(var numeros : listaPtr);
var
  i : integer;
begin
  randomize;
  for i := 1 to 8 do
    insertarAdelante(numeros, random(500));
end;

procedure imprimirRecursivo(numeros : listaPtr);
begin
  if(numeros <> nil) then begin
    writeln(numeros^.num);
    imprimirRecursivo(numeros^.sig);
  end;
end;

procedure imprimirRecursivoInverso(numeros : listaPtr);
begin
  if(numeros^.sig <> nil) then
    imprimirRecursivoInverso(numeros^.sig);
  writeln(numeros^.num);
end;

var
  numeros : listaPtr;
begin
  numeros := nil;
  cargarOchoNumeros(numeros);
  writeln('IMPRIMIENDO COMO LIFO');
  imprimirRecursivo(numeros);
  writeln('IMPRIMIENDO COMO FIFO');
  imprimirRecursivoInverso(numeros);
  readln;
end.
