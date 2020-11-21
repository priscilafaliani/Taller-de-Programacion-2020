program ejercicio3;

type
  rangoAnos = 2010..2018;

  regAuto = record
    patente : integer;
    fabricacion : integer;
    marca : string;
    modelo : string;
  end;

  arbolPtr = ^nodoArbol;

  nodoArbol = record
    data : regAuto;
    left : arbolPtr;
    right : arbolPtr;
  end;

  listaPtr = ^nodoLista;

  nodoLista = record
    data : regAuto;
    sig : listaPtr;
  end;

  arrAutos = array[rangoAnos] of listaPtr;

procedure leerDatosAuto(var auto : regAuto);
begin
  randomize;
  with auto do begin
    writeln('Ingrese ano de fabricacion: ');
    readln(fabricacion);

    if ((fabricacion >= 2010) and (fabricacion <= 2018)) then begin
      patente := random(1000);
      writeln('Patente: ', patente);
      writeln('Marca: ');
      readln(marca);
      writeln('Modelo: ');
      readln(modelo);
    end;
  end;
  writeln;
end;

function crearNodoArbol(auto : regAuto): arbolPtr;
var
  nodo : arbolPtr;
begin
  new(nodo);
  nodo^.data := auto;
  nodo^.left := nil;
  nodo^.right := nil;
  crearNodoArbol := nodo;
end;

procedure guardarAutoEnArbol(var arbol : arbolPtr; auto : regAuto);
begin
  if (arbol = nil) then
    arbol := crearNodoArbol(auto)
  else if (auto.patente > arbol^.data.patente) then
    guardarAutoEnArbol(arbol^.right, auto)
  else if (auto.patente < arbol^.data.patente) then
    guardarAutoEnArbol(arbol^.left, auto);
end;

procedure leerAutos(var arbol : arbolPtr);
var
  auto : regAuto;
begin
  leerDatosAuto(auto);
  while ((auto.fabricacion >= 2010) and (auto.fabricacion <= 2018)) do begin
    guardarAutoEnArbol(arbol, auto);
    leerDatosAuto(auto);
  end;
end;

procedure imprimirDatosAuto(auto : regAuto);
begin
  with auto do begin
    writeln('Patente: ', patente);
    writeln('Fecha de fabricacion: ', fabricacion);
    writeln('Marca: ', marca);
    writeln('Modelo:', modelo);
    writeln;
  end;
end;

procedure enOrden(arbol : arbolPtr);
begin
  if (arbol <> nil) then begin
    enOrden(arbol^.left);
    imprimirDatosAuto(arbol^.data);
    enOrden(arbol^.right);
  end;
end;

procedure cantidadDeAutosDeMarca(arbol : arbolPtr; marca : string; var cantidad : integer);
begin
  if (arbol <> nil) then begin
    if (arbol^.data.marca = marca) then
      cantidad := cantidad + 1;
    cantidadDeAutosDeMarca(arbol^.left, marca, cantidad);
    cantidadDeAutosDeMarca(arbol^.right, marca, cantidad);
  end;
end;

procedure iniciarArreglo(var arreglo : arrAutos);
var i : integer;
begin
  for i := 2010 to 2018 do begin
    arreglo[i] := nil;
  end;
end;

procedure guardarEnlista(var lista : listaPtr; auto : regAuto);
var
  nodo : listaPtr;
begin
  new(nodo);
  nodo^.data := auto;
  nodo^.sig := lista;
  lista := nodo;
end;

procedure guardarAutosPorAnio(var autos : arrAutos; arbolAutos : arbolPtr);
begin
  if (arbolAutos <> nil) then begin
    guardarEnlista(autos[arbolAutos^.data.fabricacion], arbolAutos^.data);
    guardarAutosPorAnio(autos, arbolAutos^.left);
    guardarAutosPorAnio(autos, arbolAutos^.right);
  end;
end;

procedure imprimirAutosAgrupados(autos : arrAutos);
var i : integer;
begin
  for i := 2010 to 2018 do begin
    writeln('Autos del anio ', i);
    while(autos[i] <> nil) do begin
      imprimirDatosAuto(autos[i]^.data);
      autos[i] := autos[i]^.sig;
    end;
  end;
end;

function buscarPatente(arbol : arbolPtr; patente : integer): arbolPtr;
begin
  if (arbol <> nil) then begin
    if (arbol^.data.patente = patente) then
      buscarPatente := arbol
    else if (arbol^.data.patente > patente) then
      buscarPatente := buscarPatente(arbol^.left, patente)
    else if (arbol^.data.patente < patente) then
      buscarPatente := buscarPatente(arbol^.right, patente);
  end
  else
    buscarPatente := nil;
end;

var
  arbolAutos : arbolPtr;
  cantidadDeMarca, patente : integer;
  marca : string;
  autosPorAnio : arrAutos;
  buscado : arbolPtr;
begin
  arbolAutos := nil;
  leerAutos(arbolAutos);
  enOrden(arbolAutos);

  cantidadDeMarca := 0;
  writeln('De que marca de autos quiere buscar la cantidad de autos que hay?');
  readln(marca);
  cantidadDeAutosDeMarca(arbolAutos, marca, cantidadDeMarca);
  writeln('Cantidad de autos de la marca ', marca, ': ', cantidadDeMarca);
  writeln;

  iniciarArreglo(autosPorAnio);
  guardarAutosPorAnio(autosPorAnio, arbolAutos);
  imprimirAutosAgrupados(autosPorAnio);

  writeln('Patente que desea buscar: ');
  readln(patente);

  buscado := buscarPatente(arbolAutos, patente);
  if (buscado <> nil) then
    writeln('Fecha de fabricacion de este auto: ', buscado^.data.fabricacion)
  else
    writeln('No existe');
  readln;
end.
