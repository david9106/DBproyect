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
