// Selección
//
procedure selectionSort(var numeros : arrNum; diml : integer);
var
  i, j, actual, aux : integer;
begin
  for i := 1 to (diml - 1) do begin
    actual := i;
    for j := (i + 1) to diml do begin
      if(numeros[j] < numeros[actual]) then
        actual := j;
    end;
    aux := numeros[i];
    numeros[i] := actual;
    numeros[actual] := aux;
  end;
end;

// Inserción
procedure insertionSort(var numeros : arrNum; diml : integer);
var
  i, j, actual : integer;
begin
  for i := 2 to diml do begin
    actual := numeros[i];
    j := i - 1;
    while((j > 0) and (numeros[j] > actual )) do begin
      numeros[j + 1] := numeros[j];
      j := j - 1;
    end;
    numeros[j + 1] := actual;
  end;
end;

// Merge de listas
procedure merge(lista1, lista2 : listaPtr; var nuevaLista : listaPtr);
begin
  while((lista1 <> nil) and (lista2 <> nil)) do begin
    if(lista1^.num < lista2^.num) then begin
      agregarALista(nuevaLista, lista1^.num);
      lista1 := lista1^.sig;
    end
    else begin
      agregarALista(nuevaLista, lista2^.num);
      lista2 := lista2^.sig;
    end;
  end;
  if((lista1 <> nil) and (lista2 = nil)) then begin
    while(lista1 <> nil) do begin
      agregarALista(nuevaLista, lista1^.num);
      lista1 := lista1^.sig;
    end;
  end;
  else if((lista2 <> nil) and (lista1 = nil)) then begin
    while(lista2 <> nil) do begin
      agregarALista(nuevaLista, lista2^.num);
      lista2 := lista2^.sig;
    end;
  end;
end;

// merge de un array de listas
const
  cantListas = aConstantNumber;
procedure merge(listas : arrListas; nuevaLista : listaPtr);
var
  i, min : integer;
begin

end;
