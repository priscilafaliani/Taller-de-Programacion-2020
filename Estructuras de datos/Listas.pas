procedure agregarAdelante(var lista : listaPtr; num : integer);
var nodo : listaPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.sig := lista;
  lista := nodo;
end;

procedure agregarAtras(var lista : listaPtr; num : integer);
var nodo, aux : listaPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.sig := nil;
  if(lista = nil) then
    lista := nodo
  else begin
    aux := lista;
    while(aux^.sig <> nil) do
      aux := aux^.sig;
    aux^.sig := nodo;
  end;
end;

procedure agregarAtras(var lista, ult : listaPtr; num : integer);
var nodo : listaPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.sig := nil;
  if(lista = nil) then
    lista := nodo
  else
    ult^.sig := nodo;
  ult := nodo;
end;

procedure insertar(var lista : listaPtr; num : integer);
var nodo, actual, anterior : listaPtr;
begin
  new(nodo);
  nodo^.num := num;
  nodo^.sig := nil;
  actual := lista;
  while((actual <> nil) and (lista^.num < num)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = lista) then
    lista := nodo
  else
    anterior^.sig := nodo;
  nodo^.sig := actual;
end;

procedure buscar(params);
begin

end;

procedure eliminar(var lista : listaPtr; num : integer);
var
  anterior, actual : listaPtr;
begin
  actual := lista;
  while((actual <> nil) and (actual^.num <> num)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual <> nil) then begin
    if(actual = lista) then
      lista := lista^.sig
    else
      anterior^.sig := actual^.sig;
    dispose(actual);
  end;
end;
