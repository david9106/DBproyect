use proyectBD;

-- Validates and procedures from the Article Table
delimiter //
create trigger Validate before insert on Article
for each row
begin 
	if new.ArticleName is null then
		signal sqlstate '45000' set message_text = 'The name is incorrect', mysql_errno = 1;
	elseif new.id is null then
		signal sqlstate '45000' set message_text = 'The id is incorrect', mysql_errno = 2;
	elseif new.trademark is null then
		signal sqlstate '45000' set message_text = 'The Trademark is incorrect', mysql_errno = 3;
	elseif new.ArticleYear is null then
		signal sqlstate '45000' set message_text = 'The Year is incorrect', mysql_errno = 3;
    elseif exists(select id from Article where id = new.id) then
		signal sqlstate '45001' set message_text = 'The id already exist', mysql_errno = 5;
	end if;
end
//
delimiter;

delimiter //
create trigger updateValidate before update on Article
for each row
begin 
	if new.ArticleName is null then
		signal sqlstate '45000' set message_text = 'The name is incorrect', mysql_errno = 1;
	elseif new.id is null then
		signal sqlstate '45000' set message_text = 'The id is incorrect', mysql_errno = 2;
	elseif new.trademark is null then
		signal sqlstate '45000' set message_text = 'The Trademark is incorrect', mysql_errno = 3;
	elseif new.ArticleYear is null then
		signal sqlstate '45000' set message_text = 'The Year is incorrect', mysql_errno = 3;
	end if;
end
//
delimiter;

delimiter //
create function validateArticle(newId int)
 returns int
 begin
	declare idExists int;
    set idExists = (select count(id) from articulo where id=newId);
    if  idExists= 1 then
			return 1;
	else
            return 0;
	end if;    
 end
//
delimiter;

