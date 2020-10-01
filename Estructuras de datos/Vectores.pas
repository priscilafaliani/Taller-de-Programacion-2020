{1. Cargar un arreglo de con capacidad dimf, con dimf elementos}
procedure cargar(var numeros : arrNumeros);
begin
  for i := 1 to dimf do
    readln(numeros[i]);
end;

{2. Cargar un arreglo de dimf capacidad, con diml (<=dimf) elementos}
procedure cargar(var numeros : arrNumeros; var diml : integer);
var num : integer;
begin
  diml := 0;
  readln(num);
  while((diml < dimf) and (num <> 0)) do begin
    diml := diml + 1;
    numeros[diml] := num;
    readln(num);
  end;
end;

{3. Se agrega el elemento al final, si es posible}
procedure agregar(var numeros : arrNumeros; var diml : integer; num : integer);
begin
  if(diml < dimf) then begin
    diml := diml + 1;
    numeros[diml] := num;
  end;
end;

{4. Se agrega el elemento en una posicion especifica, si es posible}
procedure insertar(var numeros : arrNumeros; var diml : integer; pos, num : integer);
var i : integer;
begin
  if((diml < dimf) and (pos >= 1) and (pos <= diml)) then begin
    for i := diml downto pos do
      numeros[i + 1] := numeros[i];
    numeros[pos] := diml;
    diml := diml + 1;
  end;
end;

{5. Inserta un número de menor a mayor, si es posible}
procedure insertar(var numeros : arrNumeros; var diml : integer; num : integer);
var pos, i : integer;
begin
  if(diml < dimf) then begin
    pos := 1;
    while((pos <= diml) and (numeros[pos] <= num)) do
      pos := pos + 1;
    for i := diml to pos do
      numeros[i + 1] := numeros[i];
    numeros[pos] := num;
    diml := diml + 1;
  end;
end;

{6. Busca si existe el número n. Retorna su posición o -1 de si no existe}
function buscar(numeros : arrNumeros; diml, n : integer): integer;
begin

end;

procedure busquedaBinaria(params);
begin

end;

{8. Elimina un elemento en la posición dada}
procedure eliminar(var numeros : arrNumeros; var diml : integer; pos : integer);
var i : integer;
begin
  if((pos >= 1) and (pos <= diml)) then begin
    diml := diml - 1;
    for i := pos to diml do
      numeros[i] := numeros[i + 1];
  end;
end;
