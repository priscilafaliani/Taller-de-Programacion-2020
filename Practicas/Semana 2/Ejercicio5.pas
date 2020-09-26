program ejercicio6;

type
  arbolPtr = ^regNodo;

  regNodo = record
    data : integer;
    izq : arbolPtr;
    der : arbolPtr;
  end;

function crearNodo(data : integer): arbolPtr;
var nodo : arbolPtr;
begin
  new(nodo);
  nodo^.data := data;
  nodo^.izq := nil;
  nodo^.der := nil;
  crearNodo := nodo;
end;

procedure insertar(var raiz : arbolPtr; data : integer);
begin
  if(raiz = nil) then
    raiz := crearNodo(data)
  else if(data <= raiz^.data) then
    insertar(raiz^.izq, data)
  else
    insertar(raiz^.der, data);
end;

procedure cargarNumeros(var numeros : arbolPtr);
var
  num : integer;
begin
  randomize();
  num := random(20);
  while(num <> 0) do begin
    insertar(numeros, num);
    num := random(20);
  end;
end;

procedure imprimirArbol(numeros : arbolPtr);
begin
  if(numeros <> nil) then begin
    writeln(numeros^.data);
    imprimirArbol(numeros^.izq);
    imprimirArbol(numeros^.der);
  end;
end;

function maxEnArbol(arbol : arbolPtr): integer;
begin
  if(arbol = nil) then
    maxEnArbol := -1
  else if (arbol^.der <> nil) then
    maxEnArbol := maxEnArbol(arbol^.der)
  else maxEnArbol := arbol^.data;
end;

function minEnArbol(arbol : arbolPtr): integer;
begin
  if(arbol = nil) then
    minEnArbol := -1
  else if (arbol^.izq <> nil) then
    minEnArbol := minEnArbol(arbol^.izq)
  else minEnArbol := arbol^.data;
end;

function elementosEnArbol(arbol : arbolPtr): integer;
begin
  if(arbol = nil) then
    elementosEnArbol := 0
  else
    elementosEnArbol := 1 + elementosEnArbol(arbol^.izq) + elementosEnArbol(arbol^.der);
end;

procedure imprimirCreciente(arbol : arbolPtr);
begin
  if(arbol <> nil) then begin
    imprimirCreciente(arbol^.izq);
    writeln(arbol^.data);
    imprimirCreciente(arbol^.der);
  end;
end;

procedure imprimirDecreciente(arbol : arbolPtr);
begin
  if(arbol <> nil) then begin
    imprimirDecreciente(arbol^.der);
    writeln(arbol^.data);
    imprimirDecreciente(arbol^.izq);
  end;
end;

procedure recorrido(a:arbolPtr);

begin

  if (a <> nil) then begin

    recorrido(a^.izq);

    recorrido(a^.der);

    writeln(a^.data);
  end;
end;

var
  numeros : arbolPtr;
begin
  cargarNumeros(numeros);
  writeln('ARBOL FINAL: ');
  imprimirArbol(numeros);
  writeln('Numero mas grande en el arbol: ', maxEnArbol(numeros));
  writeln('Numero mas chico en el arbol: ', minEnArbol(numeros));
  writeln('Cantidad de numeros en el arbol: ', elementosEnArbol(numeros));
  writeln('Arbol en forma creciente: ');
  imprimirCreciente(numeros);
  writeln('Arbol en forma decreciente: ');
  imprimirDecreciente(numeros);
  writeln('IMPRIMIR: ');
  recorrido(numeros);
  readln;
end.
