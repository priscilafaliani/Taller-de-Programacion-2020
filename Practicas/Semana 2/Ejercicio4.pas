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

function binarioRecursivo(num : integer; posDec, res : longint): longint;
begin
  if(num = 0) then binarioRecursivo := 0
  else begin
    if((num mod 2) = 1) then
      res := res + posDec;
    res := res + binarioRecursivo((num div 2), (posDec * 10), res);
  end;
end;

function binarioRecursivo(num : integer): longint;
begin
  binarioRecursivo := binarioRecursivo(num, 1, 0);
end;

begin
  writeln('Convertido a binario: ', binarioRecursivo(15));
  readln;
end.
