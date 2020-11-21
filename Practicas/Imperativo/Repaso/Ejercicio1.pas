program ejercicio1;

type
  dias = 1..7;

  regEntrada = record
    dia : dias;
    codigo : integer;
    asiento : integer;
    monto : real;
  end;

  regObra = record
    codigo : integer;
    totalVentas : integer;
  end;

  listaEntradasPtr = ^nodoEntrada;

  nodoEntrada = record
    dato : regEntrada;
    sig : listaEntradasPtr;
  end;

  arrFunciones = array[dias] of listaEntradasPtr;

  listaObrasPtr = ^nodoObra;

  nodoObra = record
    dato : regObra;
    sig : listaObrasPtr;
  end;

procedure leerEntrada(var entrada : regEntrada);
begin
  with entrada do begin
    writeln('Codigo de la obra: ');
    readln(codigo);
    if (codigo <> 0) then begin
      writeln('Dia de la obra: ');
      readln(dia);
      writeln('Asiento: ');
      readln(asiento);
      writeln('Monto: ');
      readln(monto);
    end;
  end;
end;

function crearNodo(entrada : regEntrada): listaEntradasPtr;
var
  nodo : listaEntradasPtr;
begin
  new(nodo);
  nodo^.dato := entrada;
  nodo^.sig := nil;
  crearNodo := nodo;
end;

procedure guardarEntrada(var entradas : listaEntradasPtr; entrada : regEntrada);
var
  nodo, actual, anterior : listaEntradasPtr;
begin
  nodo := crearNodo(entrada);

  actual := entradas;
  while ((actual <> nil) and (entrada.codigo > actual^.dato.codigo)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;

  if (actual = entradas) then
    entradas := nodo
  else
    anterior^.sig := nodo;
  nodo^.sig := actual;
end;

procedure iniciarListas(var listas : arrFunciones);
var i : integer;
begin
  for i := 1 to 7 do
    listas[i] := nil;
end;

procedure leerEntradas(var listas : arrFunciones);
var
  entrada : regEntrada;
begin
  leerEntrada(entrada);
  while (entrada.codigo <> 0) do begin
    guardarEntrada(listas[entrada.dia], entrada);
    leerEntrada(entrada);
  end;
end;

function crearNodoObra(obra : regObra): listaObrasPtr;
var nodo : listaObrasPtr;
begin
  new(nodo);
  nodo^.dato := obra;
  nodo^.sig := nil;
  crearNodoObra := nodo;
end;

procedure guardarAlFinal(var lista, ult : listaObrasPtr; obra : regObra);
var
  nodo : listaObrasPtr;
begin
  nodo := crearNodoObra(obra);

  if (lista = nil) then
    lista := nodo
  else
    ult^.sig := nodo;
  ult := nodo;
end;

procedure obtenerMinimo(var listas : arrFunciones; var entrada : regEntrada);
var
  i, indiceMin : integer;
begin
  indiceMin := -1;
  entrada.codigo := 32767;
  for i := 1 to 7 do begin
      if ((listas[i] <> nil) and (listas[i]^.dato.codigo <= entrada.codigo)) then begin
        entrada := listas[i]^.dato;
        indiceMin := i;
      end;
  end;

  if (indiceMin <> -1) then
    listas[indiceMin] := listas[indiceMin]^.sig;
end;

procedure totalizarVentas(listas : arrFunciones; var totalizadas : listaObrasPtr);
var
  codigoActual, totalActual : integer;
  entrada : regEntrada;
  ult : listaObrasPtr;
  detallesObra : regObra;
begin
  totalizadas := nil;
  ult := nil;

  obtenerMinimo(listas, entrada);
  while (entrada.codigo <> 32767) do begin
    totalActual := 0;
    codigoActual := entrada.codigo;

    while ((entrada.codigo <> -32767) and (codigoActual = entrada.codigo)) do begin
      totalActual := totalActual + 1;
      obtenerMinimo(listas, entrada);
    end;

    detallesObra.totalVentas := totalActual;
    detallesObra.codigo := codigoActual;
    guardarAlFinal(totalizadas, ult, detallesObra);
  end;
end;

procedure imprimirDatosObra(var obra : regObra);
begin
  writeln('Codigo de obra: ', obra.codigo);
  writeln('Ventas: ', obra.totalVentas);
  writeln;
end;

procedure imprimirLista(var lista : listaObrasPtr);
begin
  if (lista <> nil) then begin
    imprimirDatosObra(lista^.dato);
    imprimirLista(lista^.sig);
  end;
end;

var
  funciones : arrFunciones;
  totalVentasPorObra : listaObrasPtr;
begin
  iniciarListas(funciones);
  leerEntradas(funciones);
  totalizarVentas(funciones, totalVentasPorObra);
  imprimirLista(totalVentasPorObra);
  readln;
end.
