create database if not exists ProyectBD;
use ProyectBD;

create table Article(
	id int primary key,
	ArticleName VARCHAR(150) ,
	trademark VARCHAR(300) not null,
    ArticleYear int not null, 
    characteristics VARCHAR(300),
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
	UserName VARCHAR(150),
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
    quantity int,
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

create table Purchases(
	id int primary key,
	idAdm int,
	amount int,
	DatePurchase datetime not null,
	name_Provider VARCHAR(100),
	trademark VARCHAR(100),
	characteristics VARCHAR(200),
	foreign key(idAdm) references Administrator(num_adm)
);




