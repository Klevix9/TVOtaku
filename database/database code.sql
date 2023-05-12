-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TVOtaku
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TVOtaku
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TVOtaku` DEFAULT CHARACTER SET utf8mb3 ;
USE `TVOtaku` ;

-- -----------------------------------------------------
-- Table `TVOtaku`.`anime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`anime` (
  `id_anime` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NOT NULL,
  `studio` VARCHAR(45) NULL DEFAULT NULL,
  `synopsis` VARCHAR(256) NULL DEFAULT NULL,
  `animecol` VARCHAR(45) NULL DEFAULT NULL,
  `rating` FLOAT NULL DEFAULT NULL,
  `mal-link` VARCHAR(500) NULL DEFAULT NULL,
  `air_date` DATE NULL DEFAULT NULL,
  `genre_1` TINYTEXT NULL DEFAULT NULL,
  `genre_2` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_anime`),
  UNIQUE INDEX `ID_UNIQUE` (`id_anime` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`episode` (
  `id_episode` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NULL DEFAULT NULL,
  `synopsis` VARCHAR(5000) NULL DEFAULT NULL,
  `air_date` DATETIME NULL DEFAULT NULL,
  `duration` FLOAT NULL DEFAULT NULL,
  `link` VARCHAR(45) NULL DEFAULT NULL,
  `anime_id_anime` INT NOT NULL,
  PRIMARY KEY (`id_episode`),
  INDEX `fk_episode_anime1_idx` (`anime_id_anime` ASC) VISIBLE,
  CONSTRAINT `fk_episode_anime1`
    FOREIGN KEY (`anime_id_anime`)
    REFERENCES `TVOtaku`.`anime` (`id_anime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `surname` VARCHAR(255) NULL COMMENT 'Can be empty',
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NULL,
  `age` VARCHAR(255) NOT NULL,
  `type` INT NOT NULL COMMENT 'type of user, child or not',
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`playlist` (
  `id_playlist` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `update_date` INT NULL DEFAULT NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlist_user_idx` (`user_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `TVOtaku`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`links` (
  `id_link` INT NOT NULL,
  `player_name` VARCHAR(255) NULL,
  `embedded_url` VARCHAR(255) NULL DEFAULT NULL,
  `episode_id_episode` INT NOT NULL,
  PRIMARY KEY (`id_link`),
  INDEX `fk_links_episode1_idx` (`episode_id_episode` ASC) VISIBLE,
  CONSTRAINT `fk_links_episode1`
    FOREIGN KEY (`episode_id_episode`)
    REFERENCES `TVOtaku`.`episode` (`id_episode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`staff` (
  `id_staff` INT NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `status` INT NOT NULL COMMENT 'active or not',
  `role` INT NOT NULL COMMENT 'admin, editor, or anything else',
  PRIMARY KEY (`id_staff`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`playlist_has_episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`playlist_has_episode` (
  `playlist_id_playlist` INT NOT NULL,
  `episode_id_episode` INT NOT NULL,
  PRIMARY KEY (`playlist_id_playlist`, `episode_id_episode`),
  INDEX `fk_playlist_has_episode_episode1_idx` (`episode_id_episode` ASC) VISIBLE,
  INDEX `fk_playlist_has_episode_playlist1_idx` (`playlist_id_playlist` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_episode_playlist1`
    FOREIGN KEY (`playlist_id_playlist`)
    REFERENCES `TVOtaku`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_episode_episode1`
    FOREIGN KEY (`episode_id_episode`)
    REFERENCES `TVOtaku`.`episode` (`id_episode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `TVOtaku`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`genre` (
  `id_genre` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id_genre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TVOtaku`.`season`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`season` (
  `id_season` INT NOT NULL,
  `season` VARCHAR(45) NULL,
  `anime_id_anime` INT NOT NULL,
  PRIMARY KEY (`id_season`),
  INDEX `fk_season_anime1_idx` (`anime_id_anime` ASC) VISIBLE,
  CONSTRAINT `fk_season_anime1`
    FOREIGN KEY (`anime_id_anime`)
    REFERENCES `TVOtaku`.`anime` (`id_anime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TVOtaku`.`watch-profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`watch-profile` (
  `idwatch-profile` INT NOT NULL,
  `id_user` VARCHAR(45) NULL,
  `id_anime` VARCHAR(45) NULL,
  `id_episode` VARCHAR(45) NULL,
  PRIMARY KEY (`idwatch-profile`),
  CONSTRAINT `id_user`
    FOREIGN KEY ()
    REFERENCES `TVOtaku`.`user` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_episode`
    FOREIGN KEY ()
    REFERENCES `TVOtaku`.`episode` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_anime`
    FOREIGN KEY ()
    REFERENCES `TVOtaku`.`anime` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TVOtaku`.`genre_has_anime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TVOtaku`.`genre_has_anime` (
  `genre_id_genre` INT NOT NULL,
  `anime_id_anime` INT NOT NULL,
  PRIMARY KEY (`genre_id_genre`, `anime_id_anime`),
  INDEX `fk_genre_has_anime_anime1_idx` (`anime_id_anime` ASC) VISIBLE,
  INDEX `fk_genre_has_anime_genre1_idx` (`genre_id_genre` ASC) VISIBLE,
  CONSTRAINT `fk_genre_has_anime_genre1`
    FOREIGN KEY (`genre_id_genre`)
    REFERENCES `TVOtaku`.`genre` (`id_genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_has_anime_anime1`
    FOREIGN KEY (`anime_id_anime`)
    REFERENCES `TVOtaku`.`anime` (`id_anime`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
