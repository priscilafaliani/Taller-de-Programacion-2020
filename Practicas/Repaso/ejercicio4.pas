program sistemaPremios;
type

  regCliente = record
    codigo : integer;
    dni : integer;
    puntos : integer;
  end;

  arbolPtr = ^nodoArbol;

  nodoArbol = record
    dato : regCliente;
    right : arbolPtr;
    left : arbolPtr
  end;

procedure leerRegistro(var cliente : regCliente);
begin
  randomize;
  with cliente do begin
    dni := random(4);
    writeln('DNI -> ', dni);
    if (codigo <> 0) then begin
      codigo := random(5000);
      writeln('Codigo de cliente -> ', codigo);
      puntos := random(10000);
      writeln('Puntos acumulados -> ', puntos);
    end;
  end;
end;

function hacerNodo(cliente : regCliente): arbolPtr;
var miNodo : arbolPtr;
begin
  new(miNodo);
  miNodo^.dato := cliente;
  miNodo^.left := nil;
  miNodo^.right := nil;
  hacerNodo := miNodo;
end;

procedure insertar(var arbol : arbolPtr; cliente : regCliente);
begin
  if (arbol = nil) then
    arbol := hacerNodo(cliente)
  else if (cliente.codigo > arbol^.dato.codigo) then
    insertar(arbol^.right, cliente)
  else if (cliente.codigo < arbol^.dato.codigo) then
    insertar(arbol^.left, cliente);
end;

procedure cargarLista(var arbol : arbolPtr);
var
  cliente : regCliente;
begin
  leerRegistro(cliente);
  while (cliente.dni <> 0) do begin
    insertar(arbol, cliente);
    leerRegistro(cliente);
  end;
end;

procedure actualizarCliente(arbol : arbolPtr; codigo, puntos : integer);
begin
  if (arbol <> nil) then begin
    if (arbol^.dato.codigo = codigo) then begin
      arbol^.dato.puntos := arbol^.dato.puntos + puntos;
      writeln('¡Puntos actualizados!')
    end
    else if (codigo < arbol^.dato.codigo) then
      actualizarCliente(arbol^.left, codigo, puntos)
    else if (codigo > arbol^.dato.codigo) then
      actualizarCliente(arbol^.right, codigo, puntos);
  end
  else writeln('¡Ese cliente no existe!');
end;

procedure informar(codigo : integer);
begin
  writeln('El cliente de codigo ', codigo, ' cumple con el rango de puntos');
end;

procedure buscarEnRango(arbol : arbolPtr; inf, sup : integer);
begin
  if (arbol <> nil) then begin
    if ((arbol^.dato.puntos >= inf) and (arbol^.dato.puntos <= sup)) then begin
      informar(arbol^.dato.codigo);
    end
    else
      buscarEnRango(arbol^.left, inf, sup);
      buscarEnRango(arbol^.right, inf, sup);
  end
end;

procedure imprimir(arbol : arbolPtr);
begin
  if (arbol <> nil) then begin
    imprimir(arbol^.left);
    writeln('---- Cliente con codigo -> ', arbol^.dato.codigo);
    writeln('---- Dni -> ', arbol^.dato.dni);
    writeln('---- Puntos -> ', arbol^.dato.puntos);
    writeln;
    imprimir(arbol^.right);
  end;
end;

var
  clientes : arbolPtr;
  codigo, puntos, inf, sup : integer;
begin
  clientes := nil;
  cargarLista(clientes);
  writeln('Lista cargada: ');
  imprimir(clientes);

  writeln('Codigo de cliente para actualizar puntos: ');
  readln(codigo);
  writeln('Puntos a anadir: ');
  readln(puntos);
  actualizarCliente(clientes, codigo, puntos);

  writeln('Lista actualizada: ');
  imprimir(clientes);

  writeln('Rango inferior de puntos para buscar clientes que lo cumplen: ');
  readln(inf);
  writeln('Rango superior de puntos para buscar clientes que lo cumplen:');
  readln(sup);
  writeln;
  buscarEnRango(clientes, inf, sup);
  writeln;
  writeln('Fin de busqueda');
  readln;
end.
