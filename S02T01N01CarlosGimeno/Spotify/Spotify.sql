-- MySQL Script generated by MySQL Workbench
-- Tue Jul 12 18:23:14 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Spotify` DEFAULT CHARACTER SET utf8 ;
USE `Spotify` ;

-- -----------------------------------------------------
-- Table `Spotify`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`usuari` (
  `idusuari` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nom_usuari` VARCHAR(45) NOT NULL,
  `data_naixement` VARCHAR(45) NOT NULL,
  `sexe` VARCHAR(45) NULL,
  `país` VARCHAR(45) NOT NULL,
  `codi_postal` INT NULL,
  `tipo_cuenta` ENUM('premium', 'basica') NOT NULL,
  PRIMARY KEY (`idusuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`PayPal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`PayPal` (
  `idPayPal` INT NOT NULL,
  `nom_usuari_paypal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPayPal`),
  UNIQUE INDEX `nom_usuari_paypal_UNIQUE` (`nom_usuari_paypal` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`targeta_crèdit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`targeta_crèdit` (
  `idtargeta_crèdit` INT NOT NULL,
  `nùmero` VARCHAR(45) NOT NULL,
  `data_caducitat` DATE NOT NULL,
  `codi_seguretat` TINYINT(3) NOT NULL,
  PRIMARY KEY (`idtargeta_crèdit`),
  UNIQUE INDEX `nùmero_UNIQUE` (`nùmero` ASC) VISIBLE,
  UNIQUE INDEX `idtargeta_crèdit_UNIQUE` (`idtargeta_crèdit` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`suscripcions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`suscripcions` (
  `idsuscripcions` INT NOT NULL,
  `data_inici` DATE NOT NULL,
  `data_renovacio` DATE NOT NULL,
  `tipo_pagament` INT NOT NULL,
  `usuari_idusuari` INT NOT NULL,
  PRIMARY KEY (`idsuscripcions`),
  INDEX `fk_suscripcions_usuari_idx` (`usuari_idusuari` ASC) VISIBLE,
  INDEX `FK_Tipo_pago_idx` (`tipo_pagament` ASC) VISIBLE,
  CONSTRAINT `fk_suscripcions_usuari`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `Spotify`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Tipo_pago_paypal`
    FOREIGN KEY (`tipo_pagament`)
    REFERENCES `Spotify`.`PayPal` (`idPayPal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tipo_pago_tarjeta`
    FOREIGN KEY (`tipo_pagament`)
    REFERENCES `Spotify`.`targeta_crèdit` (`idtargeta_crèdit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`pagaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`pagaments` (
  `idpagaments` INT NOT NULL,
  `data` DATE NOT NULL,
  `total` DOUBLE NOT NULL,
  `usuari_idusuari` INT NOT NULL,
  PRIMARY KEY (`idpagaments`),
  INDEX `fk_pagaments_usuari1_idx` (`usuari_idusuari` ASC) VISIBLE,
  CONSTRAINT `fk_pagaments_usuari1`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `Spotify`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`play_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`play_list` (
  `idplay_list` INT NOT NULL,
  `títol` VARCHAR(45) NOT NULL,
  `nombre_cançons` INT NULL,
  `data_creació` DATE NULL,
  `usuari_idusuari` INT NOT NULL,
  PRIMARY KEY (`idplay_list`),
  INDEX `fk_play_list_usuari1_idx` (`usuari_idusuari` ASC) VISIBLE,
  CONSTRAINT `fk_play_list_usuari1`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `Spotify`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`eliminada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`eliminada` (
  `ideliminada` INT NOT NULL,
  `data_eliminació` INT NOT NULL,
  `usuari_idusuari` INT NOT NULL,
  `play_list_idplay_list` INT NOT NULL,
  PRIMARY KEY (`ideliminada`),
  INDEX `fk_eliminada_usuari1_idx` (`usuari_idusuari` ASC) VISIBLE,
  INDEX `fk_eliminada_play_list1_idx` (`play_list_idplay_list` ASC) VISIBLE,
  CONSTRAINT `fk_eliminada_usuari1`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `Spotify`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_eliminada_play_list1`
    FOREIGN KEY (`play_list_idplay_list`)
    REFERENCES `Spotify`.`play_list` (`idplay_list`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`afegir_cançó`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`afegir_cançó` (
  `idafegir_cançó` INT NOT NULL,
  `data_incerció` DATE NOT NULL,
  `play_list_idplay_list` INT NOT NULL,
  `usuari_idusuari` INT NOT NULL,
  PRIMARY KEY (`idafegir_cançó`),
  INDEX `fk_afegir_cançó_play_list1_idx` (`play_list_idplay_list` ASC) VISIBLE,
  INDEX `fk_afegir_cançó_usuari1_idx` (`usuari_idusuari` ASC) VISIBLE,
  CONSTRAINT `fk_afegir_cançó_play_list1`
    FOREIGN KEY (`play_list_idplay_list`)
    REFERENCES `Spotify`.`play_list` (`idplay_list`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_afegir_cançó_usuari1`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `Spotify`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`artista` (
  `idartidts` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `imatge_artista` BLOB(1024) NULL,
  `etiqueta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idartidts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`àlbum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`àlbum` (
  `idàlbum` INT NOT NULL,
  `tìtol` VARCHAR(45) NULL,
  `any_publicació` DATE NULL,
  `imatge_portada` BLOB(1024) NULL,
  `artista_idartidts` INT NOT NULL,
  PRIMARY KEY (`idàlbum`),
  INDEX `fk_àlbum_artista1_idx` (`artista_idartidts` ASC) VISIBLE,
  CONSTRAINT `fk_àlbum_artista1`
    FOREIGN KEY (`artista_idartidts`)
    REFERENCES `Spotify`.`artista` (`idartidts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`cançó`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`cançó` (
  `idcançó` INT NOT NULL,
  `títol` VARCHAR(45) NOT NULL,
  `durada` DOUBLE NULL,
  `reproduccions` INT NULL,
  `àlbum_idàlbum` INT NOT NULL,
  PRIMARY KEY (`idcançó`),
  INDEX `fk_cançó_àlbum1_idx` (`àlbum_idàlbum` ASC) VISIBLE,
  CONSTRAINT `fk_cançó_àlbum1`
    FOREIGN KEY (`àlbum_idàlbum`)
    REFERENCES `Spotify`.`àlbum` (`idàlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`favorits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`favorits` (
  `idfavorits` INT NOT NULL,
  `usuari_idusuari` INT NOT NULL,
  `artista_idartidts` INT NOT NULL,
  `àlbum_idàlbum` INT NOT NULL,
  `cançó_idcançó` INT NOT NULL,
  PRIMARY KEY (`idfavorits`, `cançó_idcançó`),
  INDEX `fk_favorits_usuari1_idx` (`usuari_idusuari` ASC) VISIBLE,
  INDEX `fk_favorits_artista1_idx` (`artista_idartidts` ASC) VISIBLE,
  INDEX `fk_favorits_àlbum1_idx` (`àlbum_idàlbum` ASC) VISIBLE,
  INDEX `fk_favorits_cançó1_idx` (`cançó_idcançó` ASC) VISIBLE,
  CONSTRAINT `fk_favorits_usuari1`
    FOREIGN KEY (`usuari_idusuari`)
    REFERENCES `Spotify`.`usuari` (`idusuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorits_artista1`
    FOREIGN KEY (`artista_idartidts`)
    REFERENCES `Spotify`.`artista` (`idartidts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorits_àlbum1`
    FOREIGN KEY (`àlbum_idàlbum`)
    REFERENCES `Spotify`.`àlbum` (`idàlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorits_cançó1`
    FOREIGN KEY (`cançó_idcançó`)
    REFERENCES `Spotify`.`cançó` (`idcançó`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
