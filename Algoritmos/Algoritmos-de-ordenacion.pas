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
