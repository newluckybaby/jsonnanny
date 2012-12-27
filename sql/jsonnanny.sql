SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `jsonnanny` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `jsonnanny` ;

-- -----------------------------------------------------
-- Table `jsonnanny`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `jsonnanny`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'user unique id' ,
  `tag` VARCHAR(10) NOT NULL COMMENT 'user unique id alternative' ,
  `pwd` VARCHAR(32) NOT NULL COMMENT 'user password' ,
  `nick` VARCHAR(20) NOT NULL COMMENT 'nickname in english' ,
  `cjknick` VARCHAR(128) NOT NULL COMMENT 'nickname in non-english' ,
  `email` VARCHAR(45) NOT NULL COMMENT 'user email' ,
  `gravatar` VARCHAR(45) NULL COMMENT 'gravatar email' ,
  `apikey` TEXT NOT NULL ,
  `date` DATETIME NOT NULL COMMENT 'register or import date' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `uid_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jsonnanny`.`schemas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `jsonnanny`.`schemas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `path` TEXT NOT NULL COMMENT 'the repo path' ,
  `owner` INT NOT NULL COMMENT 'the owner of repo' ,
  `title` TEXT NOT NULL COMMENT 'the title of repo' ,
  `latest` VARCHAR(10) NOT NULL COMMENT 'the latest modified version' ,
  `state` VARCHAR(10) NOT NULL COMMENT 'current state' ,
  `date` DATETIME NOT NULL COMMENT 'created date' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `sid_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jsonnanny`.`feeds`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `jsonnanny`.`feeds` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `opr` INT NOT NULL COMMENT 'the man of event' ,
  `stuff` INT NOT NULL ,
  `stuff_type` VARCHAR(10) NULL ,
  `event` VARCHAR(45) NOT NULL COMMENT 'event action' ,
  `desc` MEDIUMTEXT NOT NULL COMMENT 'description' ,
  `date` DATETIME NOT NULL COMMENT 'created date' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `fid_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jsonnanny`.`notify`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `jsonnanny`.`notify` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `owner` INT NOT NULL ,
  `users` MEDIUMTEXT NOT NULL ,
  `schemas` MEDIUMTEXT NOT NULL ,
  `cases` MEDIUMTEXT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `rid_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jsonnanny`.`cases`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `jsonnanny`.`cases` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `path` VARCHAR(128) NOT NULL COMMENT 'blob content' ,
  `title` VARCHAR(128) NOT NULL ,
  `owner` INT NOT NULL ,
  `date` DATETIME NOT NULL COMMENT 'the last modified date' ,
  `latest` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `cid_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jsonnanny`.`notice`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `jsonnanny`.`notice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `entity` MEDIUMTEXT NOT NULL COMMENT 'notification content' ,
  `date` DATETIME NOT NULL COMMENT 'created date' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `nid_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
