-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rewardforpaydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rewardforpaydb` ;

-- -----------------------------------------------------
-- Schema rewardforpaydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rewardforpaydb` ;
USE `rewardforpaydb` ;

-- -----------------------------------------------------
-- Table `user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_role` ;

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `description` VARCHAR(200) NULL,
  `website_url` VARCHAR(2000) NULL,
  `logo_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_company_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department` ;

CREATE TABLE IF NOT EXISTS `department` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `manager_id` INT NULL,
  `company_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `website_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_department_company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_department_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `request_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `request_status` ;

CREATE TABLE IF NOT EXISTS `request_status` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `salary` DOUBLE NULL,
  `address_id` INT NOT NULL,
  `department_id` INT NULL,
  `supervisor_id` INT NULL,
  `employee_photo` VARCHAR(2000) NULL,
  `birthday` DATE NULL,
  `description` VARCHAR(200) NULL,
  `request_status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_address1_idx` (`address_id` ASC),
  INDEX `fk_employee_department1_idx` (`department_id` ASC),
  INDEX `fk_employee_employee1_idx` (`supervisor_id` ASC),
  INDEX `fk_employee_request_status1_idx` (`request_status_id` ASC),
  CONSTRAINT `fk_employee_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_employee1`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_request_status1`
    FOREIGN KEY (`request_status_id`)
    REFERENCES `request_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tier` ;

CREATE TABLE IF NOT EXISTS `tier` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `threshold` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prize`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prize` ;

CREATE TABLE IF NOT EXISTS `prize` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `points` INT NULL,
  `tier_id` INT NOT NULL,
  `prize_url` VARCHAR(2000) NULL,
  `description` VARCHAR(45) NULL,
  `request_status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reward_tier_idx` (`tier_id` ASC),
  INDEX `fk_prize_request_status1_idx` (`request_status_id` ASC),
  CONSTRAINT `fk_reward_tier`
    FOREIGN KEY (`tier_id`)
    REFERENCES `tier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prize_request_status1`
    FOREIGN KEY (`request_status_id`)
    REFERENCES `request_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_redemption`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_redemption` ;

CREATE TABLE IF NOT EXISTS `point_redemption` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reward_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `redeemed_date` DATE NULL,
  PRIMARY KEY (`id`, `reward_id`, `employee_id`),
  INDEX `fk_reward_has_employee_employee1_idx` (`employee_id` ASC),
  INDEX `fk_reward_has_employee_reward1_idx` (`reward_id` ASC),
  CONSTRAINT `fk_reward_has_employee_reward1`
    FOREIGN KEY (`reward_id`)
    REFERENCES `prize` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reward_has_employee_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `deduction_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deduction_type` ;

CREATE TABLE IF NOT EXISTS `deduction_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paystub`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `paystub` ;

CREATE TABLE IF NOT EXISTS `paystub` (
  `id` INT NOT NULL,
  `issued` DATE NULL,
  `amount` DOUBLE NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_paystub_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_paystub_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `deduction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deduction` ;

CREATE TABLE IF NOT EXISTS `deduction` (
  `id` INT NOT NULL,
  `deduction_type_id` INT NOT NULL,
  `percent` DECIMAL(3,3) NULL,
  `paystub_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_deductions_deduction_type1_idx` (`deduction_type_id` ASC),
  INDEX `fk_deductions_paystub1_idx` (`paystub_id` ASC),
  CONSTRAINT `fk_deductions_deduction_type1`
    FOREIGN KEY (`deduction_type_id`)
    REFERENCES `deduction_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deductions_paystub1`
    FOREIGN KEY (`paystub_id`)
    REFERENCES `paystub` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `employee_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_user_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `point_award`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `point_award` ;

