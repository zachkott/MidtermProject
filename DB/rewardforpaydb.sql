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
  `description` TEXT NULL,
  `website_url` TEXT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `manager_id` INT NULL,
  `company_id` INT NOT NULL,
  `description` TEXT NULL,
  `website_url` TEXT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `salary` DOUBLE NULL,
  `address_id` INT NOT NULL,
  `department_id` INT NULL,
  `supervisor_id` INT NULL,
  `employee_photo` TEXT NULL,
  `birthday` DATE NULL,
  `description` TEXT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `points` INT NULL,
  `tier_id` INT NOT NULL,
  `prize_url` TEXT NULL,
  `description` TEXT NULL,
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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `employee_id` INT NOT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `issued` DATE NULL,
  `employee_id` INT NOT NULL,
  `description` TEXT NULL,
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


-- -----------------------------------------------------
-- Table `wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist` ;

CREATE TABLE IF NOT EXISTS `wishlist` (
  `prize_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`prize_id`, `employee_id`),
  INDEX `fk_prize_has_employee_employee1_idx` (`employee_id` ASC),
  INDEX `fk_prize_has_employee_prize1_idx` (`prize_id` ASC),
  CONSTRAINT `fk_prize_has_employee_prize1`
    FOREIGN KEY (`prize_id`)
    REFERENCES `prize` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prize_has_employee_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`)
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
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (6, '5934 Se Duke St', 'Portland', 'Oregon', '97206', '503-771-4637');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (7, '5934 Se Duke St', 'Portland', 'Oregon', '97206', '503-771-4637');

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
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (5, 'Zach', 'Knott', NULL, 5, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (6, 'Jamie', 'Patt', NULL, 6, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (7, 'Daniel', 'Schu', NULL, 7, NULL, NULL, NULL, NULL, NULL, 1);

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
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (1, 'Mouse Pad', 150, 1, 'data:image/jpeg;base64,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', NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (2, 'Coffee Maker', 560, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCh5X6_1DVh9nCZtmUI7VZOSPyi-xM1sE8jg&usqp=CAU', NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (3, 'Trip to Mexico', 18000, 3, 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i9EEQ2PmgRmI/v1/600x-1.jpg', NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (4, 'PS4', 4700, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhfSrEDL2SoRRubOaUf5Wkl4IvaISbuaHlMA&usqp=CAU', NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (5, 'Company T-Shirt', 360, 1, 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F1829%2F4817%2Fproducts%2Fkcg-thisisfine-shirt-black_1024x1024.jpg%3Fv%3D1571448921&imgrefurl=https%3A%2F%2Ftopatoco.com%2Fproducts%2Fkcg-thisisfine-army&tbnid=frHcrDQy7DZ7GM&vet=12ahUKEwjcxsCokt35AhUbHTQIHdy-AoMQMygAegUIARDgAg..i&docid=S7llUEHTbHwCRM&w=800&h=800&q=This%20is%20fine%20shirt&ved=2ahUKEwjcxsCokt35AhUbHTQIHdy-AoMQMygAegUIARDgAg', NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (6, '28in TV', 5700, 2, NULL, NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (7, 'Alaska Trip', 21000, 3, NULL, NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (8, 'Air Fryer', 1700, 2, NULL, NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (9, 'Pots and Pans', 2500, 2, 'https://food.fnr.sndimg.com/content/dam/images/food/products/2021/1/26/rx_rachael-ray-create-delicious-nonstick-cookware-pots-and-pans-set-13-piece.jpeg.rend.hgtvcom.616.616.suffix/1611697745590.jpeg', NULL, 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (10, 'Jabra Earbuds', 1500, 2, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_redemption`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (1, 1, 1, NULL);

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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (5, 'zkott', 'zkott', 1, 5);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (6, 'jpatt', 'jpatt', 1, 6);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (7, 'dschu', 'dschu', 1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_award`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (1, 25, NULL, 1, 'Good Job', 1, 1, 1);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (2, 75, NULL, 2, 'Took a shift', 2, 0, 2);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (3, 10000, NULL, 2, 'Was nice to me', 3, 1, 2);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (4, 125, NULL, 4, 'Good Job', 2, 1, 2);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (5, 75, NULL, 4, 'Good Job', 2, 1, 3);

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
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (5, 1);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (6, 1);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (7, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `wishlist` (`prize_id`, `employee_id`) VALUES (6, 1);

COMMIT;

