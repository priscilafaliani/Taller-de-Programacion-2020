program ejercicio4,
const
  condCorte = 0;

function aBinario(num, binario : integer): integer;
begin
  if(num = 0) then aBinario := binario
  else begin
    
  end;
end;

var
  num : integer;
begin
  readln(num);
  while(num <> condCorte) do begin
    writeln('EN BINARIO: ', aBinario(num));
    readln(num);
  end;
end.
