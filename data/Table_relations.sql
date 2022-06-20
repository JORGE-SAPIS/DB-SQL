-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema celuloide
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema celuloide
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `celuloide` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `celuloide` ;

-- -----------------------------------------------------
-- Table `celuloide`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`actor` (
  `actor_id` BIGINT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`language` (
  `language_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`film` (
  `film_id` BIGINT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `language_id` BIGINT NULL DEFAULT NULL,
  `original_language_id` DOUBLE NULL DEFAULT NULL,
  `rental_duration` BIGINT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` BIGINT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `language_id` (`language_id` ASC) VISIBLE,
  CONSTRAINT `film_ibfk_1`
    FOREIGN KEY (`language_id`)
    REFERENCES `celuloide`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`actor_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`actor_films` (
  `actor_id` BIGINT NOT NULL,
  `film_id` BIGINT NOT NULL,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `fk_film` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor`
    FOREIGN KEY (`actor_id`)
    REFERENCES `celuloide`.`actor` (`actor_id`),
  CONSTRAINT `fk_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `celuloide`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`category` (
  `category_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`inventory` (
  `inventory_id` BIGINT NOT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  `store_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `film_id` (`film_id` ASC) VISIBLE,
  CONSTRAINT `inventory_ibfk_1`
    FOREIGN KEY (`film_id`)
    REFERENCES `celuloide`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`old_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`old_hdd` (
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `category_id` BIGINT NULL DEFAULT NULL,
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `old_hdd_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `celuloide`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`rental` (
  `rental_id` BIGINT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `inventory_id` BIGINT NULL DEFAULT NULL,
  `customer_id` BIGINT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `inventory_id` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `rental_ibfk_1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `celuloide`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
