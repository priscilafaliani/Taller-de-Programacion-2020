{ Realice un modulo que lea los datos de 10 números enteros
y los almacene en un árbol binario de búsqueda }

{ Dada la estructura, realice un programa que sume todos los elementos
del árbol }

{ Dada la estructura, realice un programa que informe el valor máximo
almacenado en la estructura }
program ejercicio3;

type
  arbolPtr = ^regNodo;
  regNodo = record
    num : integer;
    left : arbolPtr;
    right : arbolPtr;
  end;

function crearNodo(num : integer): arbolPtr;
var
  nodo : arbolPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.left := nil;
  nodo^.right := nil;
  crearNodo := nodo;
end;

procedure agregarEnArbol(var arbol : arbolPtr; num : integer);
begin
  if(arbol = nil) then
    arbol := crearNodo(num)
  else if(num < arbol^.num) then
    agregarEnArbol(arbol^.left, num)
  else
    agregarEnArbol(arbol^.right, num);
end;

procedure cargar10Enteros(var arbol : arbolPtr);
var
  num, cantNums : integer;
begin
  randomize;
  cantNums := 0;
  while(cantNums < 10) do begin
    num := random(100) + 1;
    agregarEnArbol(arbol, num);
    cantNums := cantNums + 1;
  end;
end;

procedure imprimirElementos(arbol : arbolPtr);
begin
  if(arbol <> nil) then begin
    writeln(arbol^.num);
    imprimirElementos(arbol^.left);
    imprimirElementos(arbol^.right);
  end;
end;

function sumaDeTodosLosNumeros(arbol : arbolPtr): integer;
begin
  if(arbol = nil) then
    sumaDeTodosLosNumeros := 0
  else 
  sumaDeTodosLosNumeros := arbol^.num + sumaDeTodosLosNumeros(arbol^.left) + sumaDeTodosLosNumeros(arbol^.right);
end;

var
  numeros : arbolPtr;
begin
  numeros := nil;
  cargar10Enteros(numeros);
  imprimirElementos(numeros);
  writeln('SUMA DE TODOS LOS NUMEROS: ', sumaDeTodosLosNumeros(numeros));
  readln;
end.
