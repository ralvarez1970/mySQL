-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_cancoes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_cancoes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_cancoes` DEFAULT CHARACTER SET utf8 ;
USE `db_cancoes` ;

-- -----------------------------------------------------
-- Table `db_cancoes`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cancoes`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_cancoes`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cancoes`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_cancoes`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cancoes`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cancoes_artistas_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `db_cancoes`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_cancoes`.`usuarios_has_cancoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cancoes`.`usuarios_has_cancoes` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  INDEX `fk_usuarios_has_cancoes_cancoes1_idx` (`cancao_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_cancoes_usuarios1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_cancoes_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `db_cancoes`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_cancoes_cancoes1`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `db_cancoes`.`cancoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
