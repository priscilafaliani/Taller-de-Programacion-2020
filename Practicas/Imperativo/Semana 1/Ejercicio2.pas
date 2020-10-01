program ejercicio2;
const
  cantGeneros = 8;
type
  srGeneros = 1..cantGeneros;

  regPelicula = record
    codigoPelicula : integer;
    codigoGenero : srGeneros;
    puntajePromedio : real;
  end;

  listaPtr = ^regNodo;
  regNodo = record
    data : regPelicula;
    sig : listaPtr;
  end;

  // Arreglo de listas de peliculas por genero
  arrPeliculas = array[srGeneros] of listaPtr;

  // Para guardar el codigo de pelicula del genero con mayor puntaje promedio
  arrMayorPromedio = array[srGeneros] of regPelicula;

procedure leerDatosPelicula(var pelicula : regPelicula);
begin
  with pelicula do begin
    readln(codigoPelicula);
    if(codigoPelicula <> -1) then begin
      readln(codigoGenero);
      readln(puntajePromedio);
    end;
  end;
end;

procedure agregarAlFinal(var listaGenero : listaPtr; pelicula : regPelicula);
var
  nodo, aux : listaPtr;
begin
  new(nodo);
  nodo^.data := pelicula;
  nodo^.sig := nil;

  if(listaGenero = nil) then
    listaGenero := nodo
  else begin
    aux := listaGenero;
    while(aux^.sig <> nil) do
      aux := aux^.sig;
    aux^.sig := nodo;
  end;
end;

procedure iniciarArrayDeListas(var peliculas : arrPeliculas);
var i : integer;
begin
  for i := 1 to cantGeneros do
    peliculas[i] := nil;
end;

procedure cargarPeliculas(var peliculas : arrPeliculas);
var
  aux : regPelicula;
begin
  iniciarArrayDeListas(peliculas);
  leerDatosPelicula(aux);
  while((aux.codigoPelicula <> -1)) do begin
    agregarAlFinal(peliculas[aux.codigoPelicula], aux);
    leerDatosPelicula(aux);
  end;
end;

procedure obtenerPeliculaDeMayorPromedioPorGenero(peliculas : arrPeliculas; var mayorPromedio : arrMayorPromedio);
var
  i : integer;
  peliculaMax : regPelicula;
  max : real;
begin
  for i := 1 to cantGeneros do begin
    max := -32767;
    while(peliculas[i] <> nil) do begin
      if(peliculas[i]^.data.puntajePromedio > max) then begin
        max := peliculas[i]^.data.puntajePromedio;
        peliculaMax := peliculas[i]^.data;
      end;
      peliculas[i] := peliculas[i]^.sig;
    end;
    mayorPromedio[i] := peliculaMax;
  end;
end;

procedure ordenarPorPuntajes(var mayorPromedio : arrMayorPromedio; peliculas : arrPeliculas);
var
  i, j : integer;
  actual : regPelicula;
begin
  for i := 2 to cantGeneros do begin
    actual := mayorPromedio[i];
    j := i - 1;
    while((j > 0) and (mayorPromedio[j].puntajePromedio > actual.puntajePromedio)) do begin
      mayorPromedio[j + 1] := mayorPromedio[j];
      j := j - 1;
    end;
    mayorPromedio[j + 1] := actual;
  end;
end;

procedure mostrarMayorYMenorPuntaje(mayorPromedio : arrMayorPromedio);
begin
  writeln('Pelicula con mayor puntaje promedio: ');
  writeln(mayorPromedio[1].codigoPelicula);
  writeln('Película con menor puntaje promedio: ');
  writeln(mayorPromedio[cantGeneros].codigoPelicula);
end;
