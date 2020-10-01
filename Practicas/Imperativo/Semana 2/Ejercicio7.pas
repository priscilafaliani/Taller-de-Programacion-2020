program ejercicio6;
type
  regAlumno = record
    legajo : int64;
    apellido : string;
    nombre : string;
    dni : int64;
    añoIngreso : integer;
  end;

  arbolPtr = ^regNodo;

  regNodo = record
    dato : alumno;
    left : arbolPtr;
    right : arbolPtr;
  end;

function crearNodo(alumno : regAlumno): arbolPtr;
var nodo : arbolPtr;
begin
  new(nodo);
  nodo^.dato := alumno;
  nodo^.left := nil;
  nodo^.right := nil;
end;

procedure insertar(arbol : arbolPtr; alumno : regAlumno);
begin
  if(arbol = nil) then
    arbol := crearNodo(alumno);
  else if (alumno.legajo < arbol^.dato.legajo) then
    insertar(arbol^.left)
  else insertar(arbol^.right);
end;

procedure ingresarAlumnos(arbol : arbolPtr);
begin
  leerAlumno(alumno);
  while(alumno.legajo <> 0) do begin
    if(alumno.añoIngreso >= 2000) then
      insertar(arbol, alumno);
    leerAlumno(alumno);
  end;
end;


begin

end.
