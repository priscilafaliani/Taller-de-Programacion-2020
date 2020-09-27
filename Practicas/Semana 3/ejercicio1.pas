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
    codPelicula := random(20);
    if(codPelicula <> -1) then begin
      codGenero := random(cantGeneros) + 1;
      puntajePromedio := random(10) + 1;
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
  while(peli.codPelicula <> 0) do begin
    insertarPorCodigoPelicula(arrPelis[peli.codGenero], peli);
    leerPelicula(peli);
  end;
end;

procedure imprimirLista(lista : peliculasPtr);
begin
  while(lista <> nil) do begin
    writeln(lista^.pelicula.codPelicula);
    lista := lista^.sig;
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

procedure buscarMinimo(var arrPelis : arrPeliculas; var minimo : regPelicula);
var i, indice : integer;
begin
  minimo.codPelicula := 32767;
  indice := -1;
  for i := 1 to cantGeneros do
    if((arrPelis[i] <> nil) and (arrPelis[i]^.pelicula.codPelicula < minimo.codPelicula)) then begin
      minimo := arrPelis[i]^.pelicula;
      indice := i;
    end;
  if(indice <> -1) then
    arrPelis[indice] := arrPelis[indice]^.sig;
end;

procedure mergePeliculas(arrPelis : arrPeliculas; var nuevaLista : peliculasPtr);
var
  minimo : regPelicula;
begin
  buscarMinimo(arrPelis, minimo);
  while(minimo.codPelicula <> 32767) do begin
    insertarPorCodigoPelicula(nuevaLista, minimo);
    buscarMinimo(arrPelis, minimo);
  end;
end;

var
  arrPelis : arrPeliculas;
  listaPeliculasPorCodigo : peliculasPtr;
begin
  randomize();
  prepararListas(arrPelis);
  cargarPeliculas(arrPelis);
  writeln('LISTAS: ');
  imprimirListas(arrPelis);

  listaPeliculasPorCodigo := nil;
  mergePeliculas(arrPelis, listaPeliculasPorCodigo);
  writeln('LISTA UNICA: ');
  imprimirLista(listaPeliculasPorCodigo);
  readln;
end.
