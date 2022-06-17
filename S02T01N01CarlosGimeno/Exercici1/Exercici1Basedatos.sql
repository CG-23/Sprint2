-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cul_D'ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cul_D'ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul_D'ampolla` DEFAULT CHARACTER SET utf8 ;
USE `Cul_D'ampolla` ;

-- -----------------------------------------------------
-- Table `Cul_D'ampolla`.`Proveïdors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_D'ampolla`.`Proveïdors` (
  `Id_Proveïdor` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(40) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telèfon` INT NOT NULL,
  `Fax` INT NULL,
  `NIF` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`Id_Proveïdor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_D'ampolla`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_D'ampolla`.`Ulleres` (
  `id_Ulleres` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NOT NULL,
  `Graduació_dret` FLOAT NOT NULL,
  `Graduació_esquerra` FLOAT NOT NULL,
  `Tipo_Montura` VARCHAR(45) NOT NULL,
  `Color_Montura` VARCHAR(45) NOT NULL,
  `Color_Vidre` VARCHAR(45) NOT NULL,
  `Preu` FLOAT NOT NULL,
  `Id_proveïdor` INT NOT NULL,
  PRIMARY KEY (`id_Ulleres`),
  INDEX `FK_Ulleres_IdProvaïdor_idx` (`Id_proveïdor` ASC) VISIBLE,
  CONSTRAINT `FK_Ulleres_IdProvaïdor`
    FOREIGN KEY (`Id_proveïdor`)
    REFERENCES `Cul_D'ampolla`.`Proveïdors` (`Id_Proveïdor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_D'ampolla`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_D'ampolla`.`Client` (
  `id_Client` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(75) NOT NULL,
  `Telèfon` INT NOT NULL,
  `Correu_electronic` VARCHAR(80) NULL,
  `Data_Registre` DATE NOT NULL,
  `Ulleres` INT NOT NULL,
  `Recomanacío` VARCHAR(45) NULL,
  `Venedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Client`),
  INDEX `FK_Client_Ulleres_idx` (`Ulleres` ASC) VISIBLE,
  CONSTRAINT `FK_Client_Ulleres`
    FOREIGN KEY (`Ulleres`)
    REFERENCES `Cul_D'ampolla`.`Ulleres` (`id_Ulleres`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
