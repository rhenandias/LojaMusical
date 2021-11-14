-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: LojaMusical
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (2,'Acessórios'),(3,'Cordas'),(4,'Percursão'),(5,'Sopro'),(6,'Instrumento de Teclas');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compra`
--

DROP TABLE IF EXISTS `Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compra` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_idStatusAndamento_compra` (`idStatus`),
  KEY `fk_idFornecedor_compra` (`idFornecedor`),
  CONSTRAINT `fk_idFornecedor_compra` FOREIGN KEY (`idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_idStatusAndamento_compra` FOREIGN KEY (`idStatus`) REFERENCES `StatusAndamento` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compra`
--

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompraProduto`
--

DROP TABLE IF EXISTS `CompraProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompraProduto` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `quantidde` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idCompra`,`idProduto`),
  KEY `fk_idProduto_CompraProduto` (`idProduto`),
  CONSTRAINT `fk_idCompra` FOREIGN KEY (`idCompra`) REFERENCES `Compra` (`idCompra`),
  CONSTRAINT `fk_idProduto_CompraProduto` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompraProduto`
--

LOCK TABLES `CompraProduto` WRITE;
/*!40000 ALTER TABLE `CompraProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompraProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedor`
--

DROP TABLE IF EXISTS `Fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpfcnpj` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `uf` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedor`
--

LOCK TABLES `Fornecedor` WRITE;
/*!40000 ALTER TABLE `Fornecedor` DISABLE KEYS */;
INSERT INTO `Fornecedor` VALUES (1,'Tagima','123456789','Rua da Tagima','07124000','11 98989 8989','tagima@email.com','SP','Guarulhos'),(2,'Yamaha','123456789','Rua da Yamaha','07124000','11 6565 4343','yamaha@email.com','MG','Extrema'),(3,'Casio','123456789','Rua da Casio','07124123','11 6565 4343','casio@email.com','RJ','Tijuca');
/*!40000 ALTER TABLE `Fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NivelUsuario`
--

DROP TABLE IF EXISTS `NivelUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NivelUsuario` (
  `idNivelUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idNivelUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NivelUsuario`
--

LOCK TABLES `NivelUsuario` WRITE;
/*!40000 ALTER TABLE `NivelUsuario` DISABLE KEYS */;
INSERT INTO `NivelUsuario` VALUES (1,'Cliente'),(2,'Administrador');
/*!40000 ALTER TABLE `NivelUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `custo` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_idFornecedor` (`idFornecedor`),
  KEY `fk_idCategoria` (`idCategoria`),
  CONSTRAINT `fk_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`),
  CONSTRAINT `fk_idFornecedor` FOREIGN KEY (`idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES (0,3,1,'Violão de Estudos Tagima','Tagima',259.99,159.99,5,''),(1,3,2,'Violão Cordas Metálicas - Yamaha','Yamaha',111.99,222.99,5,''),(2,3,3,'Violão Elétrico - Casio','Casio',200.00,50.00,2,'');
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatusAndamento`
--

DROP TABLE IF EXISTS `StatusAndamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatusAndamento` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatusAndamento`
--

LOCK TABLES `StatusAndamento` WRITE;
/*!40000 ALTER TABLE `StatusAndamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `StatusAndamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idNivelUsuario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `codigoAtivacao` varchar(45) DEFAULT NULL,
  `endereco` varchar(255) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_idNivelUsuario` (`idNivelUsuario`),
  CONSTRAINT `fk_idNivelUsuario` FOREIGN KEY (`idNivelUsuario`) REFERENCES `NivelUsuario` (`idNivelUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venda`
--

DROP TABLE IF EXISTS `Venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Venda` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `fk_idUsuario` (`idUsuario`),
  KEY `fk_idStatusAndamento_venda` (`idStatus`),
  CONSTRAINT `fk_idStatusAndamento_venda` FOREIGN KEY (`idStatus`) REFERENCES `StatusAndamento` (`idStatus`),
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venda`
--

LOCK TABLES `Venda` WRITE;
/*!40000 ALTER TABLE `Venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `Venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VendaProduto`
--

DROP TABLE IF EXISTS `VendaProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VendaProduto` (
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idVenda`,`idProduto`),
  KEY `fk_idProduto_VendaProduto` (`idProduto`),
  CONSTRAINT `fk_idProduto_VendaProduto` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`),
  CONSTRAINT `fk_idVenda` FOREIGN KEY (`idVenda`) REFERENCES `Venda` (`idVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VendaProduto`
--

LOCK TABLES `VendaProduto` WRITE;
/*!40000 ALTER TABLE `VendaProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `VendaProduto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13 23:28:13
