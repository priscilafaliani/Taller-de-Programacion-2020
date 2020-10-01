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

function binarioRecursivo2(num : integer): longint;
begin
  if(num <= 1) then
    binarioRecursivo2 := num
  else
    binarioRecursivo2 := binarioRecursivo2(num div 2) * 10 + num mod 2;
end;

function binarioRecursivo4(num : integer): integer;
begin
  if(num < 2 ) then
    binarioRecursivo4 := num
  else
    binarioRecursivo4 := binarioRecursivo4(num div 2);
end;

procedure binarioRecursivo3(num : integer);
begin
  if(num < 2 ) then
    write(num)
  else begin
    binarioRecursivo3(num div 2);
    write(num mod 2);
  end;
end;

var
  binario : longint;
begin
  readln(binario);
  while(binario <> -1) do begin
    writeln('A BINARIO: ', binarioRecursivo2(binario));
    writeln('Binario recursivo funcion 4: ', binarioRecursivo4(binario));
    writeln('Binario procedimiento: ');
    binarioRecursivo3(binario);
    readln(binario);
  end;
  readln;
end.
