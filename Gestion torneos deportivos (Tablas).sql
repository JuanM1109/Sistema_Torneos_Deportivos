Use Gestion_Torneos_Deportivos;

Create table Torneos(

ID_Torneo int primary key,
NombreTorneo varchar (50)Not null,
TipoTorneo varchar (50)Not null,
Fecha_Inicio date Not null,
DiasDuracion int Not null,
ReglasEspecificas varchar(150) Not null

);

Create table Jugadores(

ID_Jugador int primary key,
NombreJugador varchar (50) Not null,
ApellidoJugador varchar (50) Not null,
Edad int Not null,
Celular int,
Correo varchar (50) Not null,
Dirreccion varchar (50) Not null,
Ciudad varchar (50) Not null

);

Create table Posiciones(

ID_Posicion int primary key,
PartidosGanados int Not null,
PartidosEmpatados int Not null,
PartidosPerdidos int Not null,
PuntosTotales int Not null


);

Create table Historiales(

ID_Historial int primary key 


);

Create table Equipos(

ID_Equipo int primary key,
NombreEquipo varchar (50) Not null,
CantidadJugadores Int Not null,
ID_Posicion int Not null,
FOREIGN KEY (ID_Posicion) REFERENCES Posiciones(ID_Posicion),

);

Create table Partidos(

ID_Partido int primary key,
Fecha date Not null,
Hora time Not null,
Direccion varchar(50) Not null,
Ciudad varchar (50) Not null,
ID_Historial int Not null,
FOREIGN KEY (ID_Historial) REFERENCES Historiales(ID_Historial)

);

Create table TorneosEquipos(

ID_TorneoEquipo int primary key Not null,
ID_Torneo int Not null,
FOREIGN KEY (ID_Torneo) REFERENCES Torneos(ID_Torneo),
ID_Equipo int Not null,
FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID_Equipo),

);

Create table JugadoresEquipos(

ID_JugadorEquipo int primary key,
ID_Jugador int Not null,
FOREIGN KEY (ID_Jugador) REFERENCES Jugadores(ID_Jugador),
ID_Equipo int Not null,
FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID_Equipo)
);

Create table PartidosEquipos(

ID_PartidoEquipo int primary key,
ID_Partido int Not null,
FOREIGN KEY (ID_Partido) REFERENCES Partidos(ID_Partido),
ID_Equipo int Not null,
FOREIGN KEY (ID_Equipo) REFERENCES Equipos (ID_Equipo)
);

Create table Resultados(
ID_Resultado int primary key,

ID_Partido int Not null,
FOREIGN KEY (ID_Partido) REFERENCES Partidos(ID_Partido)
);