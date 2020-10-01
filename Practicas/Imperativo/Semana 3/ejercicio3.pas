program ejercicio3;
{ * --------- EJERCICIO 13. PRÁCTICA PROGRAMACIÓN IMPERATIVA --------- *
*
* Un teatro tiene funciones los días de la semana. Para cada día se tiene
* una lista con las entradas vendidas. Se desea procesar la información de
* una semana.
*
* Implementar un programa que:
* a) Genere 7 listas con las entradas vendidas cada día.
*   - De cada entrada se lee: día (de 1 a 7), codigo de obra, asiento y monto.
*   - Las listas deben estar ordenadas por código de obra, de forma ascendente.
*   - La lectura finaliza cuando se ingresa el código de obra 0.
* b) Genere una nueva lista que totalice la cantidad de entradas vendidas
* por obra.
*   - Esta lista debe estar ordenada por codigo de obra, de forma ascendente.
}
const
  diasSemana = 7;
  mergeStop = 32767;
type
  rangoSemana = 1..diasSemana;

  { Datos de una entrada }
  regEntrada = record
    dia : rangoSemana;
    codObra : integer;
    asiento : integer;
    monto : real;
  end;

  { Lista de entradas vendidas }
  entradasPtr = ^nodoEntrada;
  nodoEntrada = record
    entrada : regEntrada;
    sig : entradasPtr;
  end;

  { Entradas vendidas por día }
  arrVentas7Dias = array[rangoSemana] of entradasPtr;

  { Registros de la cantidad de ventas por obra}
  regVentasObra = record
    codObra : integer;
    ventas : integer;
  end;

  { Lista del total de ventas por obra }
  ventasPtr = ^nodoVentas;
  nodoVentas = record
    ventas : regVentasObra;
    sig : ventasPtr;
  end;

{ ---------- MÓDULOS GENERALES ---------- }

{ Setea todas las listas en nil }
procedure inicializarVector(var ventas : arrVentas7Dias);
var i : integer;
begin
  for i := 1 to diasSemana do
    ventas[i] := nil;
end;

{ Retorna un nodo para agregar en lista }
function crearNodoEntrada(entrada : regEntrada): entradasPtr;
var aux : entradasPtr;
begin
  new(aux);
  aux^.entrada := entrada;
  aux^.sig := nil;
  crearNodoEntrada := aux;
end;

{ ---------- MÓDULOS DE LECTURA Y CARGA DE DATOS ----------}

{ Genera una entrada }
procedure leerEntrada(var entrada : regEntrada);
begin
  with entrada do begin
    codObra := random(10) + 1;
    {if(codObra <> 0) then begin}
    dia := random(diasSemana) + 1;
    asiento := random(300) + 1;
    { Las entradas cuestan al menos 200 + random() devuelve una parte decimal }
    monto := random(400) + random() + 200;
    {end;}
  end;
end;

{ Inserta en una lista, ordenado por codigo de entrada (menor a mayor) }
procedure agregarALista(var lista : entradasPtr; entrada : regEntrada);
var aux, anterior, actual : entradasPtr;
begin
  aux := crearNodoEntrada(entrada);
  actual := lista;
  while((actual <> nil) and (entrada.codObra > actual^.entrada.codObra)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = lista) then
    lista := aux
  else
    anterior^.sig := aux;
  aux^.sig := actual;
end;

{ Carga entradas en listas según el día en que se vendieron }
procedure cargarEntradas(var ventas : arrVentas7Dias);
var
  i : integer;
  entrada : regEntrada;
begin
  inicializarVector(ventas);
  leerEntrada(entrada);
  {while(entrada.codObra <> 0) do begin
    agregarALista(ventas[entrada.dia], entrada);
    leerEntrada(entrada);
  end;}
  for i := 1 to 20 do begin
    leerEntrada(entrada);
    agregarALista(ventas[entrada.dia], entrada);
  end;
end;

{ ---------- MÓDULOS DE IMPRESIÓN ---------- }

{ Imprime una lista de entradas }
procedure imprimirLista(lista : entradasPtr);
begin
  while(lista <> nil) do begin
    with lista^.entrada do
      writeln('Entrada de la obra: ', codObra, '. Costo: $', monto:1:2, '. Asiento: ', asiento, '.');
    lista := lista^.sig;
  end;
end;

{ Imprime las listas de ventas de la semana }
procedure imprimirListas(entradas : arrVentas7Dias);
var i : integer;
begin
  for i := 1 to diasSemana do begin
    if(entradas[i] <> nil) then begin
      writeln('VENTAS DEL DIA ', i, ': ');
      imprimirLista(entradas[i]);
      writeln('------------------------------------------------------');
    end;
  end;
  writeln;
end;

{ Imprime la lista luego del merge}
procedure imprimirLista(lista : ventasPtr);
begin
  writeln('---------- CANTIDAD DE ENTRADAS VENDIDAS POR CODIGO DE OBRA ----------');
  while(lista <> nil) do begin
    writeln('* Ventas de la obra ', lista^.ventas.codObra, ': ', lista^.ventas.ventas);
    lista := lista^.sig;
  end;
end;

{ ---------- IMPLEMENTACIÓN DEL MERGE ---------- }
procedure agregarAtras(var lista, ult : ventasPtr; ventas : regVentasObra);
var aux : ventasPtr;
begin
  new(aux);
  aux^.ventas := ventas;
  aux^.sig := nil;
  if(lista = nil) then
    lista := aux
  else
    ult^.sig := aux;
  ult := aux;
end;

procedure obtenerMinimo(var ventas : arrVentas7Dias; var minimo : regEntrada);
var
  i, indiceMin : integer;
begin
  minimo.codObra := mergeStop;
  for i := 1 to diasSemana do
    if((ventas[i] <> nil) and (ventas[i]^.entrada.codObra < minimo.codObra )) then begin
      minimo := ventas[i]^.entrada;
      indiceMin := i;
    end;
    if(minimo.codObra <> mergeStop) then
      ventas[indiceMin] := ventas[indiceMin]^.sig;
end;

procedure obtenerVentasPorObra(ventas : arrVentas7Dias; var ventasPorObra : ventasPtr);
var
  minimo : regEntrada;
  actual : regVentasObra;
  ult : ventasPtr;
begin
  ventasPorObra := nil; ult := nil;
  obtenerMinimo(ventas, minimo);
  while(minimo.codObra <> mergeStop) do begin
    actual.codObra := minimo.codObra;
    actual.ventas := 0;
    while((minimo.codObra <> mergeStop) and (minimo.codObra = actual.codObra)) do begin
      actual.ventas := actual.ventas + 1;
      obtenerMinimo(ventas, minimo);
    end;
    agregarAtras(ventasPorObra, ult, actual);
  end;
end;

{ ---------- PROGRAMA PRINCIPAL ---------- }
var
  ventas : arrVentas7Dias;
  ventasPorObra : ventasPtr;
begin
  randomize;
  cargarEntradas(ventas);
  imprimirListas(ventas);
  obtenerVentasPorObra(ventas, ventasPorObra);
  imprimirLista(ventasPorObra);
  readln;
end.
