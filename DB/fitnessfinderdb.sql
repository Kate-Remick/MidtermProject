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
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (4, 'bleachsquash', 'bleachsquash', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (5, 'frightenedadjust', 'frightenedadjust', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (6, 'meaningkneel', 'meaningkneel', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (7, 'structureacrid', 'structureacrid', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (8, 'frostedpickleball', 'frostedpickleball', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (9, 'counselorpress', 'counselorpress', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (10, 'pointlesshawse', 'pointlesshawse', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (11, 'easterlydeltas', 'easterlydeltas', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (12, 'creamybattenburg', 'creamybattenburg', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (13, 'consistentshameless', 'consistentshameless', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (14, 'acquiredetermine', 'acquiredetermine', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (15, 'weakglobe', 'weakglobe', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (16, 'admitfairlead', 'admitfairlead', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (17, 'quietoccasionally', 'quietoccasionally', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (18, 'analysiswhat', 'analysiswhat', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (19, 'illfateddna', 'illfateddna', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (20, 'obstinacypost', 'obstinacypost', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (21, 'alembicstudious', 'alembicstudious', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (22, 'teacherright', 'teacherright', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (23, 'operateneed', 'operateneed', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (24, 'statementpolitician', 'statementpolitician', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (25, 'shakesquirrel', 'shakesquirrel', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (26, 'percentageskit', 'percentageskit', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (27, 'constructclothe', 'constructclothe', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (28, 'chewbinnacle', 'chewbinnacle', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (29, 'vouchthole', 'vouchthole', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (30, 'adjustluxurious', 'adjustluxurious', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (31, 'prickgrind', 'prickgrind', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (32, 'frameworkmanner', 'frameworkmanner', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (33, 'pebblestadium', 'pebblestadium', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (34, 'undermangoes', 'undermangoes', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (35, 'obtainablesexy', 'obtainablesexy', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (36, 'chocolateulna', 'chocolateulna', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (37, 'pillstockings', 'pillstockings', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (38, 'coalibis', 'coalibis', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (39, 'actualclumsy', 'actualclumsy', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (40, 'chickenperturbed', 'chickenperturbed', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (41, 'carrotstudent', 'carrotstudent', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (42, 'intentquartering', 'intentquartering', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (43, 'plonkliar', 'plonkliar', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (44, 'scoldingwhether', 'scoldingwhether', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (45, 'mustrichesse', 'mustrichesse', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (46, 'gappredict', 'gappredict', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (47, 'veneratedpies', 'veneratedpies', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (48, 'technicianoracle', 'technicianoracle', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (49, 'strutfighting', 'strutfighting', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (50, 'marbledscreech', 'marbledscreech', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (51, 'smileyblotched', 'smileyblotched', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (52, 'bowermuscle', 'bowermuscle', 1, 1);
INSERT INTO `login` (`id`, `username`, `password`, `active`, `role_id`) VALUES (53, 'advisorcathead', 'advisorcathead', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (1, '500 Oak St', NULL, 'Boston', 'MA', '03059', '757-767-7999', 'man@training.com', NULL);
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (2, '100 Elm', NULL, 'Boston', 'MA', '03569', '617-777-2345', 'gymmaster@gym.com', 'gym.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (3, '1630 W Evans Ave', NULL, 'Englewood', 'CO', '80110', '720-770-1616', NULL, 'www.ironwarriorgym.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (4, '1244 E Colfax Ave', NULL, 'Denver', 'CO', '80218', '303-558-1555', NULL, 'www.anytimefitness.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (5, '1516 Emerson St', NULL, 'Denver', 'CO', '80218', '303-832-7263', NULL, 'www.colfaxstrong.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (6, '636 S Broadway', NULL, 'Denver', 'CO', '80209', '720-249-4896', NULL, 'www.denvergymandfitness.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (7, '324 S Broadway', NULL, 'Denver', 'CO', '80209', '720-822-9212', NULL, 'therebelworkout.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (8, '220 Santa Fe Dr', NULL, 'Denver', 'CO', '80223', '850-322-5813', NULL, 'www.tfwmma.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (9, '3639 Star Ranch Rd', NULL, 'Colorado Springs', 'CO', '80906', '719-419-7504', NULL, 'www.renzograciecolorado.com');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (10, '3901 E Yale Ave', NULL, 'Denver', 'CO', '80210', '720-524-2750', NULL, 'www.denverymca.org');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (11, '3355 S Yarrow St e125', NULL, 'Lakewood', 'CO', '80227', '303-987-2444', NULL, 'https://coloradodancestudios.com/');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (12, '336 South Broadway', NULL, 'Denver', 'CO', '80209', '719-368-2668\n', NULL, 'https://www.evqelitedance.com/');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (13, '5001 S Parker Road', '108', 'Aurora', 'CO', '80015', '720-998-8770', 'jazzercisecherrycreek@outlook.com', 'https://www.jazzercise.com/location/jazzercise-cherry-creek');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (14, '2700 Arapahoe St', NULL, 'Denver', 'CO', '80205', '720-355-5471', 'dsdancesportballroom@gmail.com', 'https://www.dsdancesportballroom.com/');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (15, '1917 Market St.', NULL, 'Denver', 'CO', '80202', NULL, NULL, 'https://www.dance2b.com/');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (16, '99 W 9th Ave.', NULL, 'Denver', 'CO', '80204', '303-572-8006', NULL, 'http://larumbadenver.com/');
INSERT INTO `address` (`id`, `street_address1`, `street_address2`, `city`, `state`, `zip`, `phone`, `email`, `url`) VALUES (17, '7400 East Orchard Rd', 'Ste 1450N', 'Englewood', 'CO', '80111', '303-302-5234', 'spotr@skilldistillery.com', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `facility`
-- -----------------------------------------------------
START TRANSACTION;
USE `fitnessfinderdb`;
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (1, 'Crush your enemies', 1, 'Globo', 'GloboGym', 'Ben Stiller', 3, 2, 1, 150);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (2, 'See them driven before you', 0, NULL, 'Iron Warrior Gym', 'Jeff Bezos', 3, 3, 1, 55);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (3, 'What is best', 0, NULL, 'Anytime Fitness', 'Marky Mark', 3, 4, 0, 900);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (4, 'Strength and Honor', 1, NULL, 'Colfax Strong', 'Maximus D', 3, 5, 1, 444);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (5, NULL, 1, NULL, 'Denver Gym and Fitness', 'Mark Hamil', 3, 6, 1, 333);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (6, NULL, 1, NULL, 'The Rebel Workout', 'Jeff Bridges', 3, 7, 0, 666);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (7, NULL, 0, NULL, 'TFA MMA & Fitness', 'Tony Stark', 3, 8, 1, NULL);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (8, NULL, NULL, NULL, 'Gracie BJJ Academy', 'Renzo Gracie', 3, 9, 0, NULL);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (9, NULL, NULL, NULL, 'University Hills YMCA', 'Village Person', 3, 10, 0, NULL);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (10, 'Teaching the world to dance for over 100 years.', 1, 'Aurthur Murray', 'Colorado Dance Centers', NULL, 3, 11, 0, NULL);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (11, NULL, 1, NULL, 'EVQ Elite Dance Studio', 'Victoria Quintana', 3, 12, 0, NULL);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (12, NULL, 1, 'Jazzercise', 'Jazzercise Aurora', NULL, 3, 13, 0, 25);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (13, NULL, 1, NULL, 'DS Dancesport Ballroom', 'Deannah Strashnikova', 3, 14, 0, 118);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (14, NULL, 1, NULL, 'Dance2B', 'Jennifer Tisdale', 3, 15, 0, 22);
INSERT INTO `facility` (`id`, `mission_statement`, `has_trainers`, `brand`, `name`, `owner_name`, `login_id`, `address_id`, `always_open`, `price`) VALUES (15, NULL, 0, NULL, 'LaRumba', NULL, 3, 16, 0, 15);

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
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (2, 'Christopher', 'Hernandez', '1972-05-08', '', 4, 17, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (3, 'Jacqueline', 'Ortiz', '1955-12-15', '', 5, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (4, 'Amy', 'Young', '1945-05-14', '', 6, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (5, 'Jean', 'Cox', '1972-07-26', '', 7, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (6, 'Robert', 'Johnson', '1962-02-18', '', 8, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (7, 'Isabella', 'Price', '1979-07-20', '', 9, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (8, 'Noah', 'Morales', '1975-05-26', '', 10, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (9, 'Joan', 'Stewart', '1944-06-04', '', 11, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (10, 'Kathryn', 'Ramos', '1984-12-16', '', 12, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (11, 'Henry', 'Parker', '1959-08-16', '', 13, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (12, 'Jason', 'Ramirez', '1993-10-12', '', 14, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (13, 'Adam', 'Turner', '1964-07-02', '', 15, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (14, 'Jesse', 'Kim', '1942-08-11', '', 16, 1, 1, 3);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (15, 'Nicholas', 'Allen', '1955-12-19', '', 17, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (16, 'Roger', 'Gutierrez', '1996-12-21', '', 18, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (17, 'George', 'White', '1978-08-17', '', 19, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (18, 'Betty', 'Gonzales', '1948-10-17', '', 20, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (19, 'Russell', 'Myers', '1998-08-17', '', 21, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (20, 'Randy', 'Price', '2001-02-06', '', 22, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (21, 'Debra', 'Baker', '1960-07-28', '', 23, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (22, 'Catherine', 'Mitchell', '1951-03-11', '', 24, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (23, 'Alexis', 'Foster', '1959-10-23', '', 25, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (24, 'Sarah', 'Rodriguez', '1979-03-28', '', 26, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (25, 'Barbara', 'Garcia', '1953-06-23', '', 27, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (26, 'Lawrence', 'Howard', '1977-11-04', '', 28, 1, 1, 3);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (27, 'Edward', 'Clark', '1954-06-23', '', 29, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (28, 'Cheryl', 'Rogers', '2000-03-24', '', 30, 1, 1, 2);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (29, 'Jose', 'Evans', '1988-12-02', '', 31, 1, 1, 3);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (30, 'Steven', 'Taylor', '1970-01-11', '', 32, 1, 1, 1);
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `bio`, `login_id`, `address_id`, `facility_preferences_id`, `gender_id`) VALUES (31, 'Patricia', 'Johnson', '1986-05-03', '', 33, 1, 1, 2);

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
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (2, 'Today I am starting to see the shred on my body.', '2022-03-8', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (3, 'Today I was crushed by the DOMS from my previous workout.', '2022-03-28', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (4, 'Today I truly enjoyed this workout.', '2022-04-29', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (5, 'Today I continued increasing my stamina.', '2022-05-30', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (6, 'Today I continued increasing my stamina.', '2022-04-21', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (7, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-30', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (8, 'Today I did good.', '2022-02-23', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (9, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-26', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (10, 'Today I really felt the burn.', '2022-04-23', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (11, 'Today I cut more weight towards my goal.', '2022-02-9', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (12, 'Today I wished I pushed harder.', '2022-04-28', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (13, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-10', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (14, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-21', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (15, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-6', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (16, 'Today I truly enjoyed this workout.', '2022-03-3', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (17, 'Today I cut more weight towards my goal.', '2022-04-2', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (18, 'Today I continued increasing my stamina.', '2022-05-4', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (19, 'Today I cut more weight towards my goal.', '2022-05-16', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (20, 'Today I felt exhausted after working so hard the past two days.', '2022-05-23', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (21, 'Today I cut more weight towards my goal.', '2022-04-14', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (22, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-21', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (23, 'Today I hit a new personal best.', '2022-02-24', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (24, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-8', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (25, 'Today I got pumped by that massive endorphin rush!', '2022-03-24', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (26, 'Today I really felt the burn.', '2022-03-28', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (27, 'Today I truly enjoyed this workout.', '2022-05-19', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (28, 'Today I cut more weight towards my goal.', '2022-04-14', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (29, 'Today I truly enjoyed this workout.', '2022-02-5', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (30, 'Today I continued increasing my stamina.', '2022-05-15', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (31, 'Today I felt exhausted after working so hard the past two days.', '2022-05-8', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (32, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-24', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (33, 'Today I hit a new personal best.', '2022-05-18', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (34, 'Today I really felt the burn.', '2022-05-1', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (35, 'Today I felt exhausted after working so hard the past two days.', '2022-04-29', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (36, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-2', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (37, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-1', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (38, 'Today I cut more weight towards my goal.', '2022-05-18', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (39, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-28', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (40, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-2', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (41, 'Today I really felt the burn.', '2022-02-22', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (42, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-18', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (43, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-28', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (44, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-10', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (45, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-5', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (46, 'Today I cut more weight towards my goal.', '2022-05-30', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (47, 'Today I hit a new personal best.', '2022-02-20', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (48, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-13', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (49, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-25', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (50, 'Today I broke through these barriers I\'ve been feeling.', '2022-03-19', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (51, 'Today I cut more weight towards my goal.', '2022-02-26', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (52, 'Today I wished I pushed harder.', '2022-05-27', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (53, 'Today I really felt the burn.', '2022-04-6', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (54, 'Today I did good.', '2022-02-7', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (55, 'Today I really felt the burn.', '2022-03-26', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (56, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-8', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (57, 'Today I really felt the burn.', '2022-02-7', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (58, 'Today I got pumped by that massive endorphin rush!', '2022-02-25', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (59, 'Today I hit a new personal best.', '2022-03-24', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (60, 'Today I continued increasing my stamina.', '2022-03-14', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (61, 'Today I truly enjoyed this workout.', '2022-05-20', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (62, 'Today I got pumped by that massive endorphin rush!', '2022-05-21', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (63, 'Today I got pumped by that massive endorphin rush!', '2022-04-11', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (64, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-24', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (65, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-14', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (66, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-5', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (67, 'Today I hit a new personal best.', '2022-05-18', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (68, 'Today I am starting to see the shred on my body.', '2022-04-14', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (69, 'Today I truly enjoyed this workout.', '2022-03-9', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (70, 'Today I continued increasing my stamina.', '2022-05-30', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (71, 'Today I finally felt like I\'m ready to break this plateau.', '2022-02-27', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (72, 'Today I did good.', '2022-05-26', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (73, 'Today I am starting to see the shred on my body.', '2022-02-19', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (74, 'Today I felt exhausted after working so hard the past two days.', '2022-03-11', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (75, 'Today I continued increasing my stamina.', '2022-05-12', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (76, 'Today I am starting to see the shred on my body.', '2022-05-16', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (77, 'Today I was crushed by the DOMS from my previous workout.', '2022-03-1', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (78, 'Today I am starting to see the shred on my body.', '2022-03-10', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (79, 'Today I did good.', '2022-04-6', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (80, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-6', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (81, 'Today I did good.', '2022-02-8', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (82, 'Today I truly enjoyed this workout.', '2022-03-18', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (83, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-17', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (84, 'Today I really felt the burn.', '2022-03-27', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (85, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-4', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (86, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-27', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (87, 'Today I wished I pushed harder.', '2022-03-19', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (88, 'Today I am starting to see the shred on my body.', '2022-03-20', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (89, 'Today I got pumped by that massive endorphin rush!', '2022-02-15', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (90, 'Today I truly enjoyed this workout.', '2022-03-8', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (91, 'Today I broke through these barriers I\'ve been feeling.', '2022-03-13', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (92, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-22', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (93, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-26', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (94, 'Today I cut more weight towards my goal.', '2022-03-13', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (95, 'Today I got pumped by that massive endorphin rush!', '2022-04-2', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (96, 'Today I hit a new personal best.', '2022-04-20', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (97, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-16', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (98, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-19', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (99, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-12', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (100, 'Today I truly enjoyed this workout.', '2022-03-18', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (101, 'Today I did good.', '2022-03-16', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (102, 'Today I wished I pushed harder.', '2022-04-5', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (103, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-13', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (104, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-11', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (105, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-02-14', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (106, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-20', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (107, 'Today I continued increasing my stamina.', '2022-02-28', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (108, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-02-18', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (109, 'Today I wished I pushed harder.', '2022-03-30', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (110, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-28', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (111, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-18', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (112, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-4', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (113, 'Today I did good.', '2022-03-5', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (114, 'Today I truly enjoyed this workout.', '2022-02-2', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (115, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-6', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (116, 'Today I truly enjoyed this workout.', '2022-02-24', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (117, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-28', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (118, 'Today I hit a new personal best.', '2022-03-19', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (119, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-13', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (120, 'Today I continued increasing my stamina.', '2022-04-11', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (121, 'Today I truly enjoyed this workout.', '2022-05-13', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (122, 'Today I continued increasing my stamina.', '2022-04-27', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (123, 'Today I truly enjoyed this workout.', '2022-04-21', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (124, 'Today I finally felt like I\'m ready to break this plateau.', '2022-02-18', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (125, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-7', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (126, 'Today I hit a new personal best.', '2022-05-30', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (127, 'Today I felt exhausted after working so hard the past two days.', '2022-02-24', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (128, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-3', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (129, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-6', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (130, 'Today I did good.', '2022-02-4', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (131, 'Today I felt exhausted after working so hard the past two days.', '2022-03-26', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (132, 'Today I wished I pushed harder.', '2022-02-7', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (133, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-3', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (134, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-2', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (135, 'Today I truly enjoyed this workout.', '2022-04-25', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (136, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-10', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (137, 'Today I did good.', '2022-03-17', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (138, 'Today I cut more weight towards my goal.', '2022-04-9', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (139, 'Today I got pumped by that massive endorphin rush!', '2022-02-20', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (140, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-7', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (141, 'Today I really felt the burn.', '2022-04-18', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (142, 'Today I felt exhausted after working so hard the past two days.', '2022-05-29', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (143, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-18', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (144, 'Today I wished I pushed harder.', '2022-03-5', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (145, 'Today I really felt the burn.', '2022-02-16', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (146, 'Today I wished I pushed harder.', '2022-03-18', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (147, 'Today I really felt the burn.', '2022-03-13', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (148, 'Today I did good.', '2022-03-5', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (149, 'Today I got pumped by that massive endorphin rush!', '2022-02-23', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (150, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-8', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (151, 'Today I wished I pushed harder.', '2022-05-1', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (152, 'Today I hit a new personal best.', '2022-03-10', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (153, 'Today I cut more weight towards my goal.', '2022-05-4', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (154, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-7', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (155, 'Today I wished I pushed harder.', '2022-03-3', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (156, 'Today I wished I pushed harder.', '2022-03-10', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (157, 'Today I felt exhausted after working so hard the past two days.', '2022-03-4', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (158, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-4', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (159, 'Today I was crushed by the DOMS from my previous workout.', '2022-03-2', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (160, 'Today I got pumped by that massive endorphin rush!', '2022-02-1', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (161, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-18', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (162, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-3', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (163, 'Today I broke through these barriers I\'ve been feeling.', '2022-03-25', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (164, 'Today I did good.', '2022-02-28', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (165, 'Today I did good.', '2022-02-28', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (166, 'Today I felt exhausted after working so hard the past two days.', '2022-05-7', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (167, 'Today I hit a new personal best.', '2022-03-11', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (168, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-20', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (169, 'Today I cut more weight towards my goal.', '2022-04-29', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (170, 'Today I really felt the burn.', '2022-04-24', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (171, 'Today I felt exhausted after working so hard the past two days.', '2022-04-10', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (172, 'Today I truly enjoyed this workout.', '2022-03-21', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (173, 'Today I did good.', '2022-03-22', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (174, 'Today I truly enjoyed this workout.', '2022-03-12', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (175, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-28', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (176, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-23', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (177, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-11', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (178, 'Today I felt exhausted after working so hard the past two days.', '2022-03-10', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (179, 'Today I continued increasing my stamina.', '2022-02-5', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (180, 'Today I wished I pushed harder.', '2022-02-13', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (181, 'Today I hit a new personal best.', '2022-04-16', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (182, 'Today I cut more weight towards my goal.', '2022-05-12', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (183, 'Today I cut more weight towards my goal.', '2022-02-21', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (184, 'Today I am starting to see the shred on my body.', '2022-03-26', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (185, 'Today I wished I pushed harder.', '2022-02-10', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (186, 'Today I felt exhausted after working so hard the past two days.', '2022-05-1', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (187, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-16', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (188, 'Today I really felt the burn.', '2022-04-12', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (189, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-18', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (190, 'Today I continued increasing my stamina.', '2022-04-11', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (191, 'Today I am starting to see the shred on my body.', '2022-04-17', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (192, 'Today I am starting to see the shred on my body.', '2022-02-27', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (193, 'Today I hit a new personal best.', '2022-03-1', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (194, 'Today I wished I pushed harder.', '2022-04-15', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (195, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-6', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (196, 'Today I got pumped by that massive endorphin rush!', '2022-05-26', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (197, 'Today I hit a new personal best.', '2022-03-15', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (198, 'Today I felt exhausted after working so hard the past two days.', '2022-05-3', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (199, 'Today I felt exhausted after working so hard the past two days.', '2022-03-7', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (200, 'Today I wished I pushed harder.', '2022-02-19', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (201, 'Today I cut more weight towards my goal.', '2022-03-27', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (202, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-24', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (203, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-10', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (204, 'Today I am starting to see the shred on my body.', '2022-05-6', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (205, 'Today I felt exhausted after working so hard the past two days.', '2022-04-9', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (206, 'Today I wished I pushed harder.', '2022-05-14', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (207, 'Today I got pumped by that massive endorphin rush!', '2022-02-5', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (208, 'Today I truly enjoyed this workout.', '2022-02-5', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (209, 'Today I am starting to see the shred on my body.', '2022-03-25', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (210, 'Today I hit a new personal best.', '2022-05-17', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (211, 'Today I hit a new personal best.', '2022-03-19', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (212, 'Today I felt exhausted after working so hard the past two days.', '2022-05-14', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (213, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-17', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (214, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-21', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (215, 'Today I am starting to see the shred on my body.', '2022-04-23', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (216, 'Today I did good.', '2022-04-26', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (217, 'Today I really felt the burn.', '2022-02-11', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (218, 'Today I hit a new personal best.', '2022-03-16', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (219, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-02-22', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (220, 'Today I truly enjoyed this workout.', '2022-04-19', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (221, 'Today I felt exhausted after working so hard the past two days.', '2022-03-3', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (222, 'Today I am starting to see the shred on my body.', '2022-05-8', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (223, 'Today I hit a new personal best.', '2022-03-19', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (224, 'Today I felt exhausted after working so hard the past two days.', '2022-04-30', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (225, 'Today I am starting to see the shred on my body.', '2022-03-22', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (226, 'Today I did good.', '2022-03-11', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (227, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-5', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (228, 'Today I am starting to see the shred on my body.', '2022-05-21', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (229, 'Today I continued increasing my stamina.', '2022-04-3', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (230, 'Today I felt exhausted after working so hard the past two days.', '2022-05-19', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (231, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-12', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (232, 'Today I got pumped by that massive endorphin rush!', '2022-05-26', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (233, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-13', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (234, 'Today I continued increasing my stamina.', '2022-03-13', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (235, 'Today I really felt the burn.', '2022-02-7', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (236, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-1', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (237, 'Today I did good.', '2022-03-29', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (238, 'Today I really felt the burn.', '2022-02-2', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (239, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-16', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (240, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-20', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (241, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-20', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (242, 'Today I broke through these barriers I\'ve been feeling.', '2022-03-9', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (243, 'Today I really felt the burn.', '2022-02-4', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (244, 'Today I hit a new personal best.', '2022-03-13', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (245, 'Today I was crushed by the DOMS from my previous workout.', '2022-03-30', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (246, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-11', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (247, 'Today I truly enjoyed this workout.', '2022-03-25', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (248, 'Today I really felt the burn.', '2022-03-22', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (249, 'Today I cut more weight towards my goal.', '2022-04-1', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (250, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-25', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (251, 'Today I am starting to see the shred on my body.', '2022-04-27', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (252, 'Today I broke through these barriers I\'ve been feeling.', '2022-03-23', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (253, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-23', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (254, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-15', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (255, 'Today I felt exhausted after working so hard the past two days.', '2022-03-23', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (256, 'Today I finally felt like I\'m ready to break this plateau.', '2022-02-23', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (257, 'Today I got pumped by that massive endorphin rush!', '2022-03-9', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (258, 'Today I wished I pushed harder.', '2022-04-4', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (259, 'Today I felt exhausted after working so hard the past two days.', '2022-03-26', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (260, 'Today I cut more weight towards my goal.', '2022-05-13', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (261, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-2', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (262, 'Today I continued increasing my stamina.', '2022-05-11', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (263, 'Today I did good.', '2022-05-11', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (264, 'Today I wished I pushed harder.', '2022-02-8', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (265, 'Today I cut more weight towards my goal.', '2022-05-28', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (266, 'Today I truly enjoyed this workout.', '2022-03-16', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (267, 'Today I got pumped by that massive endorphin rush!', '2022-03-24', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (268, 'Today I got pumped by that massive endorphin rush!', '2022-05-12', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (269, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-7', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (270, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-28', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (271, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-10', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (272, 'Today I did good.', '2022-04-26', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (273, 'Today I am starting to see the shred on my body.', '2022-02-8', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (274, 'Today I really felt the burn.', '2022-03-27', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (275, 'Today I continued increasing my stamina.', '2022-04-10', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (276, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-8', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (277, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-25', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (278, 'Today I wished I pushed harder.', '2022-05-2', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (279, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-23', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (280, 'Today I did good.', '2022-03-13', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (281, 'Today I am starting to see the shred on my body.', '2022-05-29', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (282, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-28', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (283, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-12', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (284, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-20', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (285, 'Today I continued increasing my stamina.', '2022-03-11', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (286, 'Today I cut more weight towards my goal.', '2022-05-26', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (287, 'Today I am starting to see the shred on my body.', '2022-04-27', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (288, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-2', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (289, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-02-2', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (290, 'Today I hit a new personal best.', '2022-05-3', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (291, 'Today I truly enjoyed this workout.', '2022-04-22', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (292, 'Today I continued increasing my stamina.', '2022-03-2', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (293, 'Today I got pumped by that massive endorphin rush!', '2022-02-5', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (294, 'Today I did good.', '2022-04-24', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (295, 'Today I hit a new personal best.', '2022-04-16', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (296, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-25', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (297, 'Today I got pumped by that massive endorphin rush!', '2022-03-10', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (298, 'Today I really felt the burn.', '2022-02-9', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (299, 'Today I truly enjoyed this workout.', '2022-02-16', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (300, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-11', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (301, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-11', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (302, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-21', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (303, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-13', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (304, 'Today I got pumped by that massive endorphin rush!', '2022-03-1', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (305, 'Today I truly enjoyed this workout.', '2022-04-18', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (306, 'Today I got pumped by that massive endorphin rush!', '2022-05-4', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (307, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-22', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (308, 'Today I hit a new personal best.', '2022-05-11', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (309, 'Today I cut more weight towards my goal.', '2022-02-6', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (310, 'Today I got pumped by that massive endorphin rush!', '2022-04-17', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (311, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-8', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (312, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-14', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (313, 'Today I felt exhausted after working so hard the past two days.', '2022-05-6', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (314, 'Today I got pumped by that massive endorphin rush!', '2022-04-23', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (315, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-16', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (316, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-02-15', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (317, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-9', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (318, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-24', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (319, 'Today I did good.', '2022-04-10', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (320, 'Today I felt exhausted after working so hard the past two days.', '2022-04-1', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (321, 'Today I truly enjoyed this workout.', '2022-03-10', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (322, 'Today I cut more weight towards my goal.', '2022-05-2', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (323, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-6', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (324, 'Today I hit a new personal best.', '2022-02-23', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (325, 'Today I continued increasing my stamina.', '2022-03-14', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (326, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-26', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (327, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-12', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (328, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-1', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (329, 'Today I got pumped by that massive endorphin rush!', '2022-04-20', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (330, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-1', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (331, 'Today I wished I pushed harder.', '2022-02-19', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (332, 'Today I did good.', '2022-03-22', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (333, 'Today I cut more weight towards my goal.', '2022-02-2', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (334, 'Today I cut more weight towards my goal.', '2022-03-15', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (335, 'Today I felt exhausted after working so hard the past two days.', '2022-05-29', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (336, 'Today I am starting to see the shred on my body.', '2022-03-7', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (337, 'Today I felt exhausted after working so hard the past two days.', '2022-02-20', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (338, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-13', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (339, 'Today I finally felt like I\'m ready to break this plateau.', '2022-02-9', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (340, 'Today I wished I pushed harder.', '2022-03-9', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (341, 'Today I cut more weight towards my goal.', '2022-05-27', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (342, 'Today I did good.', '2022-05-6', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (343, 'Today I am starting to see the shred on my body.', '2022-02-6', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (344, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-16', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (345, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-11', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (346, 'Today I got pumped by that massive endorphin rush!', '2022-05-13', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (347, 'Today I really felt the burn.', '2022-03-22', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (348, 'Today I am starting to see the shred on my body.', '2022-03-29', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (349, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-5', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (350, 'Today I continued increasing my stamina.', '2022-02-28', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (351, 'Today I continued increasing my stamina.', '2022-04-16', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (352, 'Today I hit a new personal best.', '2022-02-16', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (353, 'Today I did good.', '2022-02-17', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (354, 'Today I truly enjoyed this workout.', '2022-03-6', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (355, 'Today I am starting to see the shred on my body.', '2022-04-9', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (356, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-29', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (357, 'Today I really felt the burn.', '2022-04-13', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (358, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-12', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (359, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-6', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (360, 'Today I continued increasing my stamina.', '2022-04-29', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (361, 'Today I felt exhausted after working so hard the past two days.', '2022-02-7', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (362, 'Today I truly enjoyed this workout.', '2022-03-9', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (363, 'Today I am starting to see the shred on my body.', '2022-04-10', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (364, 'Today I felt exhausted after working so hard the past two days.', '2022-04-19', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (365, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-4', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (366, 'Today I continued increasing my stamina.', '2022-03-6', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (367, 'Today I really felt the burn.', '2022-04-15', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (368, 'Today I really felt the burn.', '2022-04-8', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (369, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-25', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (370, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-18', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (371, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-4', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (372, 'Today I truly enjoyed this workout.', '2022-05-12', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (373, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-22', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (374, 'Today I hit a new personal best.', '2022-02-25', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (375, 'Today I wished I pushed harder.', '2022-04-4', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (376, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-6', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (377, 'Today I wished I pushed harder.', '2022-03-12', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (378, 'Today I really felt the burn.', '2022-05-25', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (379, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-14', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (380, 'Today I truly enjoyed this workout.', '2022-03-5', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (381, 'Today I cut more weight towards my goal.', '2022-05-24', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (382, 'Today I am starting to see the shred on my body.', '2022-03-21', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (383, 'Today I really felt the burn.', '2022-04-26', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (384, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-30', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (385, 'Today I hit a new personal best.', '2022-02-22', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (386, 'Today I wished I pushed harder.', '2022-04-27', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (387, 'Today I hit a new personal best.', '2022-05-11', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (388, 'Today I got pumped by that massive endorphin rush!', '2022-03-8', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (389, 'Today I can really see the difference in my muscle mass and tone.', '2022-02-22', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (390, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-30', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (391, 'Today I did good.', '2022-05-15', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (392, 'Today I wished I pushed harder.', '2022-03-17', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (393, 'Today I continued increasing my stamina.', '2022-04-3', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (394, 'Today I got pumped by that massive endorphin rush!', '2022-05-13', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (395, 'Today I felt exhausted after working so hard the past two days.', '2022-05-26', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (396, 'Today I did good.', '2022-02-7', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (397, 'Today I can really see the difference in my muscle mass and tone.', '2022-03-22', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (398, 'Today I got pumped by that massive endorphin rush!', '2022-05-21', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (399, 'Today I am starting to see the shred on my body.', '2022-05-15', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (400, 'Today I continued increasing my stamina.', '2022-03-26', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (401, 'Today I truly enjoyed this workout.', '2022-04-15', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (402, 'Today I wished I pushed harder.', '2022-02-12', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (403, 'Today I can really see the difference in my muscle mass and tone.', '2022-05-8', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (404, 'Today I hit a new personal best.', '2022-03-29', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (405, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-24', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (406, 'Today I did good.', '2022-05-6', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (407, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-29', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (408, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-3', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (409, 'Today I hit a new personal best.', '2022-02-3', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (410, 'Today I cut more weight towards my goal.', '2022-02-20', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (411, 'Today I got pumped by that massive endorphin rush!', '2022-04-11', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (412, 'Today I did good.', '2022-02-20', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (413, 'Today I really felt the burn.', '2022-04-3', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (414, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-22', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (415, 'Today I did good.', '2022-05-2', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (416, 'Today I continued increasing my stamina.', '2022-04-9', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (417, 'Today I got pumped by that massive endorphin rush!', '2022-03-6', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (418, 'Today I felt exhausted after working so hard the past two days.', '2022-03-27', 5, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (419, 'Today I truly enjoyed this workout.', '2022-05-17', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (420, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-5', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (421, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-6', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (422, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-1', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (423, 'Today I really felt the burn.', '2022-02-12', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (424, 'Today I am starting to see the shred on my body.', '2022-04-28', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (425, 'Today I got pumped by that massive endorphin rush!', '2022-02-8', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (426, 'Today I felt exhausted after working so hard the past two days.', '2022-02-24', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (427, 'Today I hit a new personal best.', '2022-02-16', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (428, 'Today I wished I pushed harder.', '2022-04-29', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (429, 'Today I am starting to see the shred on my body.', '2022-03-25', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (430, 'Today I really felt the burn.', '2022-02-15', 4, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (431, 'Today I wished I pushed harder.', '2022-05-18', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (432, 'Today I really felt the burn.', '2022-04-10', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (433, 'Today I wished I pushed harder.', '2022-05-30', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (434, 'Today I did good.', '2022-03-22', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (435, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-05-26', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (436, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-26', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (437, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-15', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (438, 'Today I wished I pushed harder.', '2022-03-19', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (439, 'Today I can really see the difference in my muscle mass and tone.', '2022-04-8', 31, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (440, 'Today I felt exhausted after working so hard the past two days.', '2022-02-13', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (441, 'Today I really felt the burn.', '2022-05-7', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (442, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-2', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (443, 'Today I am starting to see the shred on my body.', '2022-02-18', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (444, 'Today I continued increasing my stamina.', '2022-03-29', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (445, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-30', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (446, 'Today I wished I pushed harder.', '2022-04-30', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (447, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-7', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (448, 'Today I felt exhausted after working so hard the past two days.', '2022-02-18', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (449, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-30', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (450, 'Today I got pumped by that massive endorphin rush!', '2022-05-22', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (451, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-6', 28, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (452, 'Today I wished I pushed harder.', '2022-05-6', 15, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (453, 'Today I truly enjoyed this workout.', '2022-03-2', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (454, 'Today I am starting to see the shred on my body.', '2022-04-28', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (455, 'Today I finally felt like I\'m ready to break this plateau.', '2022-04-5', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (456, 'Today I got pumped by that massive endorphin rush!', '2022-02-15', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (457, 'Today I cut more weight towards my goal.', '2022-05-3', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (458, 'Today I hit a new personal best.', '2022-04-15', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (459, 'Today I am starting to see the shred on my body.', '2022-04-24', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (460, 'Today I hit a new personal best.', '2022-03-1', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (461, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-02-16', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (462, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-03-29', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (463, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-25', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (464, 'Today I am starting to see the shred on my body.', '2022-05-13', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (465, 'Today I cut more weight towards my goal.', '2022-02-24', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (466, 'Today I hit a new personal best.', '2022-03-11', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (467, 'Today I got pumped by that massive endorphin rush!', '2022-05-14', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (468, 'Today I am starting to see the shred on my body.', '2022-05-2', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (469, 'Today I really felt the burn.', '2022-04-4', 21, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (470, 'Today I really felt the burn.', '2022-02-28', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (471, 'Today I hit a new personal best.', '2022-05-4', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (472, 'Today I finally felt like I\'m ready to break this plateau.', '2022-05-23', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (473, 'Today I continued increasing my stamina.', '2022-04-20', 11, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (474, 'Today I truly enjoyed this workout.', '2022-03-22', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (475, 'Today I was glad I had a partner to push me harder than I wanted to.', '2022-04-6', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (476, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-25', 8, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (477, 'Today I was crushed by the DOMS from my previous workout.', '2022-05-6', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (478, 'Today I got pumped by that massive endorphin rush!', '2022-03-16', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (479, 'Today I continued increasing my stamina.', '2022-03-6', 27, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (480, 'Today I wished I pushed harder.', '2022-04-1', 16, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (481, 'Today I continued increasing my stamina.', '2022-05-15', 23, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (482, 'Today I truly enjoyed this workout.', '2022-04-11', 19, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (483, 'Today I continued increasing my stamina.', '2022-03-27', 22, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (484, 'Today I did good.', '2022-04-5', 14, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (485, 'Today I continued increasing my stamina.', '2022-04-16', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (486, 'Today I continued increasing my stamina.', '2022-05-4', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (487, 'Today I cut more weight towards my goal.', '2022-02-9', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (488, 'Today I was crushed by the DOMS from my previous workout.', '2022-02-21', 26, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (489, 'Today I felt exhausted after working so hard the past two days.', '2022-04-17', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (490, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-18', 9, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (491, 'Today I felt exhausted after working so hard the past two days.', '2022-03-2', 18, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (492, 'Today I finally felt like I\'m ready to break this plateau.', '2022-03-19', 30, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (493, 'Today I continued increasing my stamina.', '2022-04-2', 25, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (494, 'Today I truly enjoyed this workout.', '2022-03-25', 24, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (495, 'Today I cut more weight towards my goal.', '2022-03-22', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (496, 'Today I hit a new personal best.', '2022-05-16', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (497, 'Today I cut more weight towards my goal.', '2022-02-4', 7, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (498, 'Today I am starting to see the shred on my body.', '2022-04-6', 2, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (499, 'Today I cut more weight towards my goal.', '2022-02-21', 6, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (500, 'Today I cut more weight towards my goal.', '2022-05-8', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (501, 'Today I broke through these barriers I\'ve been feeling.', '2022-04-30', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (502, 'Today I got pumped by that massive endorphin rush!', '2022-05-11', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (503, 'Today I broke through these barriers I\'ve been feeling.', '2022-05-19', 29, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (504, 'Today I did good.', '2022-02-10', 10, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (505, 'Today I did good.', '2022-04-17', 20, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (506, 'Today I did good.', '2022-04-16', 12, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (507, 'Today I cut more weight towards my goal.', '2022-05-27', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (508, 'Today I was crushed by the DOMS from my previous workout.', '2022-04-14', 17, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (509, 'Today I broke through these barriers I\'ve been feeling.', '2022-02-8', 13, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (510, 'Today I really felt the burn.', '2022-03-19', 3, 1);
INSERT INTO `journal` (`id`, `entry`, `created_at`, `customer_id`, `goal_id`) VALUES (511, 'Today I wished I pushed harder.', '2022-03-27', 26, 1);

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
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (1, 13);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (2, 1);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (2, 13);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (3, 1);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (3, 14);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (3, 13);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (4, 1);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (4, 13);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (5, 2);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (5, 11);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (6, 1);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (6, 13);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (7, 8);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (7, 9);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (8, 8);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (8, 9);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (9, 4);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (9, 15);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (10, 3);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (10, 5);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (11, 3);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (11, 11);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (12, 3);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (13, 3);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (13, 11);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (14, 3);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (15, 3);
INSERT INTO `facility_activity` (`facility_id`, `activity_id`) VALUES (15, 11);

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

