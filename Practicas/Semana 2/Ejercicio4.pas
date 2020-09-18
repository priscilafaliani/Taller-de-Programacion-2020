program ejercicio4;

function binarioIterativo(num : integer): longint;
var
  resultado, posicionDecimal : longint;
begin
  posicionDecimal := 1; resultado := 0;
  while(num <> 0) do begin
    if((num mod 2) = 1) then
      resultado := resultado + posicionDecimal;
    posicionDecimal := posicionDecimal * 10;
    num := num div 2;
    end;
  binarioIterativo := resultado;
end;

procedure binarioRecursivo(num : integer; posDec : longint; var res : longint);
begin
  if(num <> 0) then begin
    if((num mod 2) = 1) then
      res := res + posDec;
    binarioRecursivo((num div 2), (posDec * 10), res);
  end;
end;

function binarioRecursivoFuncion(num : integer; posDec, res : longint): longint;
begin
  if(num <> 0) then begin
    if((num mod 2) = 1) then
      res := res + posDec;
    res := binarioRecursivoFuncion((num div 2), (posDec * 10), res);
  end;
  binarioRecursivoFuncion := res;
end;

function binarioRecursivoFuncion(num : integer): longint;
begin
  binarioRecursivoFuncion := binarioRecursivoFuncion(num, 1, 0);
end;

var
  binario : longint;
begin
  binario := 0;
  binarioRecursivo(15, 1, binario);
  writeln('Convertido a binario: ', binario,'. CON FUNCION:', binarioRecursivoFuncion(2));
  readln;
end.
