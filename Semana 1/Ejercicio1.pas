program ejercicio1;
const
  cantOficinas = 300;
type
  // subrango de la cantidad de oficinas.
  srOficinas = 1..300;

  regOficina = record
    codigo : integer;
    dni : integer;
    expensa : real;
  end;

  arrOficinas = array[srOficinas] of regOficina;

procedure leerDatosOficina(var oficina : regOficina);
begin
  with oficina do begin
    writeln('Codigo: ');
    readln(codigo);
    if(codigo <> -1) then begin
      writeln('Dni: ');
      readln(dni);
      writeln('Expensa: ');
      readln(expensa);
    end;
  end;
end;

procedure cargarVectorOficinas(var oficinas : arrOficinas; var diml : integer);
var aux : regOficina;
begin
  diml := 0;
  leerDatosOficina(aux);
  while((diml < cantOficinas) and (aux.codigo <> -1)) do begin
    diml := diml + 1;
    oficinas[diml] := aux;
    leerDatosOficina(aux);
  end;
end;

procedure ordenarPorIDCode(var oficinas : arrOficinas; diml : integer);
var
  i, j : integer;
  actual : regOficina;
begin
  for i := 2 to diml do begin
    actual := oficinas[i];
    j := i - 1;
    while( (j > 0) and (oficinas[j].codigo > actual.codigo)) do begin
      oficinas[j + 1] := oficinas[j];
      j := j - 1;
    end;
    oficinas[j + 1] := actual;
  end;
end;

procedure imprimirCodigos(oficinas : arrOficinas; diml : integer);
var i : integer;
begin
  for i := 1 to diml do
    writeln(oficinas[i].codigo);
end;

var
  oficinas : arrOficinas;
  diml : integer;
begin
  cargarVectorOficinas(oficinas, diml);
  writeln('Sin ordenar: ');
  imprimirCodigos(oficinas, diml);
  ordenarPorIDCode(oficinas, diml);
  writeln('Ordenados: ');
  imprimirCodigos(oficinas, diml);
  readln;
end.
