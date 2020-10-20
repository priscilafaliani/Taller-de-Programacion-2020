{ los declaro en la seccion type }
{ es una estructura homogenea y lineal }
{ sus indices los elijo yo, puedo utilizar un subrango }
{ contienen tipos de datos estaticos }
{ miArr = array[rango] of integer }
{ necesitan inicializacion }

procedure agregar(var numeros : arrNumeros; var diml : integer; n : integer);
begin
  { si hay lugar }
  if(diml < dimf) then begin
    diml := diml + 1;
    numeros[diml] := n;
  end;
end;

procedure insertar(var numeros : arrNumeros; var diml : integer; pos, n : integer);
var i : integer;
begin
  { si hay lugar y la posicion es valida }
  if(diml < dimf) and (pos >= 1) and (pos <= diml) then begin
    for i := diml downto pos do
      numeros[i + 1] := numeros[i];
    diml := diml + 1;
    numeros[pos] := n;
  end;
end;

procedure insertar(var numeros : arrNumeros; var diml : integer; n : integer);
var i, pos : integer;
begin
  { si hay lugar }
  if(diml < dimf) then begin
    pos := 1;
    { busco su posicion }
    while((pos <= diml) and (numeros[pos] < n)) do
      pos := pos + 1;
    { hago lugar }
    for i := diml downto pos
      numeros[i + 1] := numeros[i];
    { lo inserto }
    numeros[pos] := n;
    diml := diml + 1;
  end;
end;

procedure eliminar(var numeros : arrNumeros; var diml : integer; pos : integer);
var i : integer;
begin
  if(pos >= 1) and (pos <= diml) then begin
    diml := diml - 1;
    for i := pos to diml
      numeros[i] := numeros[i + 1];
  end;
end;

procedure eliminar(var numeros : arrNumeros; var diml : integer; n : integer);
var i, pos : integer;
begin
  while((pos <= diml) and (numeros[pos] <> n))
    pos := pos + 1;
  if(not pos > diml) then begin
    diml := diml - 1;
    for i := 1 to pos
      numeros[i] := numeros[i] + 1;
  end;
end;

procedure insertionSort(var numeros : arrNumeros; diml : integer);
var i, j, actual : integer;
begin
  for i := 2 to diml do begin
    actual := numeros[i];
    j := i - 1;
    while((j > 0) and (numeros[j] > actual)) do begin
      numeros[j + 1] := numeros[j];
      j := j - 1;
    end;
    numeros[j + 1] := actual;
  end;
end;
