program merge;
const
  cantListasImpuestos = 2;
type
{ ESTRUCTURAS DE DATOS }
{ registro de un impuesto }
regImpuesto = record
  nombre : string;
  monto : real;
end;
{ declaracion de una lista de impuestos }
listaImpuestosPtr = ^nodoImpuesto;
nodoImpuesto = record
  impuesto : regImpuesto;
  sig : listaImpuestosPtr;
end;
{ declaracion de un arreglo de listas de impuestos }
arrImpuestos = array[1..cantListasImpuestos] of listaImpuestosPtr;

{ MÓDULOS }
procedure ingresarImpuesto(var impuesto : regImpuesto);
begin
  randomize;
  with impuesto do begin
    writeln('Nombre del impuesto: ');
    readln(nombre);
    monto := random(30000);
  end;
end;

procedure agregarAlfabeticamente(var listaImpuestos : listaImpuestosPtr; impuesto : regImpuesto);
var
  nodo, anterior, actual : listaImpuestosPtr;
begin
  new(nodo);
  nodo^.impuesto := impuesto;
  nodo^.sig := nil;
  actual := listaImpuestos;
  while((actual <> nil) and (actual^.impuesto.nombre < impuesto.nombre)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = listaImpuestos) then
    listaImpuestos := nodo
  else
    anterior^.sig := nodo;
  nodo^.sig := actual;
end;

procedure iniciarListas(var listas : arrImpuestos);
var i : integer;
begin
  for i := 1 to cantListasImpuestos do
    listas[i] := nil;
end;

procedure cargarImpuestos(var impuestos : arrImpuestos);
var
  i, j : integer;
  impuesto : regImpuesto;
begin
  for i := 1 to cantListasImpuestos do begin
    for j := 1 to 2 do begin
      ingresarImpuesto(impuesto);
      agregarAlfabeticamente(impuestos[i], impuesto);
    end;
  end;
end;

procedure imprimirImpuestos(impuestos : arrImpuestos);
var i : integer;
begin
  for i := 1 to cantListasImpuestos do begin
    writeln('Lista ', i, ': ');
    while(impuestos[i] <> nil) do begin
      writeln('Impuesto ', impuestos[i]^.impuesto.nombre);
      writeln('Monto: ', impuestos[i]^.impuesto.monto:1:2);
      impuestos[i] := impuestos[i]^.sig;
    end;
    writeln;
  end;
end;

procedure impuestoMinimo(var impuestos : arrImpuestos; var impuestoMin : regImpuesto);
var
  i, indice : integer;
begin
  impuestoMin.nombre := 'zzz';
  indice := -1;
  for i := 1 to cantListasImpuestos do begin
    if(impuestos[i] <> nil) then begin
      if(impuestos[i]^.impuesto.nombre <= impuestoMin.nombre) then begin
        indice := i;
        impuestoMin := impuestos[i]^.impuesto;
      end;
    end;
  end;
  if(indice <> -1) then begin
    impuestos[indice] := impuestos[indice]^.sig;
  end;
end;

procedure mergeImpuestos(impuestos : arrImpuestos; var listaTotales : listaImpuestosPtr);
var
  actual, impuesto : regImpuesto;
  total : real;
begin
  impuestoMinimo(impuestos, impuesto);
  while(impuesto.nombre <> 'zzz') do begin
    actual := impuesto;
    total := 0;
    while((impuesto.nombre <> 'zzz') and (impuesto.nombre = actual.nombre)) do begin
      total := total + impuesto.monto;
      impuestoMinimo(impuestos, impuesto);
    end;
    actual.monto := total;
    agregarAlfabeticamente(listaTotales, actual);
  end;
end;

procedure imprimirListaImpuestos(impuestos : listaImpuestosPtr);
begin
  while(impuestos <> nil) do begin
    writeln('Impuesto ', impuestos^.impuesto.nombre);
    writeln('Monto: ', impuestos^.impuesto.monto:1:2);
    impuestos := impuestos^.sig;
  end;
end;

{ PROGRAMA PRINCIPAL }
var
  impuestos : arrImpuestos;
  listaTotales : listaImpuestosPtr;
begin
  listaTotales := nil;
  iniciarListas(impuestos);
  cargarImpuestos(impuestos);
  writeln('Listas individuales: ');
  imprimirImpuestos(impuestos);
  writeln;
  writeln('Listas unidas: ');
  mergeImpuestos(impuestos, listaTotales);
  imprimirListaImpuestos(listaTotales);
  readln;
end.
