Use Gestion_Torneos_Deportivos;

Create table Torneos(

ID_Torneo int primary key,
NombreTorneo varchar (50),
TipoTorneo varchar (50),
Fecha_Inicio date,
DiasDuracion int,
ReglasEspecificas varchar(150)

);

Create table Jugadores(

ID_Jugador int primary key,
NombreJugador varchar (50),
ApellidoJugador varchar (50),
Edad int,
Celular int,
Correo varchar (50),
Dirreccion varchar (50),
Ciudad varchar (50)

);

Create table Posiciones(

ID_Posicion int primary key,
PartidosGanados int,
PartidosEmpatados int,
PartidosPerdidos int,
PuntosTotales int


);

Create table Historiales(

ID_Historial int primary key


);

Create table Equipos(

ID_Equipo int primary key,
NombreEquipo varchar (50),
CantidadJugadores Int,
ID_Posicion int,
FOREIGN KEY (ID_Posicion) REFERENCES Posiciones(ID_Posicion),

);

Create table Partidos(

ID_Partido int primary key,
Fecha date,
Hora time,
Direccion varchar(50),
Ciudad varchar (50),
ID_Historial int,
FOREIGN KEY (ID_Historial) REFERENCES Historiales(ID_Historial)

);

Create table TorneosJugadores(

ID_TorneoJugador int primary key,
ID_Torneo int,
FOREIGN KEY (ID_Torneo) REFERENCES Torneos(ID_Torneo),
ID_Jugador int,
FOREIGN KEY (ID_Jugador) REFERENCES Jugadores(ID_Jugador),

);

Create table JugadoresEquipos(

ID_JugadorEquipo int primary key,
ID_Jugador int,
FOREIGN KEY (ID_Jugador) REFERENCES Jugadores(ID_Jugador),
ID_Equipo int,
FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID_Equipo)
);

Create table PartidosJugadores(

ID_PartidoJugador int primary key,
ID_Partido int,
FOREIGN KEY (ID_Partido) REFERENCES Partidos(ID_Partido),
ID_Jugador int,
FOREIGN KEY (ID_Jugador) REFERENCES Jugadores(ID_Jugador)
);

Create table Resultados(

ID_Historial int,
FOREIGN KEY (ID_Historial) REFERENCES Historiales(ID_Historial),
ID_Partido int,
FOREIGN KEY (ID_Partido) REFERENCES Partidos(ID_Partido)
);