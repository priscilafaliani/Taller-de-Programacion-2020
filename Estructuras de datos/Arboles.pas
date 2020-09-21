program arboles;

type
  arbolPtr = ^regNodo;
  regNodo := record
    dato : integer;
    left : arbolPtr;
    right : arbolPtr;
  end;

procedure insertar(arbol : arbolPtr);
begin
  if(arbol = nil) then
    arbol := crearNodo()
  else if dato < arbol^.dato then
    insertar(arbol^.left)
  else insertar(arbol^.right);
end;
