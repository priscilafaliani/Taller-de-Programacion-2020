program teoria1;

const
  maxParticipantes = 20;
  ultimoCod = -1;
type
  cantParticipantes = 1..maxParticipantes;

  regParticipante = record
    codigo : integer;
    edad : integer;
  end;

  arrParticipantes = array[cantParticipantes] of regParticipante;

  lista = ^regNodo;
  regNodo = record
    data : regParticipante;
    sig : lista;
  end;

procedure leerParticipante(var participante : regParticipante);
begin
  writeln('Codigo: ');
  readln(participante.codigo);
  if(participante.codigo <> ultimoCod) then begin
    writeln('Edad:');
    readln(participante.edad);
  end;
end;

procedure cargarParticipantes(var participantes : arrParticipantes; var diml : integer);
var
  aux : regParticipante;
begin
  diml := 0;
  leerParticipante(aux);
  while((diml < maxParticipantes) and (aux.codigo <> ultimoCod)) do begin
    diml := diml + 1;
    participantes[diml] := aux;
    leerParticipante(aux);
  end;
end;

procedure imprimirContenidosArr(participantes : arrParticipantes; diml : integer);
var i : integer;
begin
  for i := 1 to diml do begin
    writeln(participantes[i].edad);
  end;
end;

procedure eliminarDeArr(var participantes : arrParticipantes; var diml : integer; pos : integer);
var i : integer;
begin
  if((pos >= 1) and (pos <= diml)) then begin
    diml := diml - 1;
    for i := pos to diml do
      participantes[i] := participantes[i + 1];
  end;
end;

procedure eliminarParticipantes20y22(var participantes : arrParticipantes; var diml : integer);
var i : integer;
begin
  i := 1;
  while((i <= diml)) do begin
    if((participantes[i].edad >= 20) and (participantes[i].edad <= 22)) then
      eliminarDeArr(participantes, diml, i)
    else
      i := i + 1;
  end;
end;

procedure ordenarPorEdad(var participantes : arrParticipantes; diml : integer);
var
  i, j : integer;
  actual : regParticipante;
begin
  for i := 2 to diml do begin
    actual := participantes[i];
    j := i - 1;
    while((j > 0) and (participantes[j].edad > actual.edad)) do begin
      participantes[j + 1] := participantes[j];
      j := j - 1;
    end;
    participantes[j + 1] := actual;
  end;
end;

procedure generarLista(participantes : arrParticipantes; diml : integer; var listaParticipantes : lista);
var
  i : integer;
  nodo, aux : lista;
begin
  for i := 1 to diml do begin
    new(nodo);
    nodo^.data := participantes[i];
    nodo^.sig := nil;

    aux := listaParticipantes;
    if(aux = nil) then
      listaParticipantes := nodo

    else begin
      // va hasta al final para insertar
      while(aux^.sig <> nil) do
        aux := aux^.sig;
      aux^.sig := nodo;
    end;
  end;
end;

procedure imprimirLista(listaParticipantes : lista);
begin
  while(listaParticipantes <> nil) do begin
    writeln(listaParticipantes^.data.edad);
    listaParticipantes := listaParticipantes^.sig;
  end;
end;

var
  participantes : arrParticipantes;
  listaParticipantes : lista;
  diml : integer;
begin
  cargarParticipantes(participantes, diml);
  writeln('Recien leidos: ');
  imprimirContenidosArr(participantes, diml);
  ordenarPorEdad(participantes, diml);
  writeln('Ordenados por edad: ');
  imprimirContenidosArr(participantes, diml);
  eliminarParticipantes20y22(participantes, diml);
  writeln('Eliminando gente entre 20 y 22 años: ');
  imprimirContenidosArr(participantes, diml);
  listaParticipantes := nil;
  generarLista(participantes, diml, listaParticipantes);
  writeln('En una lista: ');
  imprimirLista(listaParticipantes);
  readln;
end.
