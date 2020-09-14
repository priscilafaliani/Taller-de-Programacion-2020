// Modulo que agrega un elemento al final de un arreglo (de ser posible)
procedure agregar(var numeros : arrNum; var diml: integer; num : integer);
begin
  if(diml < dimf) then begin
    diml := diml + 1;
    numeros[diml] := num;
  end;
end;

// Modulo que carga un arreglo hasta dimf (constante) números, máximo.
procedure cargarNumeros(var numeros : arrNum; var diml : integer);
var
  aux : integer;
begin
  diml := 0;
  readln(aux);
  while((diml < dimf) and (aux <> 0)) do begin
    agregar(numeros, diml, num);
    readln(aux);
  end;
end;

// Modulo que imprime los contenidos de un arreglo
procedure imprimirArreglo(numeros : arrNum; diml : integer);
var i : integer;
begin
  for i := 1 to diml do
    writeln(numeros[i]);
end;

// Busca un elemento y retorna su posicion o -1 en caso de no existir
function buscarElemento(numeros : arrNum; diml, num : integer): integer;
var pos : integer;
begin
  pos := 1;
  while((pos <= diml) and (numeros[pos] <> num)) do
    pos := pos + 1;
  // si no lo encontro o no hay elementos
  if(diml < pos or diml = 0) then
    pos := -1;
  buscarElemento := pos;
end;

// Modulo que recibe un valor y de ser posible lo elimina del arreglo
procedure eliminarNum(var numeros : arrNum; var diml : integer; var done : boolean; num : integer);
var
  pos, i : integer;
begin
  done := false;
  pos := buscarElemento(numeros, diml, num)
  // si encontro el elemento
  if(pos <> -1) then begin
    diml := diml - 1;
    for i := pos to diml do
      numeros[i] := numeros[i + 1];
    done := true;
  end;
end;

// Agrega un nodo de enteros al principio de una lista
procedure agregarALista(var listaNum : listaPtr; num : integer);
var nodo, aux : listaPtr;
begin
  new(nodo);
  nodo^.datos := num;
  nodo^.sig := nil;

  if(listaNum = nil) then
    listaNum := nodo
  else begin
    aux := listaNum;
    while(aux^.sig <> nil) do
      aux := aux^.sig;
    aux^.sig := nodo;
  end;
end;

// Modulo que crea una lista de números random entre 0 y 15
procedure listaNumRandoms(var listaNum : listaPtr);
var aux : integer;
begin
  randomize();
  aux := random(16)
  while(aux <> 15) do begin
    agregarALista(listaNum, aux);
    aux := random(16);
  end;
end;
