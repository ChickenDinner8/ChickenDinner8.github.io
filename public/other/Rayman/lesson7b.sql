-- MySQL Script generated by MySQL Workbench
-- Sun Apr 29 10:40:19 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hotel` (
  `HotelID` INT NOT NULL,
  `Location` CHAR(64) NOT NULL,
  PRIMARY KEY (`HotelID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `RoomID` INT NOT NULL,
  `RoomType` INT NOT NULL,
  `belongHotelID` INT NOT NULL,
  PRIMARY KEY (`RoomID`),
  INDEX `fk_Room_Hotel_idx` (`belongHotelID` ASC),
  CONSTRAINT `fk_Room_Hotel`
    FOREIGN KEY (`belongHotelID`)
    REFERENCES `mydb`.`Hotel` (`HotelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservation` (
  `ReservationID` INT NOT NULL,
  `CustomerEmail` VARCHAR(64) NOT NULL,
  `PaymentID` INT NULL,
  `HotelID` INT NOT NULL,
  PRIMARY KEY (`ReservationID`),
  INDEX `fk_Reservation_Hotel1_idx` (`HotelID` ASC),
  UNIQUE INDEX `PaymentID_UNIQUE` (`PaymentID` ASC),
  CONSTRAINT `fk_Reservation_Hotel1`
    FOREIGN KEY (`HotelID`)
    REFERENCES `mydb`.`Hotel` (`HotelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReservedRoom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ReservedRoom` (
  `ID` INT NOT NULL,
  `ReservationID` INT NOT NULL,
  `RoomID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ReservedRoom_Reservation1_idx` (`ReservationID` ASC),
  INDEX `fk_ReservedRoom_Room1_idx` (`RoomID` ASC),
  CONSTRAINT `fk_ReservedRoom_Reservation1`
    FOREIGN KEY (`ReservationID`)
    REFERENCES `mydb`.`Reservation` (`ReservationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservedRoom_Room1`
    FOREIGN KEY (`RoomID`)
    REFERENCES `mydb`.`Room` (`RoomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `PaymentID` INT NOT NULL,
  `Payment` REAL NOT NULL,
  `CreaditCardNumber` INT NOT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE INDEX `PaymentID_UNIQUE` (`PaymentID` ASC),
  CONSTRAINT `fk_Payment_Reservation1`
    FOREIGN KEY (`PaymentID`)
    REFERENCES `mydb`.`Reservation` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
