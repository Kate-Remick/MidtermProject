-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fitnessfinderdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `fitnessfinderdb` ;

-- -----------------------------------------------------
-- Schema fitnessfinderdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fitnessfinderdb` DEFAULT CHARACTER SET utf8 ;
USE `fitnessfinderdb` ;

-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `login` ;

CREATE TABLE IF NOT EXISTS `login` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street_address1` VARCHAR(100) NULL,
  `street_address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `zip` VARCHAR(15) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facility` ;

CREATE TABLE IF NOT EXISTS `facility` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mission_statement` TEXT NULL,
  `has_trainers` TINYINT NULL,
  `brand` VARCHAR(45) NULL,
  `name` VARCHAR(100) NOT NULL,
  `owner_name` TEXT NULL,
  `login_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `always_open` TINYINT NULL,
  `price` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_facility_user1_idx` (`login_id` ASC),
  INDEX `fk_facility_location1_idx` (`address_id` ASC),
  CONSTRAINT `fk_facility_user1`
    FOREIGN KEY (`login_id`)
    REFERENCES `login` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facility_location1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facility_preferences`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facility_preferences` ;

CREATE TABLE IF NOT EXISTS `facility_preferences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `always_open` TINYINT NULL,
  `price_max` INT NULL,
  `has_trainers` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gender` ;

CREATE TABLE IF NOT EXISTS `gender` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `birth_date` DATETIME NULL,
  `bio` TEXT NULL,
  `login_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `facility_preferences_id` INT NOT NULL,
  `gender_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_user_idx` (`login_id` ASC),
  INDEX `fk_customer_location1_idx` (`address_id` ASC),
  INDEX `fk_customer_facility_preferences1_idx` (`facility_preferences_id` ASC),
  INDEX `fk_customer_gender1_idx` (`gender_id` ASC),
  CONSTRAINT `fk_customer_user`
    FOREIGN KEY (`login_id`)
    REFERENCES `login` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_location1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_facility_preferences1`
    FOREIGN KEY (`facility_preferences_id`)
    REFERENCES `facility_preferences` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `gender` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `partner_preferences`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_preferences` ;

CREATE TABLE IF NOT EXISTS `partner_preferences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `age_min` INT NOT NULL,
  `age_max` INT NOT NULL,
  `gender_preference` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `personal_trainer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `personal_trainer` ;

CREATE TABLE IF NOT EXISTS `personal_trainer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `rate` DECIMAL(5,2) NOT NULL,
  `bio` VARCHAR(2000) NULL,
  `availability` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL,
  `score` INT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goal` ;

CREATE TABLE IF NOT EXISTS `goal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `customer_id` INT NOT NULL,
  `completed` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goal_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_goal_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journal` ;

CREATE TABLE IF NOT EXISTS `journal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entry` TEXT NULL,
  `created_at` DATETIME NULL,
  `customer_id` INT NOT NULL,
  `goal_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_journal_customer1_idx` (`customer_id` ASC),
  INDEX `fk_journal_goal1_idx` (`goal_id` ASC),
  CONSTRAINT `fk_journal_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_journal_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `goal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer_facility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_facility` ;

CREATE TABLE IF NOT EXISTS `customer_facility` (
  `facility_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`facility_id`, `customer_id`),
  INDEX `fk_facility_has_customer_customer1_idx` (`customer_id` ASC),
  INDEX `fk_facility_has_customer_facility1_idx` (`facility_id` ASC),
  CONSTRAINT `fk_facility_has_customer_facility1`
    FOREIGN KEY (`facility_id`)
    REFERENCES `facility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facility_has_customer_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facility_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facility_activity` ;

