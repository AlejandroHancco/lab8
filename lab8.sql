-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`facultad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`facultad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`facultad` (
  `idfacultad` INT NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idfacultad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`students` ;

CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `idstudents` INT NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `gpa` DECIMAL NULL,
  `creditos` INT NULL,
  `facultad_idfacultad` INT NOT NULL,
  PRIMARY KEY (`idstudents`, `facultad_idfacultad`),
  INDEX `fk_students_facultad_idx` (`facultad_idfacultad` ASC) VISIBLE,
  CONSTRAINT `fk_students_facultad`
    FOREIGN KEY (`facultad_idfacultad`)
    REFERENCES `mydb`.`facultad` (`idfacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`facultad`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`facultad` (`idfacultad`, `nombre`) VALUES (1, 'Ingenieria');
INSERT INTO `mydb`.`facultad` (`idfacultad`, `nombre`) VALUES (2, 'Medicina');
INSERT INTO `mydb`.`facultad` (`idfacultad`, `nombre`) VALUES (3, 'Ciencias Sociales');
INSERT INTO `mydb`.`facultad` (`idfacultad`, `nombre`) VALUES (4, 'Artes');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`students`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`students` (`idstudents`, `dni`, `nombre`, `gpa`, `creditos`, `facultad_idfacultad`) VALUES (1, '74932411', 'Alejandro Sanchez', 1.5, 35, 1);
INSERT INTO `mydb`.`students` (`idstudents`, `dni`, `nombre`, `gpa`, `creditos`, `facultad_idfacultad`) VALUES (2, '74932412', 'Hugo Ruiz', 2.5, 24, 2);
INSERT INTO `mydb`.`students` (`idstudents`, `dni`, `nombre`, `gpa`, `creditos`, `facultad_idfacultad`) VALUES (3, '74932413', 'Luis Ramirez', 3.4, 26, 3);
INSERT INTO `mydb`.`students` (`idstudents`, `dni`, `nombre`, `gpa`, `creditos`, `facultad_idfacultad`) VALUES (4, '74932414', 'Pedro Picapiedra', 1.8, 18, 4);

COMMIT;

