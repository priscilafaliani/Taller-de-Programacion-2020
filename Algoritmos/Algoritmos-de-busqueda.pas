procedure busquedaBinaria(numeros : arrNumeros; inicio, fin : indice; num : integer; var pos : indice);
var mid : integer;
begin
  pos := -1;
  while(inicio <= fin) and (num <> numeros[mid]) do begin
    if(num < numeros[mid]) then
      fin := mid - 1
    else inicio := mid + 1;
    mid := (inicio + fin) div 2;
  end;
  if(inicio <= fin) then pos := mid;
end;

// Recursiva
procedure busquedaBinaria(numeros : arrNumeros; inicio, fin : indice; num : integer; var pos : indice);
var mid : integer;
begin
  if(inicio <= fin) then begin
    mid := (inicio + fin) div 2;
    if(numeros[mid] = num) then
      pos := mid
    else if(num < numeros[mid]) then
      busquedaBinaria(numeros, inicio, (mid - 1), num, pos)
    else busquedaBinaria(numeros, (mid + 1), fin, num, pos);
  end;
  else pos := -1;
end;
