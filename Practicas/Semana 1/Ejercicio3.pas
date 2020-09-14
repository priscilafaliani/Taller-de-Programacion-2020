program ejercicio3;
const
  cantRubros = 6;
type
  rRubros = 1..cantRubros;

  regProducto = record
    codigoProducto : integer;
    codigoRubro : rRubros;
    precio : real;
  end;

  listaPtr = ^regNodo;
  regNodo = record
    datos : regProducto;
    sig : listaPtr;
  end;

  arrAccesoProductos = array[rRubros] of listaPtr;

{ Modulos de carga y ordenamiento de productos }

// Lee un registro producto
procedure cargarProducto(var producto : regProducto);
begin
  readln(producto.codigoProducto);
  readln(producto.codigoRubro);
  readln(producto.precio);
end;

function crearNodo(producto : regProducto): listaPtr;
var
  nodo : listaPtr;
begin
  new(nodo);
  nodo^.datos := producto;
  nodo^.sig := nil;
  crearNodo := nodo;
end;

procedure agregarProducto(var productos, accesoProductos : listaPtr; producto : regProducto);
var
  nodo, actual, anterior : listaPtr;
begin
  nodo := crearNodo(producto);

  if(productos = nil) then
    productos := nodo
  else begin
    actual := productos;
    // Busca el rubro para agruparlo
    while((actual <> nil) and (nodo^.datos.codigoRubro <> actual^.datos.codigoRubro)) do begin
      anterior := actual;
      actual := actual^.sig;
    end;
    // Inserta ordenado por codigo de producto
  end;
end;

procedure prepararAccesoRapido(var accesoProductos : arrAccesoProductos);
var i : integer;
begin
  for i := 1 to cantRubros do
    accesoProductos[i] := nil;
end;

procedure crearListaProductos(var productos : listaPtr);
var aux : regProducto;
begin
  cargarProducto(aux);
  while(aux.precio <> -1) do begin
    agregarProducto();
    cargarProducto(aux);
  end;
end;

var
  productos : listaPtr;
begin
  productos := nil;
end.
