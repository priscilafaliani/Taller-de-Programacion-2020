program ejercicio2;
const
  cantSucursales = 4;
type
  regFecha = record
    hora : 0..24;
    dia : 1..31;
    mes : 1..12;
    anio : 1900..2020;
  end;

  regVenta = record
    fecha : regFecha;
    codProducto : cardinal;
    codSucursal : 1..cantSucursales;
    cantVendida : cardinal;
  end;

  listaVentasPtr = ^regNodo;
  regNodo = record
    dato : regVenta;
    sig : listaVentasPtr;
  end;

  arrSucursales = array[1..cantSucursales] of listaVentasPtr;

{ Crea una fecha random}
procedure leerFecha(var fecha : regFecha);
begin
  with fecha do begin
    hora := random(25);
    dia := random(31) + 1;
    mes := random(12) + 1;
    anio := 1900 + random(121);
  end;
end;

{ Crea una venta random }
procedure leerVenta(var venta : regVenta);
begin
  with venta do begin
    leerFecha(fecha);
    readln(codProducto);
    codSucursal := random(4) + 1;
    cantVendida := random(20) + 1;
  end;
end;

{ Crea un nodo con un registro de venta }
function crearNodoVenta(venta : regVenta): listaVentasPtr;
var
  nodoVenta : listaVentasPtr;
begin
  new(nodoVenta);
  nodoVenta^.dato := venta;
  nodoVenta^.sig := nil;
  crearNodoVenta := nodoVenta;
end;

{ Pone todas las listas en nil }
procedure prepararListas(var listas : arrSucursales);
var i : integer;
begin
  for i := 1 to cantSucursales do
    listas[i] := nil;
end;

procedure insertarEnLista(var ventas : listaVentasPtr; venta : regVenta);
var
  nodoVenta, anterior, actual : listaVentasPtr;
begin
  nodoVenta := crearNodoVenta(venta);
  actual := ventas;
  while((actual <> nil) and (venta.codProducto > actual^.dato.codProducto)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = ventas) then
    ventas := nodoVenta
  else
    anterior^.sig := nodoVenta;
  nodoVenta^.sig := actual;
end;

{ Lee ventas y las carga agrupadas por sucursal }
procedure leerVentas(var ventaSucursales : arrSucursales);
var venta : regVenta;
begin
  leerVenta(venta);
  while(venta.codProducto <> 0) do begin
    insertarEnLista(ventaSucursales[venta.codSucursal], venta);
    leerVenta(venta);
  end;
end;

{ Imprime el array de ventas }
procedure imprimirVentasArray(ventaSucursales : arrSucursales);
var i : integer;
begin
  for i := 1 to cantSucursales do begin
    WRITELN();
    writeln('SUCURSAL ', i, ': ');
    while(ventaSucursales[i] <> nil) do begin
      writeln('Producto ', ventaSucursales[i]^.dato.codProducto, ' ');
      writeln('Cantidad vendida: ', ventaSucursales[i]^.dato.cantVendida);
      ventaSucursales[i] := ventaSucursales[i]^.sig;
    end;
  end;
  writeln();
end;

{ busca el minimo a insertar}
procedure buscarMinimo(var ventaSucursales : arrSucursales; var minimo : regVenta);
var
  indice, i : integer;
begin
  minimo.codProducto := 32767;
  indice := -1;
  for i := 1 to cantSucursales do begin
    if((ventaSucursales[i] <> nil) and (ventaSucursales[i]^.dato.codProducto < minimo.codProducto)) then begin
      indice := i;
      minimo := ventaSucursales[i]^.dato;
    end;
  end;
  if(indice <> -1) then
    ventaSucursales[indice] := ventaSucursales[indice]^.sig;
end;

{ Merge de las listas de las sucursales, ordenadas por cod de producto }
procedure merge(ventaSucursales : arrSucursales; var listaVentas : listaVentasPtr);

var
  minimo, actual : regVenta;
  totalVendido : integer;
begin
  { realiza el merge }
  buscarMinimo(ventaSucursales, minimo);
  while(minimo.codProducto <> 32767) do begin
    actual := minimo;
    totalVendido := 0;
    while((minimo.codProducto <> 32767) and (actual.codProducto = minimo.codProducto)) do begin
      totalVendido := totalVendido + minimo.cantVendida;
      buscarMinimo(ventaSucursales, minimo);
    end;
    actual.cantVendida := totalVendido;
    insertarEnLista(listaVentas, actual);
  end;
end;

procedure imprimirVentasLista(listaVentas : listaVentasPtr);
begin
  while(listaVentas <> nil) do begin
    writeln;
    writeln('.....DETALLES DE PRODUCTO..... ');
    writeln('Codigo de producto:  ', listaVentas^.dato.codProducto);
    writeln('Cantidad de ventas: ', listaVentas^.dato.cantVendida);
    writeln();
    listaVentas := listaVentas^.sig;
  end;
end;

var
  ventaSucursales : arrSucursales;
  listaVentas : listaVentasPtr;
begin
  randomize;
  prepararListas(ventaSucursales);
  leerVentas(ventaSucursales);
  writeln('VENTAS POR SUCURSAL: ');
  imprimirVentasArray(ventaSucursales);
  merge(ventaSucursales, listaVentas);
  writeln('VENTAS POR CODIGO DE PRODUCTO: ');
  imprimirVentasLista(listaVentas);
  readln;
end.
