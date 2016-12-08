create database ProyectBD;
use ProyectBD;

create table Article(
	id int primary key,
	namee VARCHAR(150) not null,
	trademark VARCHAR(300) not null,
    characteristics VARCHAR(300) not null,
	price int
);

create table Inventory(
	idArticle int,
    quantity int,
	foreign key(idArticle) references Article(id),
    primary key(idArticle)
);

create table Users(
	id int primary key,
	nameUser VARCHAR(150),
	LastName VARCHAR(15),
	pass VARCHAR(15)
);

create table Administrator(
	num_adm int primary key,
	idEmployee int,
	foreign key(idEmployee) references Users(id)
);

create table Sales(
	id int primary key,
	dateSale datetime not null,
	amount int,
	idArticle int,
    idEmployee int,
    foreign key(idEmployee) references Users(id),
	foreign key(idArticle) references Article(id)
);

create table Warranty(
	idSale int,
	DateStart datetime not null,
	DateEnd datetime not null,
	foreign key(idSale) references Sales(id),
    primary key(idSale)
);

create table Purchase(
	id int primary key,
	idAdm int,
	amount int,
	DatePurchase datetime not null,
	name_Provider VARCHAR(100),
	mark VARCHAR(100),
	characteristics VARCHAR(200),
	foreign key(idAdm) references Administrator(num_adm)
);

create table Cashbox(
	idSale int,
    idEmployee int,
    foreign key(idEmployee) references Users(id),
	foreign key(idSale) references Sales(id),
    primary key(idSale,idEmployee)
);


