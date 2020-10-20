program arboles;

type
  arbolPtr = ^regNodo;
  regNodo := record
    dato : integer;
    left : arbolPtr;
    right : arbolPtr;
  end;

function crearNodo(params): arbolPtr;
begin

end;

procedure insertar(var arbol : arbolPtr);
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

function minimo(arbol : arbolPtr): integer;
begin
  if(arbol = nil)
    minimo := 32767
  else begin
    if(arbol^.left <> nil) then
      minimo(arbol^.left)
    else
      minimo := arbol^.dato;
  end;
end;

procedure maximo(arbol : arbolPtr);
begin

end;

function maximo(arbol : arbolPtr): integer;
begin
  if(arbol = nil)
    maximo := -32767
  else begin
    if(arbol^.right <> nil) then
      maximo(arbol^.right)
    else
      maximo := arbol^.dato;
  end;
end;

function buscar(params): integer;
begin

end;

function elementos(params): integer;
begin

end;

{ no imprime en ningun orden }
procedure preOrden(arbol : arbolPtr);
begin
  if(arbol <> nil) then begin
    writeln(arbol^.dato);
    preOrden(arbol^.left);
    preOrden(arbol^.right);
  end;
end;

{ imprime de menor a mayor }
procedure enOrden(arbol : arbolPtr);
begin
  if(arbol <> nil) then begin
    enOrden(arbol^.left);
    writeln(arbol^.dato);
    enOrden(arbol^.right);
  end;
end;

{ imprime de mayor a menor }
procedure posOrden(params);
begin
  if(arbol <> nil) then begin
    posOrden(arbol^.right);
    writeln(arbol^.data);
    posOrden(arbol^.left);
  end;
end;
