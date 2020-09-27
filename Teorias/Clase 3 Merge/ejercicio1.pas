program merge;
const
  cantidadEstantes = 5;
type
  listaPtr = ^regNodo;
  regNodo = record
    dato : string;
    sig : listaPtr;
  end;
  arrEstantes = array[1..cantidadEstantes] of listaPtr;


procedure minimo(var e1, e2 : lista; var min : string);
begin
  min := 'ZZZ';
  if((e1 <> nil) and (e2 <> nil)) then begin
    if(e1^.dato <= e2^.dato) then begin
      min := e1^.dato;
      e1 := e1^.sig;
    end;
    else begin
      min := e2^.dato;
      e2 := e2^.sig;
    end;
  end
  else if ((e1 <> nil) and (e2 = nil)) then begin
    min := e1^.dato;
    e1 := e1^.sig;
  end
  else if((e1 = nil) and (e2 <> nil)) then begin
    min := e2^.dato;
    e2 := e2^.sig;
  end;
end;


procedure merge(e1, e12 : lista; var eNuevo : lista)
begin
  eNuevo := nil;
  minimo(e1, e2, min);
  while(min <> 'ZZZ' do begin
    agregarAtras(eNuevo, min);
    minimo(e1, e2, min);
  end;)
end;
