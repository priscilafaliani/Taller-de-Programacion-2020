program ejercicio3;
const
  cantRubros = 6;
  cantRubro3 = 30;
type
  rRubros = 1..cantRubros;
  rCantRubro3 = 1..cantRubro3;

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

  arrProductosRubro3 = array[rCantRubro3] of regProducto;

{ Modulos de carga y ordenamiento de productos }

// Lee un registro producto
procedure cargarProducto(var producto : regProducto);
begin
  randomize();
  writeln('Codigo producto: ');
  producto.codigoProducto := random(101);
  writeln('Codigo rubro: ');
  producto.codigoRubro := random(6) + 1;
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

procedure agregarProducto(var productos : listaPtr; producto : regProducto);
var
  nodo, actual, anterior : listaPtr;
begin
  nodo := crearNodo(producto);

  actual := productos; anterior := productos;
  // Avanza en la lista mientras no haya llegado al final, mientras no haya encontrado el rubro o mientras no haya encontrado la posición en el rubro.
  while((actual <> nil) and (((actual^.datos.codigoRubro <> producto.codigoRubro) and (anterior^.datos.codigoRubro <> producto.codigoRubro)) or
  ((actual^.datos.codigoRubro = producto.codigoRubro) and (producto.codigoProducto > actual^.datos.codigoProducto)))) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = productos) then
    productos := nodo
  else
    anterior^.sig := nodo;
  nodo^.sig := actual;
end;

procedure imprimirProductos(productos : listaPtr);
var actual : rRubros;
begin
  while(productos <> nil) do begin
    actual := productos^.datos.codigoRubro;
    writeln('Rubro: ', actual);
    while((productos <> nil) and (actual = productos^.datos.codigoRubro)) do begin
      writeln('   Producto: ', productos^.datos.codigoProducto);
      productos := productos^.sig;
    end;
  end;
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

procedure crearArregloRubro3(var productosRubro3 : arrProductosRubro3; var diml : integer; productos : listaPtr);
begin
  diml := 0;
  // Busca el rubro 3
  while((productos <> nil) and (productos^.datos.codigoRubro <> 3)) do
    productos := productos^.sig;
  // Guarda hasta 30 productos del rubro 3
  while((productos <> nil) and (productos^.datos.codigoRubro = 3) and (diml < cantRubro3)) do begin
    diml := diml + 1;
    productosRubro3[diml] := productos^.datos;
    productos := productos^.sig;
  end;
  writeln('Dimension: ', diml);
end;

procedure ordenarPorPrecio(var prodRubro3 : arrProductosRubro3; diml : integer);
var
  i, j : integer;
  actual : regProducto;
begin
  for i := 2 to diml do begin
    actual := prodRubro3[i];
    j := i - 1;
    while((j > 0) and (prodRubro3[j].precio > actual.precio)) do begin
      prodRubro3[j + 1] := prodRubro3[j];
      j := j - 1;
    end;
    prodRubro3[j + 1] := actual;
  end;
end;

procedure imprimirVector(productos : arrProductosRubro3; diml : integer);
var i : integer;
begin
  for i := 1 to diml do
    writeln(productos[i].precio:1:2);
end;

var
  productos : listaPtr;
  productosRubro3 : arrProductosRubro3;
  diml : integer;
begin
  productos := nil;
  crearListaProductos(productos);
  writeln('Lista final: ');
  imprimirProductos(productos);
  crearArregloRubro3(productosRubro3, diml, productos);
  writeln('Vector del rubro 3: ');
  imprimirVector(productosRubro3, diml);
  ordenarPorPrecio(productosRubro3, diml);
  writeln('VECTOR ORDENADO: ');
  imprimirVector(productosRubro3, diml);
  readln;
end.
