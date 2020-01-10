-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idadmin` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `senha` varchar(64) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','2029381','naruto');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `identrada` bigint(20) NOT NULL AUTO_INCREMENT,
  `fornecedor` enum('setor de mudas','outros') NOT NULL,
  `data` datetime NOT NULL,
  `quantiade` int(11) NOT NULL,
  `muda_idmuda` bigint(20) NOT NULL,
  `admin_idadmin` bigint(20) NOT NULL,
  PRIMARY KEY (`identrada`),
  KEY `fk_entrada_muda_idx` (`muda_idmuda`),
  KEY `fk_entrada_admin1_idx` (`admin_idadmin`),
  CONSTRAINT `fk_entrada_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`),
  CONSTRAINT `fk_entrada_muda` FOREIGN KEY (`muda_idmuda`) REFERENCES `muda` (`idmuda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muda`
--

DROP TABLE IF EXISTS `muda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muda` (
  `idmuda` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` float NOT NULL,
  `tipo_unitario` enum('ornamental','medicinal','fruteira-muda','nativa-muda') NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  `estoque_atual` int(11) NOT NULL,
  PRIMARY KEY (`idmuda`)
) ENGINE=InnoDB AUTO_INCREMENT=2921 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muda`
--

LOCK TABLES `muda` WRITE;
/*!40000 ALTER TABLE `muda` DISABLE KEYS */;
INSERT INTO `muda` VALUES (2918,'manga',20,'ornamental',10,20),(2919,'melancia',20,'ornamental',10,20),(2920,'maracuja',1.5,'nativa-muda',30,30);
/*!40000 ALTER TABLE `muda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisicao_login`
--

DROP TABLE IF EXISTS `requisicao_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisicao_login` (
  `idrequisicao_login` bigint(20) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) DEFAULT NULL,
  `CNPJ` varchar(14) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL,
  `nome` varchar(150) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `status` enum('A','N') NOT NULL,
  `admin_idadmin` bigint(20) NOT NULL,
  `tipo_usuario_idtipo_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`idrequisicao_login`),
  KEY `fk_requisicao_login_admin1_idx` (`admin_idadmin`),
  KEY `fk_requisicao_login_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario`),
  CONSTRAINT `fk_requisicao_login_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`),
  CONSTRAINT `fk_requisicao_login_tipo_usuario1` FOREIGN KEY (`tipo_usuario_idtipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicao_login`
--

LOCK TABLES `requisicao_login` WRITE;
/*!40000 ALTER TABLE `requisicao_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisicao_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisicao_muda`
--

DROP TABLE IF EXISTS `requisicao_muda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisicao_muda` (
  `idrequisicao_muda` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` enum('A','N') NOT NULL,
  `data` datetime NOT NULL,
  `admin_idadmin` bigint(20) NOT NULL,
  `muda_idmuda` bigint(20) NOT NULL,
  `usuario_idusuario` bigint(20) NOT NULL,
  `qtd_requisitada` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idrequisicao_muda`),
  KEY `fk_requisicao_muda_admin1_idx` (`admin_idadmin`),
  KEY `fk_requisicao_muda_muda1_idx` (`muda_idmuda`),
  KEY `fk_requisicao_muda_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_requisicao_muda_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`),
  CONSTRAINT `fk_requisicao_muda_muda1` FOREIGN KEY (`muda_idmuda`) REFERENCES `muda` (`idmuda`),
  CONSTRAINT `fk_requisicao_muda_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicao_muda`
--

LOCK TABLES `requisicao_muda` WRITE;
/*!40000 ALTER TABLE `requisicao_muda` DISABLE KEYS */;
INSERT INTO `requisicao_muda` VALUES (19,'A','2020-01-09 00:00:00',1,2918,4,20),(20,'A','2020-01-09 00:00:00',1,2918,4,20),(21,'A','2020-01-09 00:00:00',1,2918,4,20),(22,'A','2020-01-09 00:00:00',1,2918,4,20),(23,'A','2020-01-09 00:00:00',1,2918,4,20),(24,'A','2020-01-09 00:00:00',1,2918,4,20),(25,'A','2020-01-09 00:00:00',1,2918,4,30),(26,'A','2020-01-09 00:00:00',1,2918,4,30),(27,'A','2020-01-09 00:00:00',1,2919,4,50);
/*!40000 ALTER TABLE `requisicao_muda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saida`
--

DROP TABLE IF EXISTS `saida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saida` (
  `idsaida` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `quantidade` int(11) NOT NULL,
  `admin_idadmin` bigint(20) NOT NULL,
  `muda_idmuda` bigint(20) NOT NULL,
  `usuario_idusuario` bigint(20) NOT NULL,
  PRIMARY KEY (`idsaida`),
  KEY `fk_saida_admin1_idx` (`admin_idadmin`),
  KEY `fk_saida_muda1_idx` (`muda_idmuda`),
  KEY `fk_saida_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_saida_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`),
  CONSTRAINT `fk_saida_muda1` FOREIGN KEY (`muda_idmuda`) REFERENCES `muda` (`idmuda`),
  CONSTRAINT `fk_saida_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saida`
--

LOCK TABLES `saida` WRITE;
/*!40000 ALTER TABLE `saida` DISABLE KEYS */;
/*!40000 ALTER TABLE `saida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `idtipo_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'aluno');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) DEFAULT NULL,
  `CNPJ` varchar(14) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL,
  `nome` varchar(150) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `tipo_usuario_idtipo_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario`),
  CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario_idtipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (4,'282.923.291-43','000.000.000-0',NULL,'Jose Maria','naruto',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-10 16:36:24
