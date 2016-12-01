create database Nexus_COM;
use Nexus_COM;

create table Articulo(
	id int primary key,
	nombre VARCHAR(150) not null,
	marca VARCHAR(300) not null,
    caracteristicas VARCHAR(300) not null,
	precio int
);

create table Inventario(
	idArticulo int,
    cantidad int,
	foreign key(idArticulo) references Articulo(id),
    primary key(idArticulo)
);

create table Usuario(
	id int primary key,
	nombres VARCHAR(150),
	apellido_P VARCHAR(15),
	apellido_M VARCHAR(15),
	pass VARCHAR(15)
);

create table Administrador(
	num_adm int primary key,
	idEmpleado int,
	foreign key(idEmpleado) references Usuario(id)
);

create table Ventas(
	id int primary key,
	fecha datetime not null,
	monto int,
	idArticulo int,
    idEmpleado int,
    foreign key(idEmpleado) references Usuario(id),
	foreign key(idArticulo) references Articulo(id)
);

create table Garantia(
	idVenta int,
	fechaIni datetime not null,
	fechaFin datetime not null,
	foreign key(idVenta) references Ventas(id),
    primary key(idVenta)
);

create table Compras(
	id int primary key,
	idAdm int,
	monto int,
	fecha datetime not null,
	nom_Provedor VARCHAR(100),
	marca VARCHAR(100),
	caracteristicas VARCHAR(200),
	foreign key(idAdm) references Administrador(num_adm)
);

create table Caja(
	idVenta int,
    idEmpleado int,
    foreign key(idEmpleado) references Usuario(id),
	foreign key(idVenta) references Ventas(id),
    primary key(idVenta,idEmpleado)
);

