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
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (2,'Acessórios','Acessórios de todos os tipos para quem trabalha ou vive no mundo da música!'),(3,'Cordas','Violões, Guitarras, ou Pianos. Aqui você encontra todos os instrumentos de Corda para a sua Banda!'),(4,'Percurssão','Instrumentos para dar o ritmo ideal para o seu grupo e sua apresentação!'),(5,'Sopro','Instrumentos clássicos sopro, faça parte de orquestras com esses instrumentos!'),(6,'Instrumento de Teclas','Seja no teclado, ou na sanfona, os intrumentos de teclas são cada vez mais populares!');
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
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_idFornecedor` (`idFornecedor`),
  KEY `fk_idCategoria` (`idCategoria`),
  CONSTRAINT `fk_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`),
  CONSTRAINT `fk_idFornecedor` FOREIGN KEY (`idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES (0,3,1,'Violao de Estudos Tagima','Tagima',259.99,159.99,5,'produto_0.png','Violão de estudos, ideal para iniciantes na prática de um instrumento de corda.\n\nPossui cordas de nylon, que facilita o aprendizado inicial, além de possui uma empunhadura confortável.\n\nCorpo do violão em madeira de mogno, resistente a quedas e impactos, além de proporcionar uma excelente acústica. '),(1,3,2,'Violao Cordas Metálicas - Yamaha','Yamaha',111.99,222.99,5,'produto_1.png',NULL),(2,3,3,'Violao Elétrico - Casio','Casio',200.00,50.00,2,'produto_2.png',NULL),(3,6,1,'Teclado Digital Casio','Casio',699.99,299.99,2,'produto_4.png',NULL),(4,6,3,'Sintetizador 4 Canais','Casio',300.00,200.00,5,'sintetizador_1.png','Sintetizador digital com até quatro canais de som configurável.\r\n\r\nIdeal para performances de música eletrônica.'),(5,6,2,'Escaleta 2 escalas e meia','Yamaha',159.99,100.99,2,'escaleta_1.png','Escaleta com até duas escalas e meia, som Concert e manuseio ergométrico.\r\n\r\nIdeal para música eletrônica e experimental.'),(6,6,1,'Sanfona 120 Baixos','Tagima',499.99,299.99,4,'sanfona_1.png','Sanfona classica de 120 baixos, o ritmo contagiante do forro.\r\n\r\nAcabamento classico na cor preta, com teclas com acabamento e detalhes de marfim.'),(7,6,2,'Piano Digital Classic','Yamaha',1259.99,899.99,3,'piano_digital_1.png','Piano digital Yamaha, um piano classico porem com som digital.'),(8,3,2,'Piano de Calda Deluxe','Yamaha',2900.99,1900.99,2,'piano_calda_1.png','Piano de calda estilo classico, ideal para concertos e estudos de musica erudita.'),(9,2,2,'Microfone Estereo 1 Canal','Yamaha',249.99,149.99,3,'microfone_1.png','Microfone ideal para gravar voz e instrumentos musicais.'),(10,2,3,'Cabo Guitarra P10','Casio',29.99,9.99,4,'cabo_1.png','Cabo P10 estereo com duas saidas.\r\n\r\nIdeal para utilizacao em guitarras eletricas.'),(11,2,1,'Palheta de Guitarra','Tagima',5.99,1.99,10,'palheta_1.png','Palheta de guitarra na cor cinza, estavel e confortavel.'),(12,2,2,'Pedal Distortion Reverb','Yamaha',452.24,254.24,8,'pedal_1.png','Pedal distortion para efeito em guitarra.\r\n\r\nPedal ideal para todas as bandas, com efeito de reverb.'),(13,5,2,'Flauta Transversal Prata','Yamaha',125.66,100.66,9,'flauta_1.png','Flauta transversal cor prateada, afinacao de musica erudita.\r\n\r\nFlauta transversal com 35 teclas.'),(14,5,3,'Clarinete De Madeira ','Casio',1700.99,999.99,8,'clarinete_1.png','Clarinete classico de madeira.\r\n\r\nO instrumento ideal para compor a grupo de madeiras de uma orquestra.'),(15,5,2,'Trompete Dourado','Yamaha',741.65,328.65,9,'trompete_1.png','Trompete estilo dourado para compor os metais da sua banda.'),(16,5,2,'Flauta Doce Infantil','Yamaha',25.99,5.99,20,'flauta_doce_1.png','A famosa flauta doce infantil, o instrumento ideal para despertar o gosto musical nas criancas.');
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
INSERT INTO `lojamusical`.`StatusAndamento` (`idStatus`,`nome`) VALUES ('1', 'Produto em separação');
INSERT INTO `lojamusical`.`StatusAndamento` (`idStatus`,`nome`) VALUES ('2', 'Enviando para a transportadora');
INSERT INTO `lojamusical`.`StatusAndamento` (`idStatus`,`nome`) VALUES ('3', 'Enviando para o cliente');
INSERT INTO `lojamusical`.`StatusAndamento` (`idStatus`,`nome`) VALUES ('4', 'Pedido recebido');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,1,'Rhenan Dias','diasrhenan@gmail.com','99999999','123123','447654',1,'NUQX6HIXHN','Rua das Ruas','123','Bairro dos Bairros','Cidade das Cidades','null');
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

-- Dump completed on 2021-11-30 23:29:46
