-- MySQL Script generated by MySQL Workbench
-- mié 15 nov 2017 20:51:51 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema conta2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema conta2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `conta2` DEFAULT CHARACTER SET latin1 ;
USE `conta2` ;

-- -----------------------------------------------------
-- Table `conta2`.`telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta2`.`telefono` (
  `numero` VARCHAR(145) NOT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `conta2`.`encargado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta2`.`encargado` (
  `idencargado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `apellidos` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `fechaNac` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `encargadoPadre` INT(11) NULL DEFAULT NULL,
  `telefono_numero` VARCHAR(145) NOT NULL,
  PRIMARY KEY (`idencargado`, `telefono_numero`),
  INDEX `fk_encargado_telefono1` (`telefono_numero` ASC),
  CONSTRAINT `fk_encargado_telefono1`
    FOREIGN KEY (`telefono_numero`)
    REFERENCES `conta2`.`telefono` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `conta2`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta2`.`empresa` (
  `idempresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `email` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `direccion` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `empresaPadre` INT(11) NULL DEFAULT NULL,
  `encargado_idencargado` INT(11) NOT NULL,
  PRIMARY KEY (`idempresa`, `encargado_idencargado`),
  INDEX `fk_empresa_encargado1` (`encargado_idencargado` ASC),
  CONSTRAINT `fk_empresa_encargado1`
    FOREIGN KEY (`encargado_idencargado`)
    REFERENCES `conta2`.`encargado` (`idencargado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `conta2`.`catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta2`.`catalogo` (
  `idcatalogo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `empresa_idempresa` INT(11) NOT NULL,
  PRIMARY KEY (`idcatalogo`, `empresa_idempresa`),
  INDEX `fk_catalogo_empresa1` (`empresa_idempresa` ASC),
  CONSTRAINT `fk_catalogo_empresa1`
    FOREIGN KEY (`empresa_idempresa`)
    REFERENCES `conta2`.`empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `conta2`.`cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta2`.`cuenta` (
  `idcuenta` INT(11) NOT NULL,
  `nombre` VARCHAR(145) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `idpadre` INT(11) NULL DEFAULT NULL,
  `catalogo_idcatalogo` INT(11) NOT NULL,
  `saldo_deudor` INT(11) NOT NULL,
  PRIMARY KEY (`idcuenta`, `catalogo_idcatalogo`),
  INDEX `fk_cuenta_catalogo` (`catalogo_idcatalogo` ASC),
  CONSTRAINT `fk_cuenta_catalogo`
    FOREIGN KEY (`catalogo_idcatalogo`)
    REFERENCES `conta2`.`catalogo` (`idcatalogo`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `conta2`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conta2`.`usuarios` (
  `idusuarios` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(145) NULL DEFAULT NULL,
  `password` VARCHAR(145) NULL DEFAULT NULL,
  `tipo_usuario` INT(1) NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;