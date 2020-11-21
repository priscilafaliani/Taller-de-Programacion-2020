program ejercicio2;

const
  cOficinas = 300;

type
  rOficinas = 1..cOficinas;

  regOficina = record
    codigo : integer;
    DNI : integer;
    expensa : real;
  end;

  arrOficinas = array[rOficinas] of regOficina;

{procedure leerOficina(var oficina : regOficina);
begin
  with oficina do begin
    writeln('Codigo de oficina: ');
    readln(codigo);
    if (codigo <> -1) then begin
      writeln('DNI del dueno: ');
      readln(dni);
      writeln('Expensa: ');
      readln(expensa);
    end;
  end;
end;}

procedure leerOficina(var oficina : regOficina);
begin
  randomize;
  with oficina do begin
    writeln('Ingrese codigo: ');
    readln(codigo);
    if (codigo <> -1) then begin
      DNI := random(1000);
      expensa := random(20000) + random();
    end;
  end;
end;

procedure leerOficinas(var oficinas : arrOficinas; var totalOficinas : integer);
var
  oficina : regOficina;
begin
  leerOficina(oficina);
  while ((totalOficinas < cOficinas) and (oficina.codigo <> -1)) do begin
    totalOficinas := totalOficinas + 1;
    oficinas[totalOficinas] := oficina;
    leerOficina(oficina);
  end;
end;

procedure imprimirOficina(oficina : regOficina);
begin
  with oficina do begin
    writeln('Codigo de oficina: ', codigo);
    writeln('DNI del dueno: ', DNI);
    writeln('Expensa: ', expensa:1:2);
    writeln;
  end;
end;

procedure imprimirOficinas(oficinas : arrOficinas; totalOficinas : integer);
var i : integer;
begin
  for i := 1 to totalOficinas do
    imprimirOficina(oficinas[i]);
end;

procedure ordenarOficinas(var oficinas : arrOficinas; totalOficinas : integer);
var
  i, j : integer;
  oficinaActual : regOficina;
begin
  for i := 2 to totalOficinas do begin
    oficinaActual := oficinas[i];
    j := i - 1;
    while ((j > 0) and (oficinaActual.codigo < oficinas[j].codigo)) do begin
      oficinas[j + 1] := oficinas[j];
      j := j - 1;
    end;

    oficinas[j + 1] := oficinaActual;
  end;
end;

{ Retorna la posicion en de la oficina en el vector }
function buscarPropietario(oficinas : arrOficinas; totalOficinas, codigoOficina : integer): integer;
var
  inicio, medio, fin, pos : integer;
begin
  pos := -1;
  inicio := 1;
  fin := totalOficinas;
  medio := (inicio + fin) div 2;
  while ((inicio <= fin) and (oficinas[medio].codigo <> codigoOficina)) do begin
    if (codigoOficina = oficinas[medio].codigo) then
      pos := medio
    else if (codigoOficina < oficinas[medio].codigo) then
      fin := medio - 1
    else
      inicio := medio + 1;
    medio := (inicio + fin) div 2;
  end;

  buscarPropietario := pos;
end;

var
  oficinas : arrOficinas;
  totalOficinas, buscada : integer;
begin
  totalOficinas := 0;
  leerOficinas(oficinas, totalOficinas);
  imprimirOficinas(oficinas, totalOficinas);
  ordenarOficinas(oficinas, totalOficinas);
  imprimirOficinas(oficinas, totalOficinas);

  writeln('Codigo de oficina a buscar: ');
  readln(buscada);

  buscarPropietario(oficinas, totalOficinas, buscada);
  if (buscada <> -1) then
    writeln('DNI del propietario: ', oficinas[buscada].DNI)
  else
    writeln('No se encuentra esa oficina');
    
  readln;
end.
