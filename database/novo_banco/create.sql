CREATE DATABASE  IF NOT EXISTS `gpm_database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gpm_database`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gpm_database
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `idadmin` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `senha` varchar(64) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_entrada_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrada_muda` FOREIGN KEY (`muda_idmuda`) REFERENCES `muda` (`idmuda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `muda`
--

DROP TABLE IF EXISTS `muda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muda` (
  `idmuda` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` float NOT NULL,
  `tipo_unitario` enum('ornamental','medicinal','fruteira-muda','nativa-muda') NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  `estoque_atual` int(11) NOT NULL,
  PRIMARY KEY (`idmuda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requisicao_login`
--

DROP TABLE IF EXISTS `requisicao_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisicao_login` (
  `idrequisicao_login` bigint(20) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) DEFAULT NULL,
  `CNPJ` varchar(14) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL,
  `nome` varchar(150) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `status` enum('A','N') NOT NULL,
  `tipo` enum('aluno','professor') NOT NULL,
  `admin_idadmin` bigint(20) NOT NULL,
  PRIMARY KEY (`idrequisicao_login`),
  KEY `fk_requisicao_login_admin1_idx` (`admin_idadmin`),
  CONSTRAINT `fk_requisicao_login_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requisicao_muda`
--

DROP TABLE IF EXISTS `requisicao_muda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisicao_muda` (
  `idrequisicao_muda` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` enum('A','N') NOT NULL,
  `data` datetime NOT NULL,
  `admin_idadmin` bigint(20) NOT NULL,
  `muda_idmuda` bigint(20) NOT NULL,
  `usuario_idusuario` bigint(20) NOT NULL,
  PRIMARY KEY (`idrequisicao_muda`),
  KEY `fk_requisicao_muda_admin1_idx` (`admin_idadmin`),
  KEY `fk_requisicao_muda_muda1_idx` (`muda_idmuda`),
  KEY `fk_requisicao_muda_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_requisicao_muda_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requisicao_muda_muda1` FOREIGN KEY (`muda_idmuda`) REFERENCES `muda` (`idmuda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requisicao_muda_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saida`
--

DROP TABLE IF EXISTS `saida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_saida_admin1` FOREIGN KEY (`admin_idadmin`) REFERENCES `admin` (`idadmin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_saida_muda1` FOREIGN KEY (`muda_idmuda`) REFERENCES `muda` (`idmuda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_saida_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `idtipo_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario_idtipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-03 18:08:46
