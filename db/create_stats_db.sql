-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema stats
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stats
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stats` DEFAULT CHARACTER SET utf8 ;
USE `stats` ;

-- -----------------------------------------------------
-- Table `stats`.`seasons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stats`.`seasons` (
  `id` INT NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stats`.`leagues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stats`.`leagues` (
  `id` INT NOT NULL,
  `season_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_leagues_1_idx` (`season_id` ASC),
  CONSTRAINT `fk_leagues_1`
    FOREIGN KEY (`season_id`)
    REFERENCES `stats`.`seasons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stats`.`divisions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stats`.`divisions` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `league_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_divisions_1_idx` (`league_id` ASC),
  CONSTRAINT `fk_divisions_1`
    FOREIGN KEY (`league_id`)
    REFERENCES `stats`.`leagues` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stats`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stats`.`teams` (
  `id` INT NOT NULL,
  `team_city` VARCHAR(45) NOT NULL,
  `team_name` VARCHAR(45) NOT NULL,
  `division_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_teams_1_idx` (`division_id` ASC),
  CONSTRAINT `fk_teams_1`
    FOREIGN KEY (`division_id`)
    REFERENCES `stats`.`divisions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stats`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stats`.`players` (
  `id` INT NOT NULL,
  `given_name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `pitcher` TINYINT(1) NOT NULL,
  `games` VARCHAR(45) NULL,
  `games_started` VARCHAR(45) NULL,
  `at_bats` VARCHAR(45) NULL,
  `runs` VARCHAR(45) NULL,
  `hits` VARCHAR(45) NULL,
  `doubles` VARCHAR(45) NULL,
  `triples` VARCHAR(45) NULL,
  `home_runs` VARCHAR(45) NULL,
  `rbi` VARCHAR(45) NULL,
  `steals` VARCHAR(45) NULL,
  `caught_stealing` VARCHAR(45) NULL,
  `sacrifice_hits` VARCHAR(45) NULL,
  `sacrifice_flies` VARCHAR(45) NULL,
  `errors` VARCHAR(45) NULL,
  `pb` VARCHAR(45) NULL,
  `walks` VARCHAR(45) NULL,
  `struck_out` VARCHAR(45) NULL,
  `hit_by_pitch` VARCHAR(45) NULL,
  `throws` VARCHAR(45) NULL,
  `wins` VARCHAR(45) NULL,
  `losses` VARCHAR(45) NULL,
  `saves` VARCHAR(45) NULL,
  `complete_games` VARCHAR(45) NULL,
  `shut_outs` VARCHAR(45) NULL,
  `era` VARCHAR(45) NULL,
  `innings` VARCHAR(45) NULL,
  `earned_runs` VARCHAR(45) NULL,
  `hit_batter` VARCHAR(45) NULL,
  `wild_pitches` VARCHAR(45) NULL,
  `balk` VARCHAR(45) NULL,
  `walked_batter` VARCHAR(45) NULL,
  `struck_out_batter` VARCHAR(45) NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_players_1_idx` (`team_id` ASC),
  CONSTRAINT `fk_players_1`
    FOREIGN KEY (`team_id`)
    REFERENCES `stats`.`teams` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