CREATE TABLE IF NOT EXISTS `facility_activity` (
  `facility_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  PRIMARY KEY (`facility_id`, `activity_id`),
  INDEX `fk_facility_has_activity_activity1_idx` (`activity_id` ASC),
  INDEX `fk_facility_has_activity_facility1_idx` (`facility_id` ASC),
  CONSTRAINT `fk_facility_has_activity_facility1`
    FOREIGN KEY (`facility_id`)
    REFERENCES `facility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facility_has_activity_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_category` ;

CREATE TABLE IF NOT EXISTS `activity_category` (
  `activity_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`activity_id`, `category_id`),
  INDEX `fk_category_has_activity_activity1_idx` (`activity_id` ASC),
  INDEX `fk_category_has_activity_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_activity_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_activity_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_activity` ;

CREATE TABLE IF NOT EXISTS `customer_activity` (
  `activity_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `skill_level` INT(1) NULL,
  PRIMARY KEY (`activity_id`, `customer_id`),
  INDEX `fk_activity_has_customer_customer1_idx` (`customer_id` ASC),
  INDEX `fk_activity_has_customer_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_activity_has_customer_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_has_customer_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facility_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facility_comment` ;

CREATE TABLE IF NOT EXISTS `facility_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `facility_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `comment` TEXT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_facility_has_customer_customer2_idx` (`customer_id` ASC),
  INDEX `fk_facility_has_customer_facility2_idx` (`facility_id` ASC),
  CONSTRAINT `fk_facility_has_customer_facility2`
    FOREIGN KEY (`facility_id`)
    REFERENCES `facility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facility_has_customer_customer2`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer_trainer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_trainer` ;

CREATE TABLE IF NOT EXISTS `customer_trainer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `personal_trainer_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `comment` TEXT NULL,
  `created_at` DATETIME NULL,
  INDEX `fk_personal_trainer_has_customer_customer1_idx` (`customer_id` ASC),
  INDEX `fk_personal_trainer_has_customer_personal_trainer1_idx` (`personal_trainer_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_personal_trainer_has_customer_personal_trainer1`
    FOREIGN KEY (`personal_trainer_id`)
    REFERENCES `personal_trainer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_trainer_has_customer_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facility_has_personal_trainer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facility_has_personal_trainer` ;

CREATE TABLE IF NOT EXISTS `facility_has_personal_trainer` (
  `facility_id` INT NOT NULL,
  `personal_trainer_id` INT NOT NULL,
  PRIMARY KEY (`facility_id`, `personal_trainer_id`),
  INDEX `fk_facility_has_personal_trainer_personal_trainer1_idx` (`personal_trainer_id` ASC),
  INDEX `fk_facility_has_personal_trainer_facility1_idx` (`facility_id` ASC),
  CONSTRAINT `fk_facility_has_personal_trainer_facility1`
    FOREIGN KEY (`facility_id`)
    REFERENCES `facility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facility_has_personal_trainer_personal_trainer1`
    FOREIGN KEY (`personal_trainer_id`)
    REFERENCES `personal_trainer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS fitnessuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'fitnessuser'@'localhost' IDENTIFIED BY 'fitnessuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'fitnessuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `role`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `role` (`id`, `name`) VALUES (1, 'customer');
INSERT INTO `role` (`id`, `name`) VALUES (2, 'personal_trainer');
INSERT INTO `role` (`id`, `name`) VALUES (3, 'facility_owner');
INSERT INTO `role` (`id`, `name`) VALUES (4, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `login`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (1, 'admin', 'password', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (2, 'mgoduco', 'password', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (3, 'kobrakommander', 'password', 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (1, '500 Oak St', NULL, 'Boston', 'MA', '03059', '757-767-7999', 'man@training.com', NULL);
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (2, '100 Elm', NULL, 'Boston', 'MA', '03569', '617-777-2345', 'gymmaster@gym.com', 'gym.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `facility`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (1, 'Crush your enemies', 1, 'Globo', 'GloboGym', 'Ben Stiller', 3, 2, 1, 150);

COMMIT;


-- -----------------------------------------------------
-- Data for table `facility_preferences`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `facility_preferences` (`id`, `always_open`, `price_max`, `has_trainers`) VALUES (1, 1, 100, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `gender`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `gender` (`id`, `name`) VALUES (1, 'male');
INSERT INTO `gender` (`id`, `name`) VALUES (2, 'female');
INSERT INTO `gender` (`id`, `name`) VALUES (3, 'other');

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (1, 'Max', 'Goduco', '1995-07-22', 'hello', 1, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `activity` (`id`, `name`) VALUES (1, 'Powerlifting');
INSERT INTO `activity` (`id`, `name`) VALUES (2, 'Crossfit');
INSERT INTO `activity` (`id`, `name`) VALUES (3, 'Dance');
INSERT INTO `activity` (`id`, `name`) VALUES (4, 'Swim');
INSERT INTO `activity` (`id`, `name`) VALUES (5, 'Yoga');
INSERT INTO `activity` (`id`, `name`) VALUES (6, 'Climbing');
INSERT INTO `activity` (`id`, `name`) VALUES (7, 'Spinning');
INSERT INTO `activity` (`id`, `name`) VALUES (8, 'MMA');
INSERT INTO `activity` (`id`, `name`) VALUES (9, 'Martial Arts');
INSERT INTO `activity` (`id`, `name`) VALUES (10, 'Running');
INSERT INTO `activity` (`id`, `name`) VALUES (11, 'Calisthenics');
INSERT INTO `activity` (`id`, `name`) VALUES (12, 'Golf');
INSERT INTO `activity` (`id`, `name`) VALUES (13, 'Weightlifting');
INSERT INTO `activity` (`id`, `name`) VALUES (14, 'Endurance (Cardio)');
INSERT INTO `activity` (`id`, `name`) VALUES (15, 'Tennis');
INSERT INTO `activity` (`id`, `name`) VALUES (16, 'Bowling');

COMMIT;


-- -----------------------------------------------------
-- Data for table `personal_trainer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `personal_trainer` (`id`, `first_name`, `last_name`, `rate`, `bio`, `availability`) VALUES (1, 'Ronnie', 'Coleman', 999.99, 'Lightweight', 'any day');

COMMIT;


-- -----------------------------------------------------
-- Data for table `goal`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `goal` (`id`, `name`, `description`, `customer_id`, `completed`) VALUES (1, 'Pump Iron', 'bench 1000 lbs', 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `journal`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (1, 'workout 1', '2022-05-05', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer_facility`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `customer_facility` (`facility_id`, `customer_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `facility_activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `category` (`id`, `title`) VALUES (1, 'Strength');
INSERT INTO `category` (`id`, `title`) VALUES (2, 'Cardio');
INSERT INTO `category` (`id`, `title`) VALUES (3, 'Sports');
INSERT INTO `category` (`id`, `title`) VALUES (4, 'Group Classes');
INSERT INTO `category` (`id`, `title`) VALUES (5, 'Low Impact Activity');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (1, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (2, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (3, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (4, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (5, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (6, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (7, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (8, 1);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (9, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (10, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (11, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (12, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (13, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (14, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (15, 2);
INSERT INTO `activity_category` (`activity_id`, `category_id`) VALUES (16, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer_activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `customer_activity` (`activity_id`, `customer_id`, `skill_level`) VALUES (1, 1, 1);
INSERT INTO `customer_activity` (`activity_id`, `customer_id`, `skill_level`) VALUES (2, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `facility_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `facility_comment` (`id`, `facility_id`, `customer_id`, `comment`, `created_at`) VALUES (1, 1, 1, 'this place sucks', '2022-05-05');

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer_trainer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `customer_trainer` (`id`, `personal_trainer_id`, `customer_id`, `comment`, `created_at`) VALUES (1, 1, 1, 'awesome dude', '2022-05-05');

COMMIT;


-- -----------------------------------------------------
-- Data for table `facility_has_personal_trainer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `facility_has_personal_trainer` (`facility_id`, `personal_trainer_id`) VALUES (1, 1);

COMMIT;

