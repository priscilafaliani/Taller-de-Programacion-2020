program ejercicio6;
type
  arbolPtr = ^regNodo;
  regNodo = record
    nombre : string;
    left : arbolPtr;
    right : arbolPtr;
  end;

function crearNodo(nombre : string): arbolPtr;
var nodo : arbolPtr;
begin
  new(nodo);
  nodo^.nombre := nombre;
  nodo^.left := nil;
  nodo^.right := nil;
end;

procedure insertar(arbol : arbolPtr; nombre : string);
begin
  if(arbol = nil) then
    arbol := crearNodo(nombre);
  else if dato < arbol^.dato then
    insertar(arbol^.left)
  else insertar(arbol^.right);
end;


begin

end.
