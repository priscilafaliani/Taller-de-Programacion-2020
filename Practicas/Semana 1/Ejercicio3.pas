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

{ Modulos de carga y ordenamiento de productos }

// Lee un registro producto
procedure cargarProducto(var producto : regProducto);
begin
  writeln('Codigo de producto: ');
  readln(producto.codigoProducto);
  writeln('Codigo de rubro: ');
  readln(producto.codigoRubro);
  writeln('Precio: ');
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

procedure buscarRubro(rubro : rRubros; var actual, anterior : listaPtr);
begin
  while((actual <> nil) and (actual^.datos.codigoRubro <> rubro)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
end;

procedure agregarProducto(var productos : listaPtr; producto : regProducto);
var
  nodo, actual, anterior : listaPtr;
begin
  nodo := crearNodo(producto);
  // Busca el rubro para agruparlo y la posición dentro del rubro por codigo de producto
  actual := productos;
  buscarRubro(producto.codigoRubro, actual, anterior);

  while((actual <> nil) and (nodo^.datos.codigoRubro <> actual^.datos.codigoRubro)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;

  while((actual <> nil) and ((nodo^.datos.codigoProducto > actual^.datos.codigoProducto) and (nodo^.datos.codigoRubro = actual^.datos.codigoRubro))) do begin
    anterior := actual;
    actual := actual^.sig;
  end;

  if(actual = productos) then
    productos := nodo
  else
    anterior^.sig := nodo;
  nodo^.sig := actual;
end;

procedure crearListaProductos(var productos : listaPtr);
var aux : regProducto;
begin
  cargarProducto(aux);
  while(aux.precio <> -1) do begin
    agregarProducto(productos, aux);
    cargarProducto(aux);
  end;
end;

procedure imprimirProductosPorRubro(productos : listaPtr);
var actual : rRubros;
begin
  while(productos <> nil) do begin
    actual := productos^.datos.codigoRubro;
    writeln('Rubro ', actual, ': ');
    while((productos <> nil) and (productos^.datos.codigoRubro = actual)) do begin
      writeln('Producto: ', productos^.datos.codigoProducto);
      productos := productos^.sig;
    end;
  end;
end;

procedure imprimir(lista : listaPtr);
begin
  while(lista <> nil) do begin
    writeln('Rubro: ', lista^.datos.codigoRubro);
    writeln('Codigo de prod. ', lista^.datos.codigoProducto);
    lista := lista^.sig;
  end;
end;

var
  productos : listaPtr;
begin
  productos := nil;
  crearListaProductos(productos);
  imprimir(productos);
  imprimirProductosPorRubro(productos);
  readln();
end.
