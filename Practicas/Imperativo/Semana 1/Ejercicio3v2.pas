program ejercicio3;
const
  cantRubros = 6;
  cantRubroTres = 30;
  productosDeRubro = 3;
type
  // Subrango de cada tipo de rubro
  rRubros = 1..cantRubros;
  // Subrango de productos deseados del rubro 3
  rRubrosTres = 1..cantRubroTres;

  // Registro de un producto
  regProducto = record
    codProducto : integer;
    codRubro : rRubros;
    precio : real;
  end;

  // Estructura de datos lista para productos
  listaPtr = ^regNodo;
  regNodo = record
    data : regProducto;
    sig : listaPtr;
  end;

  // Estructura de una lista de productos agrupadas por rubros
  arrListaProductos = array[rRubros] of listaPtr;

  // Estructura para una cantidad x de productos del rubro 3
  arrRubroTres = array[rRubrosTres] of regProducto;

// Lectura de un registro de producto
// En realidad, "genera" un producto utilizando la función random.
procedure leerProducto(var producto : regProducto);
begin
  with producto do begin
    codProducto := random(200) + 1;
    codRubro := random(6) + 1;
    writeln('Precio del producto: ');
    readln(precio);
  end;
end;

// Creacion de las listas de productos
procedure crearListas(var listaProductos : arrListaProductos);
var
  i : integer;
begin
  for i := 1 to cantRubros do
    listaProductos[i] := nil;
end;

// Crea y retorna la direccion de un nodo con la informacion de un producto
function crearNodo(producto : regProducto): listaPtr;
var
  nodo : listaPtr;
begin
  new(nodo);
  nodo^.data := producto;
  nodo^.sig := nil;
  crearNodo := nodo;
end;

// Inserta un producto ordenado por su código de producto
procedure insertarEnRubro(var listaRubro : listaPtr; producto : regProducto);
var
  nuevoProd, anterior, actual : listaPtr;
begin
  nuevoProd := crearNodo(producto);
  actual := listaRubro;
  while((actual <> nil) and (actual^.data.codProducto < producto.codProducto)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = listaRubro) then
    listaRubro := nuevoProd
  else
    anterior^.sig := nuevoProd;
  nuevoProd^.sig := actual;
end;

// Lectura y agregado de productos en la lista, hasta que se lee el precio -1
procedure leerProductos(var listaProductos : arrListaProductos);
var
  temp : regProducto;
begin
  leerProducto(temp);
  while(temp.precio <> -1) do begin
    insertarEnRubro(listaProductos[temp.codRubro], temp);
    leerProducto(temp);
  end;
end;

// Crea las listas (inicializa en nil), carga los productos.
procedure cargarProductos(var listaProductos : arrListaProductos);
begin
  crearListas(listaProductos);
  leerProductos(listaProductos);
end;

// Muestra los codigos de todos los productos, por rubro
procedure mostrarCodigosProductos(listaProductos : arrListaProductos);
var
  i : integer;
begin
  for i := 1 to cantRubros do begin
    writeln('RUBRO ', i, ') ');
    while(listaProductos[i] <> nil) do begin
      writeln('Codigo de producto: ', listaProductos[i]^.data.codProducto);
      listaProductos[i] := listaProductos[i]^.sig;
    end;
  end;
end;

// Genera un vector de productos del rubro productosDeRubro
procedure generarVectorDeProductos(var ProdsRubro : arrRubroTres; var cantProd : integer; listaProductos : arrListaProductos);
begin
  cantProd := 0;
  while(listaProductos[productosDeRubro] <> nil) do begin
    cantProd := cantProd + 1;
    ProdsRubro[cantProd] := listaProductos[productosDeRubro]^.data;
    listaProductos[productosDeRubro] := listaProductos[productosDeRubro]^.sig;
  end;
end;

// Ordenamiento por insercion
procedure ordenamientoPorInsercion(var ProdsRubro : arrRubroTres; cantProd : integer);
var
  i, j : integer;
  actual : regProducto;
begin
  for i := 2 to cantProd do begin
    actual := ProdsRubro[i];
    j := i - 1;
    while((j > 0) and (actual.precio < ProdsRubro[j].precio)) do begin
      ProdsRubro[j + 1] := ProdsRubro[j];
      j := j - 1;
    end;
    ProdsRubro[j + 1] := actual;
  end;
end;

// Imprime los precios del vector de rubro 3
procedure imprimirVector(ProdsRubro : arrRubroTres; cantProd : integer);
var
  i : integer;
begin
  for i := 1 to cantProd do
    writeln('Producto ', i, ') ', ProdsRubro[i].precio:1:2);
end;

var
  listaProductos : arrListaProductos;
  ProdsRubro : arrRubroTres;
  cantProd : integer;
begin
  cargarProductos(listaProductos);
  mostrarCodigosProductos(listaProductos);
  writeln('Generando vector del rubro 3...');
  generarVectorDeProductos(ProdsRubro, cantProd, listaProductos);
  imprimirVector(ProdsRubro, cantProd);
  writeln('Precios ordenados: ');
  ordenamientoPorInsercion(ProdsRubro, cantProd);
  imprimirVector(ProdsRubro, cantProd);
  readln;
end.
