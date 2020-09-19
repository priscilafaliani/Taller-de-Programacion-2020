procedure busquedaBinaria(numeros : arrNumeros; inicio, fin : indice; num : integer; var pos : indice);
begin
  while(inicio <= fin) and (num <> numeros[mid]) do begin
    if(num < numeros[mid]) then
      fin := mid - 1
    else inicio := mid + ;
    mid := (inicio + fin) div 2;
  end;
end;
