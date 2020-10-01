program actividad1;
type
  cliente = record
    dni : integer;
    apeynom : string;
    categoria : integer;
  end;

  lista = ^nodo;
  nodo = record
    dato : cliente;
    sig : lista;
  end;

  arbol = ^nodoA;
  nodoA = record
    dato : cliente;
    HI : arbol;
    HD : arbol;
  end;

procedure leerCliente(var cli : cliente);
begin
  readln(cli.apeynom);
  readln(cli.dni);
  readln(cli.categoria);
end;

procedure cargarLista(var L : lista);
var
  c : cliente;
  aux : lista;
begin
  leerCliente(c);
  while (c.apeynom <> 'ZZZ') do begin
    if (L = nil) then begin
      new(L);
      L^.dato := c;
      L^.sig := nil;
    end
    else begin
      new(aux);
      aux^.dato := c;
      aux^.sig := L;
      L :=aux;
    end;
   leerCliente(c);
   end;
end;

procedure imprimir(A : arbol);
begin
  if (A <> nil) then begin
    imprimir (A^.HI);
    writeln (A^.dato.dni);
    imprimir (A^.HD);
  end;
end;

procedure agregarEnArbol(var A : arbol; c : cliente);
begin
 if (A = nil) then begin
   new(A);
   A^.dato := c;
   A^.HI := nil;
   A^.HD := nil;
  end
 else
  if (c.dni <= A^.dato.dni) then
    agregarEnArbol(A^.HI, c)
  else
   agregarEnArbol(A^.HD, c);
end;

procedure generarArbol (L : lista; var A : arbol);
begin
 while (L <> nil) do begin
   agregarEnArbol(A, L^.dato);
   L := L^.sig;
  end;
end;

procedure mayorCategoria(A : arbol; var c : cliente);
var
  maxIzq, maxDer : cliente;
begin
  if(A = nil) then begin
    c.apeynom := 'Arbol vacio';
    c.dni := -1;
    c.categoria := -1;
  end
  else begin
    c := A^.dato;
    if(A^.HI <> nil) then begin
      mayorCategoria(A^.HI, maxIzq);
      if(maxIzq.categoria > c.categoria) then
        c := maxIzq;
    end;
    if(A^.HD <> nil) then begin
      mayorCategoria(A^.HD, maxDer);
      if(maxDer.categoria > c.categoria) then
        c := maxDer;
    end;
  end;
end;

var
 L : lista;
 A : arbol;
 c : cliente;
begin
 cargarLista (L);
 generarArbol(L, A);
 writeLN('Muestro los dni ordenados de menor a mayor');
 imprimir(A);
 writeln;
 writeln;
 mayorCategoria(A, c);
 write('El cliente ', c.apeynom, ' es el de mayor categoria');
 readln;
end.
