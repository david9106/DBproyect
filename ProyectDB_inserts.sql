use ProyectBD;

INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('1', 'Motor', 'Cummins ISX', '2007', 'Repaired', '250000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('2', 'Crankshaft', 'Caterpillar C15', '2009', 'new', '20000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('3', 'CamShaft', 'Detroit S60', '2003', 'Preowen', '16000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('4', 'Cylinder head valvules Kit', 'Volvo', '2012', 'New', '3600');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('5', 'Cylinder head', 'Caterpillar ', '2008', 'New', '55000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('6', 'Cylinder Piston Set', 'Cummins ISX', '2005', 'New', '40000');
INSERT INTO `ProyectBD`.`Article` (`id`, `ArticleName`, `trademark`, `ArticleYear`, `characteristics`, `price`) VALUES ('7', 'Water Pump', 'Detroit DDEC15', '2010', 'New', '3000');

INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('1', '1');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('2', '5');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('3', '10');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('4', '25');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('5', '1');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('6', '4');
INSERT INTO `ProyectBD`.`Inventory` (`idArticle`, `quantity`) VALUES ('7', '3');

INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('1', 'David', 'Gutierrez', 'DG');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('2', 'Humberto', 'Trujillo', 'HT');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('3', 'Marcos', 'Carrera', 'MC');
INSERT INTO `ProyectBD`.`Users` (`id`, `UserName`, `LastName`, `pass`) VALUES ('4', 'Jesus', 'Garcia', 'JG');


INSERT INTO `ProyectBD`.`Administrator` (`NumAdm`, `idEmployee`) VALUES ('1', '1');

INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('1', '2016/12/07', '3000', '1', '7', '4');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('2', '2016/12/08', '80000', '2', '6', '2');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('3', '2016/12/15', '10800', '3', '4', '2');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('4', '2016/12/20', '250000', '1', '1', '3');
INSERT INTO `ProyectBD`.`Sales` (`id`, `dateSale`, `amount`, `quantity`, `idArticle`, `idEmployee`) VALUES ('5', '2016/12/29', '112000', '7', '3', '1');

INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('1', '2016/12/06', '2016/12/06');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('2', '2016/12/07', '2016/12/07');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('3', '2016/12/14', '2016/12/14');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('4', '2016/12/19', '2016/12/19');
INSERT INTO `ProyectBD`.`Warranty` (`idSale`, `DateStart`, `DateEnd`) VALUES ('5', '2016/12/28', '2016/12/28');

INSERT INTO `ProyectBD`.`Purchases` (`id`, `idAdm`, `amount`, `DatePurchase`, `name_Provider`, `trademark`, `characteristics`) VALUES ('1', '1', '30000', '2016/12/10', 'Cummis', 'Eaton transmission', 'New');
INSERT INTO `ProyectBD`.`Purchases` (`id`, `idAdm`, `amount`, `DatePurchase`, `name_Provider`, `trademark`, `characteristics`) VALUES ('2', '1', '5000', '2016/12/22', 'International', 'Turbo ISX', 'New');

