program ejercicio2;
const
  cantIntegrantes = 4;
type
  rIntegrantes = 1..cantIntegrantes;

  regImpuesto = record
    impuesto : string;
    monto : real;
  end;;

  listaPtrGastos = ^regNodo;
  regNodo = record
    dato : regImpuesto;
    sig : listaPtrGastos;
  end;

  arrGastosFamilia = array[rIntegrantes] of listaPtrGastos;

procedure leerImpuesto(params);
begin

end;

procedure agregarALista(params);
begin

end;

procedure cargarImpuestos(params);
begin

end;

procedure imprimirImpuestos(params);
begin

end;

procedure mergeGastos(params);
begin

end;
