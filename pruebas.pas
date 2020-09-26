program prueba;

Type
   arbol= ^nodo;
   nodo = record
           dato: integer;
           HI: arbol;
           HD: arbol;
          end;


PROCEDURE maximo (var a : arbol; var max: integer);

begin

    if (a=nil)

    then max:= -1

    else begin

              iF  (a^.DATO > max) then

                    max:= a^.dato;

             maximo (a^.hI, MAX);

             maximo (a^.hD, MAX);

        end;

end;
var
  a : arbol;
  max : integer;
begin
  a := nil;
  a^.dato := 4;
  a^.HI^.dato := 3;
  maximo(a, max);
  writeln(max);
  readln;
end.
