// Modulo que carga un arreglo hasta 20 números
procedure cargarNumeros(var numeros : arrNum; var diml : integer);
var
  aux : integer;
begin
  diml := 0;
  readln(aux);
  while((diml < 20) and (aux <> 0)) do begin
    diml := diml + 1;
    numeros[diml] := aux;
    if(diml < 20) then readln(aux);
  end;
end;

// Modulo que imprime los contenidos de un arreglo
procedure imprimirArreglo(numeros : arrNum; diml : integer);
var i : integer;
begin
  for i := 1 to diml do
    writeln(numeros[i]);
end;

// Modulo que recibe un valor y de ser posible lo elimina del arreglo
procedure eliminarNum(var numeros : arrNum; var diml : integer; var done : boolean; num : integer);
var
  pos, i : integer;
begin
  done := false;
  // si hay elementos
  if(diml > 0) then begin
    pos :=1;
    // busca el elemento
    while((pos <= diml) and (numeros[pos] <> num)) do
      pos := pos + 1;
    // si encontro el elemento
    if(pos <= diml) then begin
      diml := diml - 1;
      for i := pos to diml do
        numeros[i] := numeros[i + 1];
      done := true;
    end;
  end;
end;

// Modulo que crea una lista de números random entre 0 y 15
// Para que funcione es necesario llamar a randomize(); al comienzo del programa.
procedure listaNumRandoms(var listaNum : listaPtr);
var
  aux : integer;
  nodo : listaPtr;
begin
  aux := random(15) + 1;
  while(aux <> 15) do begin
    new(nodo);
    nodo^.datos := aux;
    nodo^.sig := listaNum;
    listaNum := nodo;
    aux := random(15) + 1;
  end;
end;
