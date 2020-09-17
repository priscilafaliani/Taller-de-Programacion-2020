program ejercicio6;

type
  raizPtr = ^regNodo;

  regNodo = record
    data : integer;
    izq : raizPtr
    der : raizPtr;
  end;

function crearNodo(data : integer): raizPtr;
var nodo : raizPtr;
begin
  new(nodo);
  nodo^.data := data;
  nodo^.izq := nil;
  nodo^.der := nil;
  crearNodo := nodo;
end;

procedure insertar(var raiz : raizPtr; data : integer);
begin
  if(raiz = nil) then
    raiz := crearNodo(data);
  else if(data <= raiz^.data) then
    insertar(raiz^.izq, data)
  else
    insertar(raiz^.der, data);
end;
