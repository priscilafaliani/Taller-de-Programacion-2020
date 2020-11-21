program ParcialViejo1;
const
	dimF=5;
type
	participante = record
		DNI:longint;
		preguntas:string;
		puntos:integer;
	end;

	lista=^nodo;
	nodo = record
		dato:participante;
		sig:lista;
	end;

	vectorParticipantes=array[1..dimF] of lista;

	participante2 = record
		DNI2:longint;
		totalPuntos:integer;
	end;

	lista2=^nodo2;
	nodo2= record
		dato2:participante2;
		sig2:lista2;
	end;

{---------------------------------------------------------------------}

procedure InicializarVector (var v:vectorParticipantes);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i]:=nil;
end;

{---------------------------------------------------------------------}

procedure LeerParticipante (var p:participante);
begin
	writeln('----PARTICIPANTE----');
	write('DNI: ');
	readln(p.dni);
	if (p.dni <> 0) then begin
		write('Pregunta: ');
		readln(p.preguntas);
		write('Puntos: ');
		readln(p.puntos);
	end;
end;

{---------------------------------------------------------------------}

procedure insertarOrdenado(var L:lista; p:participante);
var
    aux,ant,act:lista;
begin
    new(aux);
    aux^.dato:=p;
    ant:=L;
    act:=L;
    while (act <> nil) and (p.DNI > act^.dato.DNI) do begin
		ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then
        L:=aux
    else
        ant^.sig:=aux;
    aux^.sig:=act;
end;

{---------------------------------------------------------------------}

procedure ArmarVector (var v:vectorParticipantes);
var
	p:participante;
	dia:integer;
begin
	InicializarVector(v);
	LeerParticipante(p);
	if (p.dni<>0) then begin
		write('Dia: ');
		readln(dia);
	end;
	while (p.dni <> 0) do begin
		insertarOrdenado(v[dia],p);
			LeerParticipante(p);
			if (p.dni<>0) then begin
				write('Dia: ');
				readln(dia);
			end;
	end;
end;

{---------------------------------------------------------------------}

procedure agregarAtras(var L,ult: lista2; p2:participante2);
var
	aux:lista2;
begin
	new(aux);
	aux^.dato2:=p2;
	aux^.sig2:=nil;
	if (L = nil) then
		L:=aux
	else
		ult^.sig2:=aux;
	ult:=aux;
end;

{---------------------------------------------------------------------}

procedure minimo (var v:vectorParticipantes; var p2:participante2);
var
    IndiceMin,i:integer;
begin
    p2.DNI2:=9999; //lo inicializo en un valor muy alto. VALOR DE CORTE
    IndiceMin:=-1;
    for i:= 1 to dimF do
        if (v[i] <> nil) then
            if (v[i]^.dato.DNI <= p2.DNI2) then begin //comparo si lo que apunto es el minimo
                IndiceMin:=i; //la posicion de mi minimo
                p2.DNI2:=v[i]^.dato.DNI; //me guardo el DNI minimo
                p2.totalPuntos:=v[i]^.dato.puntos;//me guardo los puntos
            end;
    if (IndiceMin <> -1) then
        v[IndiceMin]:=v[IndiceMin]^.sig; //avanzo al proximo elemento de mi lista
end;

{---------------------------------------------------------------------}

procedure MergeAcumulador(v:vectorParticipantes; var ListaNueva:lista2);
var
    Totpuntos:integer;
    p2,actual:participante2;
    ult:lista2;
begin
    ListaNueva:=nil;
    ult:=nil;
    minimo(v,p2); //va a devolver 9999 cuando todas mis listas esten en nil
    while(p2.DNI2 <> 9999) do begin
        actual.DNI2:=p2.DNI2; //me guardo mi DNI actual
        Totpuntos:=0; //inicializo mi contador de puntos
        while ((p2.DNI2 <> 9999) and (actual.DNI2 = p2.DNI2)) do begin //verifico si no es nil y si es el mismo DNI
            Totpuntos:=Totpuntos+p2.totalPuntos; //sumo los puntos
            minimo(v,p2); //voy a buscar otro DNI
        end;
        actual.totalPuntos:=Totpuntos;
        AgregarAtras(ListaNueva,ult,actual); //agrego la info del participante a mi lista
    end;
end;

{---------------------------------------------------------------------}

procedure ImprimirListaNueva (L2:lista2);
begin
    while (L2<>nil) do begin
        writeln('DNI: ',L2^.dato2.DNI2);
        writeln('Total puntos: ',L2^.dato2.totalPuntos);
        L2:=L2^.sig2;
    end;
end;


{---------------------------------------------------------------------}

procedure ImprimirVector (v:vectorParticipantes);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		writeln('DIA ',i);
		while (v[i] <> nil) do begin
			writeln('DNI: ',v[i]^.dato.DNI);
			writeln('Pregunta: ',v[i]^.dato.preguntas);
			writeln('Puntos: ',v[i]^.dato.puntos);
			v[i]:=v[i]^.sig;
		end;
		writeln();
	end;
end;

{---------------------------------------------------------------------}

var
	v:vectorParticipantes;
	ListaNueva:lista2;
begin
	ArmarVector(v);
	MergeAcumulador(v,ListaNueva);
	ImprimirListaNueva(ListaNueva);
end.
