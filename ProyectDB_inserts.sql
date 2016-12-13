use ProyectBD;

INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('1', 'Motor', 'Cummins ISX', '2007', 'Repaired', '250000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('2', 'Crankshaft', 'Caterpillar C15', '2009', 'new', '20000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('3', 'CamShaft', 'Detroit S60', '2003', 'Preowen', '16000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('4', 'Cylinder head valvules Kit', 'Volvo', '2012', 'New', '3600');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('5', 'Cylinder head', 'Caterpillar ', '2008', 'New', '55000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('6', 'Cylinder Piston Set', 'Cummins ISX', '2005', 'New', '40000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('7', 'Water Pump', 'Detroit DDEC15', '2010', 'New', '3000');

INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('8', 'Inyectores', 'Bosch', '2010', 'new', '5000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('9', 'Pila', 'Duracel 12v', '2000', 'new', '1200');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('10', 'Llanta', 'Michelin 15"', '2000', 'New', '1300');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('11', 'Rin', 'Bosch', '2000', 'New', '3600');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('12', 'Cooler fan', 'Caterpillar ', '1998', 'New', '55000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('13', 'Whaiper', 'Rex', '2008', 'New', '23');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('14', 'Water liquit', 'Detroit', '2010', 'New', '3000');





INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('1', '1');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('2', '5');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('3', '10');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('4', '25');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('5', '1');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('6', '4');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('7', '3');


INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('8', '1');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('9', '5');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('10', '10');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('11', '25');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('12', '1');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('13', '4');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('14', '3');

INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('1', 'David', 'Gutierrez', 'DG');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('2', 'Humberto', 'Trujillo', 'HT');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('3', 'Marcos', 'Carrera', 'MC');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('4', 'Jesus', 'Garcia', 'JG');

INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('5', 'Ulises', 'Sandoval', 'US');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('6', 'Ivan', 'Rodriguez', 'IR');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('7', 'Benito', 'Juarez', 'BJ');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('8', 'Jose', 'Garcia', 'JG');

INSERT INTO `ProyectBD`.`Administrator` (`NumAdm`, `idEmployee`) VALUES ('1', '1');
INSERT INTO `ProyectBD`.`Administrator` (`NumAdm`, `idEmployee`) VALUES ('2', '5');

INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('1', '2016/12/07', '3000', '1', '7', '4');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('2', '2016/12/08', '80000', '2', '6', '2');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('3', '2016/12/15', '10800', '3', '4', '2');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('4', '2016/12/20', '250000', '1', '1', '3');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('5', '2016/12/29', '112000', '7', '3', '1');

INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('6', '2016/12/10', '400', '8', '9', '5');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('7', '2016/12/30', '300', '11', '10', '5');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('8', '2016/12/15', '5800', '4', '12', '3');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('9', '2016/12/01', '50000', '5', '4', '3');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('10', '2016/12/03', '12000', '5', '3', '2');

INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('1', '2016/12/06', '2016/12/06');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('2', '2016/12/07', '2016/12/07');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('3', '2016/12/14', '2016/12/14');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('4', '2016/12/19', '2016/12/19');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('5', '2016/12/28', '2016/12/28');

INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('6', '2016/01/20', '2016/04/20');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('7', '2016/03/12', '2016/06/12');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('8', '2016/04/11', '2016/08/11');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('9', '2016/06/14', '2016/11/14');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('10', '2016/12/09', '2017/01/09');

INSERT INTO `ProyectBD`.`Purchases` (`id`, `idAdm`, `amount`, `DatePurchase`, `name_Provider`, `trademark`, `characteristics`) VALUES ('1', '1', '30000', '2016/12/10', 'Cummis', 'Eaton transmission', 'New');
INSERT INTO `ProyectBD`.`Purchases` (`id`, `idAdm`, `amount`, `DatePurchase`, `name_Provider`, `trademark`, `characteristics`) VALUES ('2', '1', '5000', '2016/12/22', 'International', 'Turbo ISX', 'New');


INSERT INTO `ProyectBD`.`Purchases` (`id`, `idAdm`, `amount`, `DatePurchase`, `name_Provider`, `trademark`, `characteristics`) VALUES ('3', '2', '100', '2017/10/09', 'juston', 'Motor', 'New');
INSERT INTO `ProyectBD`.`Purchases` (`id`, `idAdm`, `amount`, `DatePurchase`, `name_Provider`, `trademark`, `characteristics`) VALUES ('4', '2', '1000', '2017/09/22', 'national', 'Lucas', 'New');


