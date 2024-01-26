-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art_gallery` ;
USE `art_gallery` ;

-- -----------------------------------------------------
-- Table `art_gallery`.`Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art_gallery`.`Artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `mname` VARCHAR(45) NULL DEFAULT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dob` INT(4) NULL,
  `dod` INT(4) NULL DEFAULT NULL,
  `country` VARCHAR(45) NOT NULL,
  `local` ENUM('y', 'n') NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`Art`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art_gallery`.`Art` (
  `Art_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(90) NOT NULL,
  `year` INT(4) NOT NULL,
  `period` VARCHAR(60) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`Art_id`),
  INDEX `fk_Art_Artist_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_Art_Artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art_gallery`.`Artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art_gallery`.`keywords` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keywords` VARCHAR(45) NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art_gallery`.`art_keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `art_gallery`.`art_keywords` (
  `keyword_id` INT NOT NULL,
  `Art_id` INT NOT NULL,
  PRIMARY KEY (`keyword_id`, `Art_id`),
  INDEX `fk_keywords_has_Art_Art1_idx` (`Art_id` ASC) VISIBLE,
  INDEX `fk_keywords_has_Art_keywords1_idx` (`keyword_id` ASC) VISIBLE,
  CONSTRAINT `fk_keywords_has_Art_keywords1`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `art_gallery`.`keywords` (`keyword_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_keywords_has_Art_Art1`
    FOREIGN KEY (`Art_id`)
    REFERENCES `art_gallery`.`Art` (`Art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


USE art_gallery;

INSERT INTO keywords VALUES
(default, "flowers"), (default, "blue"), (default, "landscapes"), (default, "girl"), (default, "people"), (default, "battle"), (default, "boat"), (default, "water"), (default, "Christ"), (default, "food"),
(default, "baby");

INSERT INTO artist VALUES
(default, "Vincent", default, "van Gogh", 1853, 1890, "France", "n"),
(default, "Rembrandt", "Harmenszoon", "van Rijn", 1606, 1669, "Netherlands", "n"),
(default, "Leonardo", default, "da Vinci", 1452, 1519, "Italy", "n"),
(default, "Leonardo", default, "da Vinci", 1452, 1519, "Italy", "n"),
(default, "Venture", "Lozo", "Coy", 1965, default, "United States", "y"),
(default, "Deborah", default, "Gill", 1970, default, "United States", "y"),
(default, "Claude", default, "Monet", 1840, 1926, "France", "n"),
(default, "Pablo", default, "Picasso", 1904, 1973, "Spain", "n"),
(default, "Michelangelo", "di Lodovico", "Simoni", 1475, 1564, "Italy", "n")

INSERT INTO art VALUES
(default, "Irises", 1889, "Impressionism", "Oil", "irises.jpg", 1), (default, "The Starry Night", 1889, "Post-Impressionism", "Oil", "starrynight.jpg", 1), (default, "Sunflowers", 1888, "Post-Impressionism", "Oil", "sunflowers.jpg", 1), 
(default, "Night Watch", 1642, "Baroque", "Oil", "nightwatch.jpg", 2),  (default, "Storm on the Sea of Galilee", 1633, "Dutch Golden Age", "Oil", "stormgalilee.jpg", 2), 
(default, "Head of a Woman", 1508, "High Renaissance", "Oil", "headwoman.jpg", 3), (default, "Last Supper", 1498, "Renaissance", "Tempra", "lastsupper.jpg", 3), (default, "Mona Lisa", 1517, "Renaissance", "Oil", "monalisa.jpg", 3),
(default, "Hillside Stream", 2005, "Modern", "Oil", "hillsidestream.jpg", 4), (default, "Old Barn", 1992, "Modern", "Oil", "oldbarn.jpg", 4),
(default, "Beach Baby", 1999, "Modern", "Watercolor", "beachbaby.jpg", 5),
(default, "Women in the garden", 1866, "Impressionism", "Oil", "womengarden.jpg", 6),
(default, "Old Guitarist", 1904, "Modern", "Oil", "guitarist.jpg", 7);