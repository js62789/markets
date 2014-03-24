SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `markets` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `markets` ;

-- -----------------------------------------------------
-- Table `markets`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `markets`.`company` (
  `symbol` VARCHAR(10) NOT NULL,
  `name` VARCHAR(100) NULL,
  `last_sale` DECIMAL(10,2) NULL,
  `market_cap` DECIMAL(20,2) NULL,
  `ipo_year` YEAR NULL,
  `sector` VARCHAR(45) NULL,
  `industry` VARCHAR(45) NULL,
  `summary_quote` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`symbol`),
  UNIQUE INDEX `symbol_UNIQUE` (`symbol` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
