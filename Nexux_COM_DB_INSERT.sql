use Nexus_COM;

INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('1', 'IdeadPad G40-45', 'Lenovo', 'Nueva', '4500');
INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('2', 'Pavilion 19-2113w', 'HP', 'Nueva', '2000');
INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('3', 'Inspiron 3646', 'Dell', 'Nueva', '2500');
INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('4', 'Aspire ES1', 'Acer', 'Nueva', '3000');
INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('5', 'Macbook Pro A1286', 'Apple', 'Nueva', '5500');
INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('6', 'Satellite Radio p55w-c5208x', 'Toshiba', 'Nueva', '4500');
INSERT INTO `nexus_com`.`Articulo` (`id`, `nombre`, `marca`, `caracteristicas`, `precio`) VALUES ('7', 'VivoBook E402SA', 'Asus', 'Nueva', '4000');

INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('1', '2');
INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('2', '3');
INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('3', '3');
INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('4', '1');
INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('5', '2');
INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('6', '3');
INSERT INTO `nexus_com`.`Inventario` (`idArticulo`, `cantidad`) VALUES ('7', '1');

INSERT INTO `nexus_com`.`Usuario` (`id`, `nombres`, `apellido_P`, `apellido_M`, `pass`) VALUES ('1', 'Erick', 'Blanco', 'Puerto', 'EBP');
INSERT INTO `nexus_com`.`Usuario` (`id`, `nombres`, `apellido_P`, `apellido_M`, `pass`) VALUES ('2', 'Fernando', 'Ordaz', 'Zamora', 'FOZ');
INSERT INTO `nexus_com`.`Usuario` (`id`, `nombres`, `apellido_P`, `apellido_M`, `pass`) VALUES ('3', 'Rogelio', 'Perez', 'Garcia', 'RPG');

INSERT INTO `nexus_com`.`Administrador` (`num_adm`, `idEmpleado`) VALUES ('1', '1');

INSERT INTO `nexus_com`.`Ventas` (`id`, `fecha`, `monto`, `idArticulo`, `idEmpleado`) VALUES ('1', '2016/05/07', '1', '1', '2');
INSERT INTO `nexus_com`.`Ventas` (`id`, `fecha`, `monto`, `idArticulo`, `idEmpleado`) VALUES ('2', '2016/05/08', '1', '2', '3');
INSERT INTO `nexus_com`.`Ventas` (`id`, `fecha`, `monto`, `idArticulo`, `idEmpleado`) VALUES ('3', '2016/05/15', '2', '3', '2');
INSERT INTO `nexus_com`.`Ventas` (`id`, `fecha`, `monto`, `idArticulo`, `idEmpleado`) VALUES ('4', '2016/05/20', '1', '5', '2');
INSERT INTO `nexus_com`.`Ventas` (`id`, `fecha`, `monto`, `idArticulo`, `idEmpleado`) VALUES ('5', '2016/05/29', '3', '6', '3');

INSERT INTO `nexus_com`.`Garantia` (`idVenta`, `fechaIni`, `fechaFin`) VALUES ('1', '2016/05/07', '2016/06/07');
INSERT INTO `nexus_com`.`Garantia` (`idVenta`, `fechaIni`, `fechaFin`) VALUES ('2', '2016/05/08', '2016/06/08');
INSERT INTO `nexus_com`.`Garantia` (`idVenta`, `fechaIni`, `fechaFin`) VALUES ('3', '2016/05/15', '2016/06/15');
INSERT INTO `nexus_com`.`Garantia` (`idVenta`, `fechaIni`, `fechaFin`) VALUES ('4', '2016/05/20', '2016/06/20');
INSERT INTO `nexus_com`.`Garantia` (`idVenta`, `fechaIni`, `fechaFin`) VALUES ('5', '2016/05/29', '2016/06/29');

INSERT INTO `nexus_com`.`Compras` (`id`, `idAdm`, `monto`, `fecha`, `nom_Provedor`, `marca`, `caracteristicas`) VALUES ('1', '1', '2500', '2016/05/10', 'Jose Tapia', 'Toshiba Satellite', 'Nueva');
INSERT INTO `nexus_com`.`Compras` (`id`, `idAdm`, `monto`, `fecha`, `nom_Provedor`, `marca`, `caracteristicas`) VALUES ('2', '1', '2000', '2016/05/22', 'Manuel Garcia', 'HP Pavilion', 'Nueva');

INSERT INTO `nexus_com`.`Caja` (`idVenta`, `idEmpleado`) VALUES ('1', '2');
INSERT INTO `nexus_com`.`Caja` (`idVenta`, `idEmpleado`) VALUES ('3', '2');
INSERT INTO `nexus_com`.`Caja` (`idVenta`, `idEmpleado`) VALUES ('4', '2');
INSERT INTO `nexus_com`.`Caja` (`idVenta`, `idEmpleado`) VALUES ('2', '3');
INSERT INTO `nexus_com`.`Caja` (`idVenta`, `idEmpleado`) VALUES ('5', '3');
