program ejercicio1;
const
  cantGeneros = 8;
type
  rGeneros = 1..cantGeneros;

  regPelicula = record
    codPelicula : integer;
    codGenero : rGeneros;
    puntajePromedio : real;
  end;

  peliculasPtr = ^nodoPelicula;
  nodoPelicula = record
    pelicula : regPelicula;
    sig : peliculasPtr;
  end;

  arrPeliculas = array[rGeneros] of peliculasPtr;

procedure leerPelicula(var pelicula : regPelicula);
begin
  with pelicula do begin
    readln(codPelicula);
    if(codPelicula <> -1) then begin
      readln(codGenero);
      readln(puntajePromedio);
    end;
  end;
end;

function nuevaPelicula(peli : regPelicula): peliculasPtr;
var
  nodo : peliculasPtr;
begin
  new(nodo);
  nodo^.pelicula := peli;
  nodo^.sig := nil;
  nuevaPelicula := nodo;
end;

procedure insertarPorCodigoPelicula(var pelis : peliculasPtr; peli : regPelicula);
var
  nodoPeli, anterior, actual : peliculasPtr;
begin
  nodoPeli := nuevaPelicula(peli);
  actual := pelis;
  while((actual <> nil) and (peli.codPelicula > actual^.pelicula.codPelicula)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = pelis) then
    pelis := nodoPeli
  else
    anterior^.sig := nodoPeli;
  nodoPeli^.sig := actual;
end;

procedure prepararListas(var arrPelis : arrPeliculas);
var
  i : integer;
begin
  for i := 1 to cantGeneros do
    arrPelis[i] := nil;
end;

procedure cargarPeliculas(var arrPelis : arrPeliculas);
var
  peli : regPelicula;
begin
  leerPelicula(peli);
  while(peli.codPelicula <> -1) do begin
    insertarPorCodigoPelicula(arrPelis[peli.codGenero], peli);
    leerPelicula(peli);
  end;
end;

procedure imprimirListas(arrPelis : arrPeliculas);
var
  i : integer;
begin
  for i := 1 to cantGeneros do begin
    writeln('Genero ', i, '): ');
    while(arrPelis[i] <> nil) do begin
      writeln(arrPelis[i]^.pelicula.codPelicula);
      arrPelis[i] := arrPelis[i]^.sig;
    end;
  end;
end;

procedure mergePeliculas(arrPelis : arrPeliculas; nuevaLista : peliculasPtr);
var
  minimo : regPelicula;
begin
  minimo := buscarMinimo(arrPelis);
  while(minimo <> nil) do begin
    insertarPorCodigoPelicula(nuevaLista, minimo);
    minimo := buscarMinimo(arrPelis);
  end;
end;

var
  arrPelis : arrPeliculas;
  listaPeliculasPorCodigo : peliculasPtr;
begin
  prepararListas(arrPelis);
  cargarPeliculas(arrPelis);

  listaPeliculasPorCodigo := nil;
  mergePeliculas(arrPelis, listaPeliculasPorCodigo);
  readln;
end.
