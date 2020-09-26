program ejercicio1;
const
  condSalida = 0;
type
  listaPtr = ^regNodo;

  regNodo = record
    num : integer;
    sig : listaPtr;
  end;

function crearNodo(num : integer): listaPtr;
var nodo : listaPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.sig := nil;
  crearNodo := nodo;
end;

procedure agregarALista(var numeros : listaPtr; num : integer);
var nodo : listaPtr;
begin
  nodo := crearNodo(num);
  nodo^.sig := numeros;
  numeros := nodo;
end;

procedure crearLista(var numeros : listaPtr);
var aux, i : integer;
begin
  for i := 1 to 10 do begin
    aux := random(500);
    agregarALista(numeros, aux);
  end;
end;

procedure imprimirLista(numeros : listaPtr);
var i : integer;
begin
  i := 1;
  while(numeros <> nil) do begin
    writeln('Numero ', i, '): ', numeros^.num);
    i := i + 1;
    numeros := numeros^.sig;
  end;
end;

function minimoLoop(numeros : listaPtr): integer;
var min : integer;
begin
  min := 32767;
  while(numeros <> nil) do begin
    if(min > numeros^.num) then min := numeros^.num;
    numeros := numeros^.sig;
  end;
  minimoLoop := min;
end;

function existeN(numeros : listaPtr; num : integer): boolean;
begin
  if(numeros = nil) then
    existeN := false
  else begin
    if(numeros^.num = num) then
      existeN := true
    else
      existeN := existeN(numeros^.sig, num);
  end;
end;

function minimo(numeros : listaPtr): integer;
var min : integer;
begin
  if(numeros = nil) then
    minimo := 32767
  else begin
    min := minimo(numeros^.sig);
    if(numeros^.num < min) then
      minimo := numeros^.num
    else
      minimo := min;
  end;
end;

var
  numeros : listaPtr;
begin
  numeros := nil;
  crearLista(numeros);
  writeln('| LISTA | ');
  imprimirLista(numeros);
  writeln(minimo(numeros));
  writeln(existeN(numeros, 54));
  readln;
end.
