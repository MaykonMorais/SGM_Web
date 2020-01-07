-- MySQL Script generated by MySQL Workbench
-- seg 06 jan 2020 23:15:25 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`admin` (
  `idadmin` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `matricula` VARCHAR(10) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`idadmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`muda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`muda` (
  `idmuda` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `valor` FLOAT NOT NULL,
  `tipo_unitario` ENUM('ornamental', 'medicinal', 'fruteira-muda', 'nativa-muda') NOT NULL,
  `estoque_minimo` INT NOT NULL,
  `estoque_atual` INT NOT NULL,
  PRIMARY KEY (`idmuda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`entrada` (
  `identrada` BIGINT NOT NULL AUTO_INCREMENT,
  `fornecedor` ENUM('setor de mudas', 'outros') NOT NULL,
  `data` DATETIME NOT NULL,
  `quantiade` INT NOT NULL,
  `muda_idmuda` BIGINT NOT NULL,
  `admin_idadmin` BIGINT NOT NULL,
  PRIMARY KEY (`identrada`),
  INDEX `fk_entrada_muda_idx` (`muda_idmuda` ASC) VISIBLE,
  INDEX `fk_entrada_admin1_idx` (`admin_idadmin` ASC) VISIBLE,
  CONSTRAINT `fk_entrada_muda`
    FOREIGN KEY (`muda_idmuda`)
    REFERENCES `mydb`.`muda` (`idmuda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrada_admin1`
    FOREIGN KEY (`admin_idadmin`)
    REFERENCES `mydb`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_usuario` (
  `idtipo_usuario` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` BIGINT NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(14) NULL,
  `CNPJ` VARCHAR(14) NULL,
  `matricula` VARCHAR(10) NULL,
  `nome` VARCHAR(150) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  `tipo_usuario_idtipo_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tipo_usuario1`
    FOREIGN KEY (`tipo_usuario_idtipo_usuario`)
    REFERENCES `mydb`.`tipo_usuario` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`saida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`saida` (
  `idsaida` BIGINT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `quantidade` INT NOT NULL,
  `admin_idadmin` BIGINT NOT NULL,
  `muda_idmuda` BIGINT NOT NULL,
  `usuario_idusuario` BIGINT NOT NULL,
  PRIMARY KEY (`idsaida`),
  INDEX `fk_saida_admin1_idx` (`admin_idadmin` ASC) VISIBLE,
  INDEX `fk_saida_muda1_idx` (`muda_idmuda` ASC) VISIBLE,
  INDEX `fk_saida_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_saida_admin1`
    FOREIGN KEY (`admin_idadmin`)
    REFERENCES `mydb`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_saida_muda1`
    FOREIGN KEY (`muda_idmuda`)
    REFERENCES `mydb`.`muda` (`idmuda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_saida_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`requisicao_muda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`requisicao_muda` (
  `idrequisicao_muda` BIGINT NOT NULL AUTO_INCREMENT,
  `status` ENUM('A', 'N') NOT NULL,
  `data` DATETIME NOT NULL,
  `admin_idadmin` BIGINT NOT NULL,
  `muda_idmuda` BIGINT NOT NULL,
  `usuario_idusuario` BIGINT NOT NULL,
  PRIMARY KEY (`idrequisicao_muda`),
  INDEX `fk_requisicao_muda_admin1_idx` (`admin_idadmin` ASC) VISIBLE,
  INDEX `fk_requisicao_muda_muda1_idx` (`muda_idmuda` ASC) VISIBLE,
  INDEX `fk_requisicao_muda_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_requisicao_muda_admin1`
    FOREIGN KEY (`admin_idadmin`)
    REFERENCES `mydb`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requisicao_muda_muda1`
    FOREIGN KEY (`muda_idmuda`)
    REFERENCES `mydb`.`muda` (`idmuda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requisicao_muda_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`requisicao_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`requisicao_login` (
  `idrequisicao_login` BIGINT NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(14) NULL,
  `CNPJ` VARCHAR(14) NULL,
  `matricula` VARCHAR(10) NULL,
  `nome` VARCHAR(150) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  `status` ENUM('A', 'N') NOT NULL,
  `admin_idadmin` BIGINT NOT NULL,
  `tipo_usuario_idtipo_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`idrequisicao_login`),
  INDEX `fk_requisicao_login_admin1_idx` (`admin_idadmin` ASC) VISIBLE,
  INDEX `fk_requisicao_login_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_requisicao_login_admin1`
    FOREIGN KEY (`admin_idadmin`)
    REFERENCES `mydb`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requisicao_login_tipo_usuario1`
    FOREIGN KEY (`tipo_usuario_idtipo_usuario`)
    REFERENCES `mydb`.`tipo_usuario` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
