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
  `old_hdd_title` TEXT NULL,
  PRIMARY KEY (`actor_id`))
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
  `old_hdd_title` TEXT NULL,
  `inventory_inventory_id` BIGINT NOT NULL,
  PRIMARY KEY (`film_id`, `inventory_inventory_id`))
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
  PRIMARY KEY (`rental_id`))
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
  `rental_rental_id` BIGINT NOT NULL,
  `film_film_id` BIGINT NOT NULL,
  `film_inventory_inventory_id` BIGINT NOT NULL,
  PRIMARY KEY (`inventory_id`, `rental_rental_id`, `film_film_id`, `film_inventory_inventory_id`),
  INDEX `fk_inventory_rental1_idx` (`rental_rental_id` ASC) VISIBLE,
  INDEX `fk_inventory_film1_idx` (`film_film_id` ASC, `film_inventory_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_rental1`
    FOREIGN KEY (`rental_rental_id`)
    REFERENCES `celuloide`.`rental` (`rental_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_film_id` , `film_inventory_inventory_id`)
    REFERENCES `celuloide`.`film` (`film_id` , `inventory_inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`language` (
  `language_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `film_film_id` BIGINT NOT NULL,
  PRIMARY KEY (`language_id`, `film_film_id`),
  INDEX `fk_language_film1_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_language_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `celuloide`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `celuloide`.`old_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`old_hdd` (
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL,
  `release_year` BIGINT NULL DEFAULT NULL,
  `category_id` BIGINT NOT NULL,
  `category_category_id` BIGINT NOT NULL,
  PRIMARY KEY (`category_category_id`, `category_id`),
  CONSTRAINT `fk_old_hdd_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `celuloide`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `celuloide`.`actor_films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `celuloide`.`actor_films` (
  `actor_actor_id` BIGINT NOT NULL,
  `film_film_id` BIGINT NOT NULL,
  `film_inventory_inventory_id` BIGINT NULL,
  PRIMARY KEY (`actor_actor_id`, `film_film_id`),
  INDEX `fk_actor_has_film_film1_idx` (`film_film_id` ASC, `film_inventory_inventory_id` ASC) VISIBLE,
  INDEX `fk_actor_has_film_actor1_idx` (`actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_film_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `celuloide`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_has_film_film1`
    FOREIGN KEY (`film_film_id` , `film_inventory_inventory_id`)
    REFERENCES `celuloide`.`film` (`film_id` , `inventory_inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