CREATE TABLE IF NOT EXISTS `point_award` (
  `id` INT NOT NULL,
  `amount` INT NULL,
  `issued` DATE NULL,
  `employee_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `award_status_id` INT NOT NULL,
  `judgement` TINYINT NULL,
  `requested_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_point_award_employee1_idx` (`employee_id` ASC),
  INDEX `fk_point_award_award_status1_idx` (`award_status_id` ASC),
  INDEX `fk_point_award_user1_idx` (`requested_id` ASC),
  CONSTRAINT `fk_point_award_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_award_award_status1`
    FOREIGN KEY (`award_status_id`)
    REFERENCES `request_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_award_user1`
    FOREIGN KEY (`requested_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_role` ;

CREATE TABLE IF NOT EXISTS `user_has_role` (
  `user_id` INT NOT NULL,
  `user_role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `user_role_id`),
  INDEX `fk_user_has_user_role_user_role1_idx` (`user_role_id` ASC),
  INDEX `fk_user_has_user_role_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_user_role_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_role_user_role1`
    FOREIGN KEY (`user_role_id`)
    REFERENCES `user_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS rewardforpay@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'rewardforpay'@'localhost' IDENTIFIED BY 'rewardforpay';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'rewardforpay'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `user_role` (`id`, `name`) VALUES (1, 'Admin');
INSERT INTO `user_role` (`id`, `name`) VALUES (2, 'Employee');
INSERT INTO `user_role` (`id`, `name`) VALUES (3, 'Guest');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (1, '11924 Se Division', 'Portland', 'Oregon', '97266', '503-761-5974');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (2, '111 Sw Fifth Ave Suite 3150', 'Portland', 'Oregon', '97204', '503-217-4114');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (3, '1441 North Marine Drive', 'Portland', 'Oregon', '97217', '503-894-9279');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (4, '20360 Sw Westside Dr', 'Portland', 'Oregon', '97078', '503-277-8642');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (5, '5934 Se Duke St', 'Portland', 'Oregon', '97206', '503-771-4637');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `company` (`id`, `name`, `address_id`, `description`, `website_url`, `logo_url`) VALUES (1, 'Social Engineering', 5, 'Bringing together people, whether you like it or not.', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `department`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (1, 'Human Resources', 1, 1, 'We serve the company,not people.', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (2, 'Engineering', 2, 1, 'Fixing things, 1 tiny step at a time.', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (3, 'Engineering', NULL, 1, 'Fixing things, 1 tiny step at a time.', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (4, 'Human Resources', NULL, 1, 'We serve the company,not people.', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `request_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `request_status` (`id`, `name`) VALUES (1, 'Approved');
INSERT INTO `request_status` (`id`, `name`) VALUES (2, 'Pending');
INSERT INTO `request_status` (`id`, `name`) VALUES (3, 'Declined');
INSERT INTO `request_status` (`id`, `name`) VALUES (4, 'Withdrawn');

COMMIT;


-- -----------------------------------------------------
-- Data for table `employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (1, 'Karen', 'Smith', 85000, 1, 1, NULL, NULL, NULL, 'I\'d like to speak with your manager.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (2, 'Bob', 'Dobbs', 65000, 2, 3, NULL, NULL, NULL, 'I\'m on break.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (3, 'Ryan', 'Cosby', 110000, 3, 3, 1, NULL, NULL, 'Do you have those TPS reports?', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (4, 'Randy', 'Miller', 220000, 4, 2, NULL, NULL, NULL, 'Break time is over.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (5, 'Zach', 'Knott', NULL, 3, NULL, NULL, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tier`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `tier` (`id`, `name`, `threshold`) VALUES (1, 'Copper', 100);
INSERT INTO `tier` (`id`, `name`, `threshold`) VALUES (2, 'Silver', 1000);
INSERT INTO `tier` (`id`, `name`, `threshold`) VALUES (3, 'Gold', 10000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prize`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (1, 'Mouse Pad', 50, 1, NULL, NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (2, 'Coffee Maker', 125, 2, NULL, NULL, 2);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (3, 'Trip to Mexico', 12000, 3, NULL, NULL, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_redemption`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (1, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `deduction_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `deduction_type` (`id`, `name`, `description`) VALUES (1, 'retirement', '%15 retirement fund');

COMMIT;


-- -----------------------------------------------------
-- Data for table `paystub`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `paystub` (`id`, `issued`, `amount`, `employee_id`) VALUES (1, NULL, 2434, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `deduction`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `deduction` (`id`, `deduction_type_id`, `percent`, `paystub_id`) VALUES (1, 1, .15, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (1, 'ksmith', 'ksmith', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (2, 'bdobbs', 'bdobbs', 1, 2);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (3, 'rcosby', 'rcosby', 1, 3);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (4, 'rmiller', 'rmiller', 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_award`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (1, 200, NULL, 1, 'Good Job', 1, 1, 1);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (2, 75, NULL, 2, 'Took a shift', 2, 0, 2);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (3, 10000, NULL, 2, 'Was nice to me', 3, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (1, 1);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (2, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (3, 1);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (4, 1);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (1, 2);

COMMIT;

