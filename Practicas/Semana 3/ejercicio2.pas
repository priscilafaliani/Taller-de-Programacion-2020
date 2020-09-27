program ejercicio2;
const
  cantSucursales = 4;
type
  regVenta = record
    fecha : regFecha;
    codProducto : integer;
    codSucursal : 1..cantSucursales;
    cantVendida : integer;
  end;

  listaVentas = ^regNodo;
  regNodo = record
    dato : regVenta;
    sig : listaVentas;
  end;

  arrSucursales = array[1..cantSucursales] of listaVentas;
