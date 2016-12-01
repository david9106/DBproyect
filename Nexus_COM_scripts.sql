use nexus_com;

delimiter //

create function calcularTotal(fecha_check datetime)
returns int
begin
    declare sumaTotal int;
    set sumaTotal = (
		select sum(monto)
		from ventas
		where fehca=fecha_check);
     return sumaTotal;
end
//

delimiter ;

-- call insertarArticulo(02,300,'cpu Phenom', '3.2GHz', 'AMD');
delimiter //

-- funciones para validacion
create function validar_venta(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(id) from ventas where id=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

create function validar_articulo(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(id) from articulo where id=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

create function validar_articuloInv(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(idArticulo) from inventario where idArticulo=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

create function validar_empleado(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(id) from usuario where id=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

-- procedimientos para tabla ventas
create procedure eliminarVenta(in codigo int)
begin
	declare x int;
    set x = validar_venta(codigo);
    if x = 1 then
		delete from ventas
        where id=codigo;
     else
		signal sqlstate '45000' set message_text = 'Venta no existe', mysql_errno = 1;
	end if;
end
//

create procedure editarVenta(in codigo int, in idArt int, in fechaCamb datetime, in nv_monto int, in idEmp int)
begin
	declare x int;
    declare y int;
    declare z int;
    set x = validar_venta(codigo);
    set y = validar_articulo(idArt);
    set z = validar_empleado(idEmp);
    if x = 1 then
		if y = 1 then
			if z = 1 then
				update ventas set `idArticulo`= idArt, `fecha`= fechaCamb, `monto` = nv_monto, `idEmpleado` = idEmp where `id`= codigo;
			else
				signal sqlstate '45000' set message_text = 'Empleado no existe', mysql_errno = 5;
            end if;
        else 
			signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 2;
        end if;    
     else
		signal sqlstate '45000' set message_text = 'Venta no existe', mysql_errno = 3;
	end if;
end
//

create procedure insertarVenta(in codigo int, in idArt int, in fechaCamb datetime, in monto int, in idEmp int)
begin
	declare x int;
    declare y int;
    declare z int;
    set x = validar_venta(codigo);
    set y = validar_articulo(idArt);
    set z = validar_empleado(idEmp);
    if monto is null or fechaCamb is null then
		signal sqlstate '45000' set message_text = 'error datos no se capturaron correctamente', mysql_errno = 6;
	end if;
    if x = 0 then
		if y = 1 then
			if z = 1 then
				insert into ventas (`id`, `fecha`, `monto`, `idArticulo`, `idEmpleado`) values (codigo, fechaCamb, monto, idArt, idEmp);
			else
				signal sqlstate '45000' set message_text = 'Empleado no existe', mysql_errno = 5;
            end if;
        else 
			signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 2;
        end if;    
     else
		signal sqlstate '45000' set message_text = 'Codigo de venta repetido', mysql_errno = 3;
	end if;
end
//


create procedure listarVenta(in codigo int)
begin
	declare x int;
    set x = validar_venta(codigo);
    if x = 1 then
		select id,idArticulo,monto,fecha,idEmpleado from ventas
        where codigo = id;
    else
		signal sqlstate '45000' set message_text = 'Venta no existe', mysql_errno = 4;
    end if;
end
//

-- procedimientos para tabla articulo
create procedure eliminarArticulo(in codigo int)
begin
	declare x int;
    set x = validar_articulo(codigo);
    if x = 1 then
		delete from articulo
        where id=codigo;
     else
		signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 10;
	end if;
end
//

create procedure editarArticulo(in codigo int, in nv_precio int, in nv_nombre VARCHAR(150), in nv_caract VARCHAR(300), in nv_marca VARCHAR(300))
begin
    declare y int;
    set y = validar_articulo(codigo);
    if nv_precio is null or nv_nombre is null or nv_caract is null or nv_marca is null then
		signal sqlstate '45000' set message_text = 'error datos no se capturaron correctamente', mysql_errno = 7;
	end if;
    if y = 1 then
		update articulo set `marca`= nv_marca, `precio`= nv_precio, `nombre` = nv_nombre, `caracteristicas` = nv_caracteristica WHERE `id`= codigo;
     else
		signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 10;
	end if;
end
//

create procedure insertarArticulo(in codigo int, in nv_precio int, in nv_nombre VARCHAR(150), in nv_caract VARCHAR(300), in nv_marca VARCHAR(300))
begin
    declare y int;
    set y = validar_articulo(codigo);
    if nv_nombre is null or nv_caract is null or nv_marca is null or nv_precio is null then
		signal sqlstate '45000' set message_text = 'Datos no se capturaron correctamente', mysql_errno = 8;
    end if;
    if y = 0 then
		insert into articulo (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) values (codigo, nv_nombre, nv_marca, nv_caract, nv_precio);
     else
		signal sqlstate '45000' set message_text = 'Codigo de articulo repetido', mysql_errno = 9;
	end if;
end
//

-- drop procedure if exists listarArticulo//

create procedure listarArticulo(in codigo int, in nombre_b VARCHAR(300), in marca_b VARCHAR(300))
begin
	declare x int;
    set x = validar_articulo(codigo);
	if codigo is null and nombre_b is null and marca_b is null then
		signal sqlstate '45000' set message_text = 'No agrego ningun dato', mysql_errno = 13;
	end if;
	if  x = 0 and nombre_b is null and marca_b is null then
		signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 10;
    else
		select id,nombre,marca from articulo
		where id=codigo or nombre like concat('%',nombre_b,'%')  or marca like concat('%',marca_b,'%');
	end if;
end
//

-- delimiter ;

-- call listarArticulo(null,'loca',null);

-- procedimientos para tabla inventario
create procedure eliminarInventario(in codigo int)
begin
	declare x int;
    set x = validar_articuloInv(codigo);
    if x = 1 then
		delete from inventario
        where id=codigo;
     else
		signal sqlstate '45000' set message_text = 'Articulo no existe en inventario', mysql_errno = 10;
	end if;
end
//

create procedure editarInventario(in codigo int, in nv_cantidad int)
begin
    declare y int;
    set y = validar_articuloInv(idArt);
    if nv_cantidad is null then
		signal sqlstate '45000' set message_text = 'no se capturo cantidad', mysql_errno = 7;
	end if;
    if y = 1 then
		update inventario set `cantidad`= nv_cantidad WHERE `id`= codigo;
     else
		signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 10;
	end if;
end
//

create procedure insertarInventario(in codigo int, in nv_cantidad int)
begin
	declare x int;
    set x = validar_articulo(codigo);
    if nv_cantidad is null then
		signal sqlstate '45000' set message_text = 'No se capturo cantidad', mysql_errno = 8;
    end if;
    if x = 1 then
		insert into inventario (`idArticulo`, `cantidad`) values (codigo, nv_cantidad);
     else
		signal sqlstate '45000' set message_text = 'Articulo no existe', mysql_errno = 10;
	end if;
end
//

create procedure listarInventario(in codigo int)
begin
	declare x int;
    set x = validar_articuloInv(codigo);
    if x = 1 then
		select codigo as 'ID Articulo', a.nombre as 'Nombre de articulo', i.cantidad as 'Cantidad de producto' from inventario i
        inner join articulo a on a.id=codigo;
    else
		signal sqlstate '45000' set message_text = 'Articulo no existe en inventario', mysql_errno = 10;
    end if;
end
//

-- funciones para validacion --
create function validar_garantia(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(idVenta) from garantia where idVenta=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

create function validar_caja(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(idVenta) from caja where idVenta=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

-- -------------------------------------------------------------------- --

-- procedimientos para tabla garantia --
create procedure eliminarGarantia(in codigo int)
begin
	declare x int;
    set x = validar_garantia(codigo);
    if x = 1 then
		delete from garantia
        where idVenta=codigo;
     else
		signal sqlstate '45000' set message_text = 'Garantia no existe', mysql_errno = 1;
	end if;
end
//

create procedure editarGarantia(in codigo int, in nv_fechaIni datetime, in nv_fechaFin datetime)
begin
	declare x int;
    set x = validar_garantia(codigo);
    if x = 1 then
				update garantia set `fechaIni` = nv_fechaIni, `fechaFin` = nv_fechaFin where `idVenta`= codigo;
        else 
			signal sqlstate '45000' set message_text = 'Garantia no existe', mysql_errno = 3;
        end if;    
end
//

create procedure insertarGarantia(in codigo int, in nv_fechaIni datetime, in nv_fechaFin datetime)
begin
	declare x int;
    set x = validar_garantia(codigo);
    if nv_fechaIni is null or nv_fechaFin is null then
		signal sqlstate '45000' set message_text = 'Error, datos no se capturaron correctamente', mysql_errno = 6;
	end if;
    if x = 0 then
				insert into garantia (`idVenta`, `fechaIni`, `fechaFin`) values (codigo, nv_fechaIni, nv_fechaFin);
        else 
			signal sqlstate '45000' set message_text = 'Codigo de garantia repetido', mysql_errno = 3;
        end if;    
end
//

create procedure listarGarantia(in codigo int)
begin
	declare x int;
    set x = validar_garantia(codigo);
    if x = 1 then
		select idVenta,fechaIni,fechaFin from garantia
        where codigo = idVenta;
    else
		signal sqlstate '45000' set message_text = 'Garantia no existe', mysql_errno = 4;
    end if;
end
//

-- procedimientos para tabla caja --
create procedure eliminarCaja(in codigo int)
begin
	declare x int;
    set x = validar_caja(codigo);
    if x = 1 then
		delete from caja
        where idVenta=codigo;
     else
		signal sqlstate '45000' set message_text = 'Caja no existe', mysql_errno = 10;
	end if;
end
//

create procedure editarCaja(in codigo int, in nv_idEmpleado int)
begin
    declare x int;
    set x = validar_caja(codigo);
    if nv_idEmpleado is null then
		signal sqlstate '45000' set message_text = 'Error, datos no se capturaron correctamente', mysql_errno = 7;
	end if;
    if x = 1 then
		update caja set `idEmpleado`= nv_idEmpleado WHERE `idVenta`= codigo;
     else
		signal sqlstate '45000' set message_text = 'Caja no existe', mysql_errno = 10;
	end if;
end
//

create procedure insertarCaja(in codigo int, in nv_idEmpleado int)
begin
    declare x int;
    set x = validar_caja(codigo);
    if nv_idEmpleado is null then
		signal sqlstate '45000' set message_text = 'Error, datos no se capturaron correctamente', mysql_errno = 8;
    end if;
    if x = 0 then
		insert into caja (`idVenta`, `idEmpleado`) values (codigo, nv_idEmpleado);
     else
		signal sqlstate '45000' set message_text = 'Codigo de caja repetido', mysql_errno = 9;
	end if;
end
//

create procedure listarCaja(in codigo int)
begin
	declare x int;
    set x = validar_caja(codigo);
    if x = 1 then
		select idVenta,idEmpleado from caja
        where codigo = idVenta;
    else
		signal sqlstate '45000' set message_text = 'Caja no existe', mysql_errno = 10;
    end if;
end
//

-- funciones para validacion --
create function validar_usuario(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(id) from usuario where id=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

create function validar_administrador(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(num_adm) from administrador where num_adm=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

create function validar_compras(codigo int)
 returns int
 begin
	declare conteo int;
    set conteo = (select count(id) from compras where id=codigo);
    if conteo = 1 then
			return 1;
        else
            return 0;
	end if;    
 end
//

-- -------------------------------------------------------------------- --

-- procedimientos para tabla usuario --
create procedure eliminarUsuario(in codigo int)
begin
	declare x int;
    set x = validar_usuario(codigo);
    if x = 1 then
		delete from usuario
        where id=codigo;
     else
		signal sqlstate '45000' set message_text = 'Usuario no existe', mysql_errno = 1;
	end if;
end
//

create procedure editarUsuario(in codigo int, in nv_nombres VARCHAR(150), in nv_apellidoP VARCHAR(15), in nv_apellidoM VARCHAR(15), in nv_pass VARCHAR(15))
begin
	declare x int;
    set x = validar_usuario(codigo);
    if x = 1 then
				update usuario set `nombres` = nv_nombres, `apellido_P` = nv_apellidoP, `apellido_M` = nv_apellidoM, `pass` = nv_pass where `id`= codigo;
        else 
			signal sqlstate '45000' set message_text = 'Usuario no existe', mysql_errno = 3;
        end if;    
end
//

create procedure insertarUsuario(in codigo int, in nv_nombres VARCHAR(150), in nv_apellidoP VARCHAR(15), in nv_apellidoM VARCHAR(15), in nv_pass VARCHAR(15))
begin
	declare x int;
    set x = validar_usuario(codigo);
    if nv_nombres is null or nv_apellidoP is null or nv_apellidoM is null or nv_pass is null then
		signal sqlstate '45000' set message_text = 'Error, datos no se capturaron correctamente', mysql_errno = 6;
	end if;
    if x = 0 then
				insert into usuario (`id`, `nombres`, `apellido_P`, `apellido_M`, `pass`) values (codigo, nv_nombres, nv_apellidoP, nv_apellidoM, nv_pass);
        else 
			signal sqlstate '45000' set message_text = 'Codigo de usuario repetido', mysql_errno = 3;
        end if;    
end
//

create procedure listarUsuario(in codigo int)
begin
	declare x int;
    set x = validar_usuario(codigo);
    if x = 1 then
		select id,nombres,apellido_P,apellido_M,pass from usuario
        where codigo = id;
    else
		signal sqlstate '45000' set message_text = 'Usuario no existe', mysql_errno = 4;
    end if;
end
//

-- procedimientos para tabla administrador --
create procedure eliminarAdministrador(in codigo int)
begin
	declare x int;
    set x = validar_administrador(codigo);
    if x = 1 then
		delete from administrador
        where num_adm=codigo;
     else
		signal sqlstate '45000' set message_text = 'Administrador no existe', mysql_errno = 10;
	end if;
end
//

create procedure editarAdministrador(in codigo int, in nv_idEmpleado int)
begin
    declare x int;
    set x = validar_administrador(codigo);
    if nv_idEmpleado is null then
		signal sqlstate '45000' set message_text = 'Error, datos no se capturaron correctamente', mysql_errno = 7;
	end if;
    if x = 1 then
		update administrador set `idEmpleado`= nv_idEmpleado WHERE `num_adm`= codigo;
     else
		signal sqlstate '45000' set message_text = 'Administrador no existe', mysql_errno = 10;
	end if;
end
//

create procedure insertarAdministrador(in codigo int, in nv_idEmpleado int)
begin
    declare x int;
    set x = validar_administrador(codigo);
    if nv_idEmpleado is null then
		signal sqlstate '45000' set message_text = 'Error, datos no se capturaron correctamente', mysql_errno = 8;
    end if;
    if x = 0 then
		insert into administrador (`num_adm`, `idEmpleado`) values (codigo, nv_idEmpleado);
     else
		signal sqlstate '45000' set message_text = 'Codigo de administrador repetido', mysql_errno = 9;
	end if;
end
//

create procedure listarAdministrador(in codigo int)
begin
	declare x int;
    set x = validar_administrador(codigo);
    if x = 1 then
		select num_adm,idEmpleado from administrador
        where codigo = num_adm;
    else
		signal sqlstate '45000' set message_text = 'Administrador no existe', mysql_errno = 10;
    end if;
end
//

-- procedimientos para tabla compras --
create procedure eliminarCompras(in codigo int)
begin
	declare x int;
    set x = validar_compras(codigo);
    if x = 1 then
		delete from compras
        where id=codigo;
     else
		signal sqlstate '45000' set message_text = 'No existe compras', mysql_errno = 10;
	end if;
end
//

create procedure editarCompras(in codigo int, in nv_idAdm int, in nv_monto int, in nv_fecha datetime, in nv_prov VARCHAR(100), in nv_marca VARCHAR(100), in nv_carac VARCHAR(200))
begin
    declare x int;
    set x = validar_compras(codigo);
    if nv_idAdm is null or nv_monto is null or nv_fecha is null or nv_prov is null or nv_marca is null or nv_carac is null then
		signal sqlstate '45000' set message_text = 'No se capturaron compras', mysql_errno = 7;
	end if;
    if x = 1 then
		update compras set `idAdm`= nv_idAdm, `monto`= nv_monto, `fecha`= nv_fecha, `nom_Provedor`= nv_prov, `marca`= nv_marca, `caracteristicas`= nv_carac WHERE `id`= codigo;
     else
		signal sqlstate '45000' set message_text = 'Compra no existe', mysql_errno = 10;
	end if;
end
//

create procedure insertarCompras(in codigo int, in nv_idAdm int, in nv_monto int, in nv_fecha datetime, in nv_prov VARCHAR(100), in nv_marca VARCHAR(100), in nv_carac VARCHAR(200))
begin
	declare x int;
    set x = validar_compras(codigo);
    if nv_idAdm is null or nv_monto is null or nv_fecha is null or nv_prov is null or nv_marca is null or nv_carac is null then
		signal sqlstate '45000' set message_text = 'No se capturaron compras', mysql_errno = 8;
    end if;
    if x = 0 then
		insert into compras (`id`, `idAdm`, `monto`, `fecha`, `nom_Provedor`, `marca`, `caracteristicas`) values (codigo, nv_idAdm, nv_monto, nv_fecha, nv_prov, nv_marca, nv_carac);
     else
		signal sqlstate '45000' set message_text = 'Compra no existe', mysql_errno = 10;
	end if;
end
//

create procedure listarCompras(in codigo int)
begin
	declare x int;
    set x = validar_compras(codigo);
    if x = 1 then
		select codigo as 'ID Compras', a.marca as 'Marca del articulo', i.caracteristicas as 'Caracteristica del articulo' from compras i
        inner join compras a on a.id=codigo;
    else
		signal sqlstate '45000' set message_text = 'No existe compras registradas', mysql_errno = 10;
    end if;
end
//


delimiter ;