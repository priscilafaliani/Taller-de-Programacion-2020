program arboles;

type
  arbolPtr = ^regNodo;
  regNodo := record
    dato : integer;
    left : arbolPtr;
    right : arbolPtr;
  end;

function crearNodo(params): integer;
begin

end;

procedure insertar(arbol : arbolPtr);
begin
  if(arbol = nil) then
    arbol := crearNodo()
  else if dato < arbol^.dato then
    insertar(arbol^.left)
  else insertar(arbol^.right);
end;

procedure minimo(params);
begin

end;

function minimo(params): integer;
begin

end;

procedure maximo(params);
begin

end;

function maximo(params): integer;
begin

end;

function buscar(params): integer;
begin

end;

function elementos(params): integer;
begin

end;

procedure preOrden(params);
begin
  
end;

procedure enOrden(params);
begin

end;

procedure postOrden(params);
begin

end;
