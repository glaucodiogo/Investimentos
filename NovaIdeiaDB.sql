-- ************************************** `Acoes`
DROP TABLE IF EXISTS `Acoes`;
CREATE TABLE `Acoes`
(
 `Id`        int NOT NULL ,
 `Descricao` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);

-- ************************************** `Carteiras`
DROP TABLE IF EXISTS `Carteiras`;
CREATE TABLE `Carteiras`
(
 `Id`        int NOT NULL ,
 `Descricao` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);

-- ************************************** `Cdbs`
DROP TABLE IF EXISTS `Cdbs`;
CREATE TABLE `Cdbs`
(
 `Id`        int NOT NULL ,
 `Descricao` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);

-- ************************************** `Corretoras`
DROP TABLE IF EXISTS `Corretoras`;
CREATE TABLE `Corretoras`
(
 `Id`        int NOT NULL ,
 `Descricao` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);

-- ************************************** `FundosImobiliarios`
DROP TABLE IF EXISTS `FundosImobiliarios`;
CREATE TABLE `FundosImobiliarios`
(
 `Id`        int NOT NULL ,
 `Descricao` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);

-- ************************************** `TesourosDiretos`
DROP TABLE IF EXISTS `TesourosDiretos`;
CREATE TABLE `TesourosDiretos`
(
 `Id`        int NOT NULL ,
 `Descricao` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);


-- ************************************** `RendaFixa`
DROP TABLE IF EXISTS `RendaFixa`;
CREATE TABLE `RendaFixa`
(
 `Id`                int NOT NULL ,
 `Descricao`         varchar(45) NOT NULL ,
 `IdCdbs`            int NOT NULL ,
 `IdTesourosDiretos` int NOT NULL ,

PRIMARY KEY (`Id`),
KEY `fkIdx_108` (`IdCdbs`),
CONSTRAINT `FK_108` FOREIGN KEY `fkIdx_108` (`IdCdbs`) REFERENCES `Cdbs` (`Id`),
KEY `fkIdx_125` (`IdTesourosDiretos`),
CONSTRAINT `FK_125` FOREIGN KEY `fkIdx_125` (`IdTesourosDiretos`) REFERENCES `TesourosDiretos` (`Id`)
);

-- ************************************** `RendaVariavel`
DROP TABLE IF EXISTS `RendaVariavel`;
CREATE TABLE `RendaVariavel`
(
 `Id`                   int NOT NULL ,
 `Descricao`            varchar(45) NOT NULL ,
 `IdAcoes`              int NULL ,
 `IdFundosImobiliarios` int NULL ,

PRIMARY KEY (`Id`),
KEY `fkIdx_101` (`IdFundosImobiliarios`),
CONSTRAINT `FK_101` FOREIGN KEY `fkIdx_101` (`IdFundosImobiliarios`) REFERENCES `FundosImobiliarios` (`Id`),
KEY `fkIdx_94` (`IdAcoes`),
CONSTRAINT `FK_94` FOREIGN KEY `fkIdx_94` (`IdAcoes`) REFERENCES `Acoes` (`Id`)
);



-- ************************************** `TipoMovimentacoes`
DROP TABLE IF EXISTS `TipoMovimentacoes`;
CREATE TABLE `TipoMovimentacoes`
(
 `Id`   int NOT NULL ,
 `Tipo` varchar(45) NOT NULL ,

PRIMARY KEY (`Id`)
);
-- ************************************** `Movimentacoes`
DROP TABLE IF EXISTS `Movimentacoes`;
CREATE TABLE `Movimentacoes`
(
 `Id`                 bigint NOT NULL ,
 `IdTipoMovimentacao` int NOT NULL ,
 `IdRendaFixa`        int NULL ,
 `IdRendaVariavel`    int NULL ,
 `IdCarteira`         int NOT NULL ,
 `Valor`              float NOT NULL ,
 `DataCadastro`       datetime NOT NULL ,
 `DataAtualizacao`    datetime NOT NULL ,
 `Total`              float NOT NULL ,
 `Quantidade`         int NOT NULL ,
 `IdCorretora`        int NOT NULL ,

PRIMARY KEY (`Id`),
KEY `fkIdx_111` (`IdCarteira`),
CONSTRAINT `FK_111` FOREIGN KEY `fkIdx_111` (`IdCarteira`) REFERENCES `Carteiras` (`Id`),
KEY `fkIdx_138` (`IdCorretora`),
CONSTRAINT `FK_138` FOREIGN KEY `fkIdx_138` (`IdCorretora`) REFERENCES `Corretoras` (`Id`),
KEY `fkIdx_81` (`IdTipoMovimentacao`),
CONSTRAINT `FK_81` FOREIGN KEY `fkIdx_81` (`IdTipoMovimentacao`) REFERENCES `TipoMovimentacoes` (`Id`),
KEY `fkIdx_84` (`IdRendaFixa`),
CONSTRAINT `FK_84` FOREIGN KEY `fkIdx_84` (`IdRendaFixa`) REFERENCES `RendaFixa` (`Id`),
KEY `fkIdx_91` (`IdRendaVariavel`),
CONSTRAINT `FK_91` FOREIGN KEY `fkIdx_91` (`IdRendaVariavel`) REFERENCES `RendaVariavel` (`Id`)
);