delimiter //
create procedure AddArticle(in idx int, in newPrice int, in newName VARCHAR(150), in newCharac VARCHAR(300), in newTrademark VARCHAR(300), in newYear int)
begin
 
			INSERT INTO article (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES (idx, newName, NewTrademark, newYear, newCharac, newPrice);
		 
end
//
delimiter;



delimiter //
create procedure DeleteArticle(in idx int)
begin
	declare articleExists integer;
    
    set articleExists = valideteArticle(idx);
    
		 if articleExists = 1 then
			delete from article where id=idx;
		 else
			signal sqlstate '45000' set message_text = 'Article does not exist', mysql_errno = 10;
		 end if;
end
//

create procedure EditArticle(in newId int, in newPrice int, in newName VARCHAR(150), in newCharac VARCHAR(300), in newTrademark VARCHAR(300), in newYear int)
begin
    declare articleExists int;
    set articleExists = validateArticle(newId);
    
    if articleExists = 1 then
		update Articulo set `trademark`= newTrademark, `price`= newPrice, `ArticleName` = newName, `characteristics` = newCharac WHERE `id`= newId;
	else
		signal sqlstate '45000' set message_text = 'Article does not exist', mysql_errno = 11;
	end if;
end
//

delimiter //
create procedure ArticleList(in searchName VARCHAR(300))
begin
	 
     	SELECT * FROM Article WHERE ArticleName like concat('%',searchName,'%');
	
end
//
delimiter;


-- Validates and Procedures from the Users Table
delimiter //
create trigger ValidateUser before insert on Users
for each row
begin 
	if new.UserName is null then
		signal sqlstate '45000' set message_text = 'The name is incorrect', mysql_errno = 1;
	elseif new.id is null then
		signal sqlstate '45000' set message_text = 'The id is incorrect', mysql_errno = 2;
	elseif new.pass is null then
		signal sqlstate '45000' set message_text = 'The Password is incorrect', mysql_errno = 3;
    elseif exists(select id from Users where id = new.id) then
		signal sqlstate '45001' set message_text = 'The id already exist', mysql_errno = 5;
	end if;
end
//
delimiter;

delimiter //
create trigger UpdateValidateUser before update on Users
for each row
begin 
	if new.UserName is null then
		signal sqlstate '45000' set message_text = 'The name is incorrect', mysql_errno = 1;
	elseif new.id is null then
		signal sqlstate '45000' set message_text = 'The id is incorrect', mysql_errno = 2;
	elseif new.pass is null then
		signal sqlstate '45000' set message_text = 'The Password is incorrect', mysql_errno = 3;
	end if;
end
//
delimiter;

delimiter //
create function validateUser(newId int)
 returns int
 begin
	declare idExists int;
    set idExists = (select count(id) from Users where id=newId);
    if  idExists= 1 then
			return 1;
	else
            return 0;
	end if;    
 end
//
delimiter;

delimiter //
create procedure AddUser(in newId int, in newName VARCHAR(150), in newLastName VARCHAR(150), in newPass VARCHAR(150))
begin
			INSERT INTO Users(`id`, `UserName`, `LastName`, `pass`) VALUES (newId, newName, newLastName, newPass);
		 
end
//
delimiter;



delimiter //
create procedure DeleteUser(in idx int)
begin
	declare UserExists integer;
    
    set UserExists = valideteUser(idx);
    
		 if UserExists = 1 then
			delete from Users where id=idx;
		 else
			signal sqlstate '45000' set message_text = 'User does not exist', mysql_errno = 10;
		 end if;
end
//


create procedure EditUser(in newid int, in newName VARCHAR(150), in newLastName VARCHAR(150), in newPass VARCHAR(150))
begin
    declare UserExists int;
    set UserExists = validateUser(newId);
    
    if UserExists = 1 then
		update Users set `UserName`= newName, `LastName`= newLastName, `pass` = newPass WHERE `id`= newId;
	else
		signal sqlstate '45000' set message_text = 'User does not exist', mysql_errno = 10;
	end if;
end
//

delimiter //
create procedure UserList(in searchName VARCHAR(300))
begin
	 
     	SELECT * FROM users WHERE UserName like concat('%',searchName,'%');
	
end
//
delimiter;



-- Validates and Procedures from the AdminUsers Table
delimiter //
create trigger ValidateAdmin before insert on Administrator
for each row
begin 
	if new.NumAdm is null then
		signal sqlstate '45000' set message_text = 'The number is incorrect', mysql_errno = 1;
	elseif not exists(select id from Users where id = new.idEmployee) then
		signal sqlstate '45001' set message_text = 'The User does not exist', mysql_errno = 5;
	elseif exists(select NumAdm from Administrator where NumAdm = new.NumAdm) then
		signal sqlstate '45001' set message_text = 'The Administrator Number already exist', mysql_errno = 5;
    elseif exists(select idEmployee from Administrator where idEmployee = new.IdEmployee) then
		signal sqlstate '45001' set message_text = 'The ID is an Administrator ', mysql_errno = 5;    
	end if;
end
//
delimiter;

delimiter //
create trigger UpdateValidateAdmin before update on Administrator
for each row
begin 
	if new.NumAdm is null then
		signal sqlstate '45000' set message_text = 'The Number is incorrect', mysql_errno = 1;
	elseif not exists(select id from Users where id = new.idEmployee) then
		signal sqlstate '45001' set message_text = 'The User does not exist', mysql_errno = 5;
    end if;
end
//
delimiter;

delimiter //
create function validateAdmin(ThisNumAdm int)
 returns int
 begin
	declare NumExists int;
    set NumExists = (select count(NumAdm) from Administrator where NumAdm=ThisNumAdm);
    if  NumExists= 1 then
			return 1;
	else
            return 0;
	end if;    
 end
//
delimiter;

delimiter //
create procedure AddAdministrator(in newNum int,in newId int)
begin
			INSERT INTO Administrator(`NumAdm`, `idEmployee`) VALUES (newNum, newId);
		 
end
//
delimiter;



delimiter //
create procedure DeleteAdmin(in ThisNumAdm int)
begin
	declare AdminExists integer;
    
    set AdminExists = valideteAdmin(NumAdm);
    
		 if adminExists = 1 then
			delete from Administrator where NumAdm=ThisnumAdm;
		 else
			signal sqlstate '45000' set message_text = 'Admin does not exist', mysql_errno = 10;
		 end if;
end
//

delimiter //
create procedure EditAdmin(in newNum int,in newId int)
begin
    declare AdminExists int;
    set AdminExists = validateAdmin(newNum);
    
    if AdminExists = 1 then
		update Administrator set `idEmployee`= newId WHERE `NumAdm`= newNum;
	else
		signal sqlstate '45000' set message_text = 'User does not exist', mysql_errno = 10;
	end if;
end
//

create procedure ArticleReport()
begin
  SELECT a.ArticleName, i.quantity, a.Price , i.quantity*a.Price as Total FROM Article a INNER JOIN Inventory i ON a.id = i.idArticle;
end



-- Validates and procedures from the Article Warranty
//
create trigger WarrantyValidate before insert on Warranty
for each row
begin 
	if new.DateStart is null then
		signal sqlstate '45000' set message_text = 'The dataStard is incorrect', mysql_errno = 1;
	elseif new.idSale is null then
		signal sqlstate '45000' set message_text = 'The id is incorrect', mysql_errno = 2;
	elseif new.DateEnd is null then
		signal sqlstate '45000' set message_text = 'The dataEnd is incorrect', mysql_errno = 3;
	end if;
end
//
delimiter;

delimiter //
create trigger updateWarrantyValidate before update on Warranty
for each row
begin 
	if new.DateStart is null then
		signal sqlstate '45000' set message_text = 'The name is incorrect', mysql_errno = 1;
	elseif new.idSale is null then
		signal sqlstate '45000' set message_text = 'The id is incorrect', mysql_errno = 2;
	elseif new.DateEnd is null then
		signal sqlstate '45000' set message_text = 'The Trademark is incorrect', mysql_errno = 3;
	end if;
end
//
delimiter;


delimiter //
create function validateWarranty(newId int)
 returns int
 begin
	declare idExists int;
    set idExists = (select count(idSale) from Warranty where idSale=newId);
    if  idExists= 1 then
			return 1;
	else
            return 0;
	end if;    
 end
//
delimiter;



delimiter //
create procedure AddWarranty(in idx int, in Datestart datetime,in Dateend datetime )
begin
			INSERT INTO Warranty (`idSale`, `DateStart`, `DateEnd`) VALUES (idx, Datestart, Dateend);
end
//
delimiter;


delimiter //
create procedure DeleteWarranty(in idx int)
begin
	declare articleExists integer;
    
    set articleExists = valideteWarranty(idx);
    
		 if articleExists = 1 then
			delete from article where idSale=idx;
		 else
			signal sqlstate '45000' set message_text = 'Warranty does not exist', mysql_errno = 10;
		 end if;
end
//


create procedure EditWarranty(in idx int, in Datestart datetime,in Dateend datetime )
begin
    declare WarrantyExists int;
    set WarrantyExists = validateWarranty(newId);
    
    if WarrantyExists = 1 then
		update Warranty set `DateStart`= Datestart, `DateEnd`= Dateend,`idSale` = newCharac WHERE `idSale`= newId;
	else
		signal sqlstate '45000' set message_text = 'Warranty does not exist', mysql_errno = 11;
	end if;
end
//

delimiter //
create procedure  WarrantyList(in searchName VARCHAR(300))
begin
     	SELECT * FROM  Warranty WHERE   idSale like concat('%',searchName,'%');
end
//


-- report warranty
delimiter //
create procedure WarrantyReport(in startDate datetime,in endDate datetime)
begin
  SELECT w.DateStart,w.DateEnd,u.UserName  as vendedor, a.ArticleName as Articulo,s.amount as Precio FROM Warranty w inner join Sales s ON w.idSale = s.id inner join Article a ON s.idArticle = a.id inner join Users u ON s.idEmployee = u.id where w.DateStart >= startDate and w.DateStart <=endDate; 
end

//


