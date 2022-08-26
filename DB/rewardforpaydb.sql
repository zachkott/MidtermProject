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
  `logo_url` TEXT NULL,
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


-- -----------------------------------------------------
-- Table `squad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `squad` ;

CREATE TABLE IF NOT EXISTS `squad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(70) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_message` ;

CREATE TABLE IF NOT EXISTS `group_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `squad_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_message_group1_idx` (`squad_id` ASC),
  INDEX `fk_group_message_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_group_message_group1`
    FOREIGN KEY (`squad_id`)
    REFERENCES `squad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_message_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message_content` TEXT NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `message_from` INT NULL DEFAULT NULL,
  `message_to` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user1_idx` (`message_from` ASC),
  INDEX `fk_message_user2_idx` (`message_to` ASC),
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`message_from`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user2`
    FOREIGN KEY (`message_to`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_member` ;

CREATE TABLE IF NOT EXISTS `group_member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `squad_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_member_user1_idx` (`user_id` ASC),
  INDEX `fk_group_member_group1_idx` (`squad_id` ASC),
  CONSTRAINT `fk_group_member_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_member_group1`
    FOREIGN KEY (`squad_id`)
    REFERENCES `squad` (`id`)
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
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (8, 'Guest address', 'Guest city', 'Guest state', '97206', '111-111-1111');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (9, '4540 Haul Road', 'Portland', 'Oregon', '97206', '650-938-9509');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (10, '606 Wilson Street', 'Portland', 'Oregon', '93546', '760-924-1991');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (11, '194 Franklin Avenue', 'Portland', 'Oregon', '32810', '386-216-1071');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (12, '3362 Braxton Street', 'Portland', 'Oregon', '60606', '815-534-3849');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (13, '4043 Radio Park Drive', 'Portland', 'Oregon', '30648', '912-552-3444');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (14, '4841 Scheuvront Drive', 'Portland', 'Oregon', '80202', '303-534-4325');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (15, '4712 Chicago Avenue', 'Portland', 'Oregon', '93721', '559-618-2099');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (16, '2249 Stratford Court', 'Portland', 'Oregon', '27565', '919-693-9547');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (17, '3720 Yorkie Lane', 'Portland', 'Oregon', '31401', '912-916-2432');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `phone`) VALUES (18, '2574 Meadow Lane', 'Portland', 'Oregon', '94597', '707-293-3186');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `company` (`id`, `name`, `address_id`, `description`, `website_url`, `logo_url`) VALUES (1, 'Social Engineering', 5, 'Bringing together people, whether you like it or not.', 'https://helloworld.com/', 'data:image/png;base64,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');

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
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (5, 'Opertaions', NULL, 1, 'Super important for money', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (6, 'Marketing', NULL, 1, 'Boy! We can sure sell!', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (7, 'Maintenance', NULL, 1, 'Someone has to actually work around here.', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (8, 'Technology', NULL, 1, 'Smartest Programmer ever!', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (9, 'Guest', NULL, 1, 'Just visiting. ', NULL);
INSERT INTO `department` (`id`, `name`, `manager_id`, `company_id`, `description`, `website_url`) VALUES (10, 'Customer Service', NULL, 1, 'The customer isn\'t always right.', NULL);

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
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (1, 'Karen', 'Smith', 87206, 1, 1, NULL, 'data:image/jpeg;base64,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', '1980-01-20', 'I\'d like to speak with your manager.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (2, 'Bob', 'Dobbs', 79552, 2, 3, NULL, 'data:image/jpeg;base64,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', '1988-07-12', 'I\'m on break.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (3, 'Ryan', 'Cosby', 117551, 3, 3, 1, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFhYZGRgaGiEaGhwaHBgaGhocGhoaGhocHBoeIS4lHB4rIRoaJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHDQhJCs0NDQ0NDQxNDE0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQxNDQ0NDU0NDQxNDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAADAAECBAUGB//EADsQAAIBAgMFBgUBBwMFAAAAAAECAAMREiExBAVBUWEicYGRsfAGEzKhwdEjQlJywuHxFGKSBzSCorL/xAAYAQEAAwEAAAAAAAAAAAAAAAAAAQIDBP/EAB8RAQEAAwACAwEBAAAAAAAAAAABAhEhAzESQVFhE//aAAwDAQACEQMRAD8A5lEllEkaaSwqyFjossIkZEllEgRRLw4px6dOWESBFUhkpyapDhPKVAgloVKXlCU0hlWAIJJhIVKd4SwHvr9oAxT9++6Dw9IYJc+xJ4AO6WAFTOTwc4Zhlln5fmYu2b9RTYKxPEGwHgQc5Ui+1RVubiw1/vyhtnZHF1IPdPPt870dz2UKgHMXFxp426SvsO+qiMLMQR7zHl5SdmnppoRGnMjcvxAtRO3YOPJu6bLuDYyBF0ykcMMy5SGGWEMMZ0hSkjaAF6UC6y3gvGanAzzTiFKXPlxLSJvAoMlz6RqlK0vinYe+eXCAdIFB0vAvTl1lzgXp6/5gZzpKtanNOolpVqJnAzPlxSwaUUCsglqmogkSWUSBNVlqmkFSSW0pwJBOIlhEkUXKWKawGRIZFkkXOFRYEFQQtNLya05Jchl7/WAwFvflHROMSQ1oEMMi6KF7RAAzJJGXiYq9UIpbWw93nBb23pUqsTi7IyAysTwzIy75W1Mmz7+29Ec/LdsI1sxw36AdkjpaYNR6lTg2HrNLYt3Mz4iMVvpFsrnQm/ifKXtsZaQNu09uOZ8ALAespcmkxYCdkfSS3FmJC9wzuT7tAvQcm+HCPKWP9fUZtcN+ZYgC3Im3hKtesxuc1XgMrt71P2kzaLofZHZGxKxuDxYZHx1nRbv+IHF0bMNoQcw3MTiq9RlIN8Q4HMDTO3EWOUtrXDYcJsSR5kaS8Ur1PcG9lqouIjGCFtzPTwms6TyTYNtZWVgbZgier7BtK1KauvEffjJQYrGVYRhJqkAWCJ1hnHKRVLwBBImFoY2kGWBXK53gaolvBxgXEDPqJBtLb0oFk6QKVYSnUmnVp9JTqUgLwM3DFD4I8Coiyyi5QCCWaYvAPSWW1WAppLSGBJRLCCQRbSYF4BVHKGQCDRYUQCEcJEU5Jc44GdoEqaQxEiiwgEDH+IXVaRxNa+QHE/4952nF7PsxZl5Ln014+PpO2+IFC08eAOyjLFbCvMm+U5XZdpxNh42ueHv+56zPJfAZXYA4BiJJueZGvcOkzqpLg3Aa3U2F+p/EvhMYwL9ANv5ra35gmauy7suuQy9esy3pvrbi03YzPpl09THqbiZrlshwncDZMPCQrbNkL+7SbnSYRww3EpyuZTrbtem2Q04207p3XywDpLCUFaxIlZ5LKnLxY6eaJcHtcPec9H+Et6IKaozqDayrx1JJM5bf278DtYWzy9Zf+CtnV6g+nEuepDZcuek6Mctzblyx1dPRsMmiSRESyyA3Egqw5WRIgCkTCNINAgwgXWHtINlArNA+csst/GDdbQKtRZSrJNGqsqMsDOw24RQ2EcooGbTEt01lZJao6wLVOHpwKSwiHSAVBDqIFVllIElhAt4NDnJgZwCWhFgoVFgFA6xARCPeBnfEbW2Z/D1E863WjGrhXXpztl5Zz0D4mS+zPn9Nj95yfwxSD7WijliPcLTPJfD2v7p2JmZV4YiD3Z/gD7ztNn2XgBJ7PsCU7sSABc37ySfWCG8qLNZaigcb34ekyn9b2/iG1bLhzlcU1Zfv5yW37wQBmDBxYAWN7sSABlx1mXvLeopO9iGQYVbDmEIIxDr3yKmbRrU1LWEItG2ozmXW33TporMwub6Z5km32lSj8SK7i4Jvytly46SPim5fQ/xnsDhVYaHL3ymR8FqV21OF8Q/9TPQK9H5mzsDY3RreRtOB+HhfadmPG+fiDebYMM3qLiQMmxkAZqyPIkRwZFoEGkLQjLIlYEDImTwyAgRIgKgzEsMIOpAqVKeecrVEl9hK1QQM7B3xQ+Icj5RQMSmLS3RErUll/Z0vANTTy5y2rAeXd5/pAjIC1vDh4jX34ERYBUF8zDoINBDrAcJJ2jKIQQEFk1jASSiBIxRWklgU99JfZqoyzpnXunMf9OqN67sdVpgd3at5mxM6zedMtSdBqykCZ25NlShtJRL50lxcrqfzimWda+PHc20t91aaoWqvgUZAXAuToc+PSeb7/ek69h6xF7myMoY87sFB01znrdTZ1fUTK3h8NI+rHDrbIX8bXEzlrXjy74b2Ws9RUp3GeIYrnCRowANri89F3rutQioSbKmHTK4GRtfidb68Ze3RslKm7JSUdkdtuvBb/fxkfiGqFt10k3vUznHjO1bJUSoUqLoeze4BF8rW0/E6PcWykMGFBeYIfEe+xXXha8299UkYqKiZHINbiADmfHXoeUJs+wIoATLiLG1r8MjmfWTleImOnWbuUFBZSuIXIPA2Hf8A5nAblRaO2KXuf2rU16FicJP/ACnZ/DoIBXM25zkHZm25qBUC1VXBtmO2jA37iR4ycLxS4zfXoTHOOBGcZyVspswQKxrScgzcoEe+MY5MWGAKQ93hrQZgQg3MkSdRGa9oAaglapzlmqsrOMoFS4jx8EaBm0KOencMs/Hl1loPwXTw6dJVWqTxIHfeWKcCykPT0gaecsoBAIghkEgphEOcAghAJECSEB1EmBIiSECUUQjqYCJvB0NmCEv+9UtfmMItYdM7wg1gNuJVQ2IgK2Ytzy/IlMpuL4Za40RXwzJ33vz5SO7Z2FkHNjpJpUy66X+34nGfFm1EbRST91e2R1v2fub+EwnvTea9uk3HSr06Ie6YnbHUV7i+K+jjS2QzEW34qldAw7OpzGQU9r7X8pl7bVrOgINkKrq2HLK18+Yac3tux7SwwirccAHZi2fEgZ9/SXmjd/G18YbVUqJhRkCo2LAmZHBRi4sBcn+a3CP8JbSKoAY9pTmJjbm3BtANuzduBIvxvlr/AHjfDrNR23A4w3JUjkc4ym4iWznp6bQdVYhe8/2mUdiL7bjCjAqhmbK+Lgv2U8pL/UsXstjnqcrcLTX2NbJc8ST/AE/iTh1nndDXjNJSLzZkiY147GMBAdVzicSSRjAF3wRhSZG3KAJhykGMKxggYAH7oB5ZcSq3vpAr/Kv7EUL8z3YRQMBJdoypTGcu0RzgWUMsrKtId8soMoB0EKggVBhU1gGxRxIAASeKBIGSkVEk2kB1khICSBgSQxV6eJGXmCB32yiiasqAYmAucr8b8h4SpHNjaGK3sb3GLz/zMvbqYfbkZjkqhzyIW59bTT3ojI+MWwOM+h4HrMlNmx7SqXsDTN+oPZPrML7dOP456l8c11rtURKTKCQiurN2cwDcMCCRy6eO8n/U+uQo/wBJSxKMJYM4B0vhW3ZGWlzOb+H9zMld0qoSqXUngCPpbuIz7pqUdgRarHLCVuoPOabk5ETDLLtZu/PjDbKlgSiANiAprhIIYsO0xJ42yt6zXq7b82tQr2zqKrE/7guFvvMrem5XqMXVbUwfqbINmRZf4rWztpaaj7NgqbHT1/Zg94ZiQcuYN5GWrEzG47dLQc4rLmXfLMdBlOtSnhAXkLfacnu+qlOoa1TKnTF1K3N2fJRYDW3rOk3dvBKylkuLaq1gw5GwJy6y2E1GOd6sMbSJicZyGnGaKFaSYyFo9oEhpHvlGK6x+kAbQRMK0EogDYweLWFeBIgAdzflAFjnllLFS3OV2a/CALxikLiKBm0V9JaBsJUpNYy0IFqnpLCWGQlen0h1JgWEMIIEGTW8A+GSVLSMmTAUdjBu8ns2zu+g8eHnAbFD0aTP9Iv6ecu0d3Kv1do/b+8tjLTKBTbZlpo7ub4FLHlkCfGYmw7EzhKlazVMABOEC3GwA01M1/iUn/TVQATdVFgCblnUfmVWr4U8JjnWvjx+1fb6YZCMtDY2vbunK7sfFWUnJ6eJD1H1AgWB4+7Tp6L4hnodOk5jfaGhVWsoythccCOFu782mU631rrplqIrFmUdpbMbYgRn2XXivaJB4XmJtY3eGxLTUHWweoFFtMgdPKXG+XtNMFXwm1wQbEZ/cTkd5budCbVSfHOXlOe9NynTG0uuM4aKZKgGBbZ5KOJINrzC2zbDV2x9oXJUOGmOiDCLeMnsBwoxDEmxGtyTbL9Y+69lxMlMEEKcTa2xczzVdc9SbROIy7p1Nejg2RlNy5HzGvncLbFlyC3y6TnNxbxKbXSKucDnAyk3yYG1r9bTqN8OQqOhzTnxFrEHv4zjtr2JFqJtFE2RaiF6ZNmTti4U8V5cRGOXUXGfF6Id42+pCQGCkrwBF1YjkQQel5aBBFxmDKxoqjuozFlJ8mX+lZTpbVg49m82lc1jVAtHLQFPalYhb2Y6X490OVlkHBjNENI7QItILlJgxiYAHW8AGPGHeBMADi8C6gQzk3lZ2sDAB2YoBr+7xQKlHW8tqukz6L5S6jXEC4ssIJSD8zLVFriBaEkIENCgwCEySXY4QLk6QSLewE6Hd+yYBc/Uft0gVtl3bbN8+g08ZpKotYZDpEkfFmekB7QPy84Umw6nIRwOHhAofEe0fL2apUsTgCsR0V1xfa58JzyA1AHc2W17dOvKdiVBUqwuCMwc7g6g++M4hKDpdK5sKeWWjW0IGpuLTDzT7b+G+4I+1KAz6Ig10ueFpk7TtV0OMXU520YX5GRqbPW2pxdTToKewh1cj95hwErbx/aVAiAlEyv/ABEazHTq1HPVSUN6LkDPstca34jvlLaatZsz63m5vjZPluvANCbHu7EJrMuMr42BQZr2z772Phr08pt7v28ItlFrZtqSRwuTmfQSrtGzWYgCVKlMqbiLdpmPxdhW3gjopVhY6HgDb6T6zhdpqOdpQEkWqpb/AJrnCisyYgM0bVffGanwvudqjrUe5UEFAeNjr3cvE8JOM1VM7x6BsbF0LtqzEeHDyvMfYnLh6ba3OE9Qcps7Q2AIg0XJv5jmfLITJq0sFVuTdoeM0c6NEm2FtQcuYI9JtbLthIs2fXj4yrVS9n55N3218YyLJiGns73vzBz7uBhkbnpK2w5Fj0h66ZYhpxH5lkFjkHg/mSOK0CTwbRMb6GDZjxgQcSlWe8svKdc9PKBVqamPG+Wff+IoGZRMuo1rShTlynAtoZZRxKiGFRoFxDnD4pUR4anmQPCBubpofvnw/JmvTbMSpTUKoUaASSvAsiCon6v5iIg/aI6384HZ6gAdzorMfKAdmu+EaIM+8wyZStsQst2+pjiPjw8BaGd78ICduspbx2Ja6g4sDqLBtcuRHEenraPj9pBul/GVsl5SXV3HK7xFRAUYWvxGhHQ/jWZdFwhOXdO9LgizoGHHK48RM3ady0H+lijf7T6qdPtMr4vx1Y+bnXDb3ps6g6nhNbZgEoj+IiaR+GGAyrK3K6W/qMkvw89rF1t3H9ZW4ZLf64/rkzs1ySRM7aaYJtx0noA+HkH1OT3AD9ZKhsuz0j2EDMOI7Tf8jp5iTML9q5ebH6cbub4WZ2x1lKoDkhuC38w4Dpqe7Xr9mwI4CjQ5ngMrZczbwHoSo5bXIch+v6QapbQTSTTDLK5AKn1KTxJkNpp4kDD6kz714/rLTaxIcJHvwllUNk7aFb52y/H3jUnyuPv775G3y3BH0H2Qe6E2tAjg8HNx46++sAmwG5a+lrTSoHLPSZFB8IUE5s3/AM5+tpqrkxHu9rmEVS2hMDleHDuMEzS7vReyr8svtcfmZxY2Fu+WDq2WcZn4yDPI8M4EHqZZypWqdPffCVKmspO0BriKQxxQMum0tI8zabywjQNNGhlaZq1ZYR7wNSjnNHdiXqDoCfxMihUtNrdLDtHuEDcU59/rwkXOchiBHfke+Qx31OfraBaRu0O70lJ37CJ/G5Zv5V7XlpJtVt5H0gtjpF6mI/SihehY5nwGUqlpISc+eg6czJ3kPmDviJlkGLxYvHykWPWQZu+0JM7HnAuqtrn95J295wTkmVEWwjJQ3gzfgyOA/wATf83/AFkhfrEe77QBvRU6i/eS33YmRty06QlzHuYArSJhGkGMAci6XhIxgAU3uj8dD6EQW0ufk2P103UeBIF/EES8aauLN58Qe+Aq0uy6PkwUHF/EisGv3ixgVNrf9uqDgh88mP4nQVF5cv0E5ijUx7SG4lGv4kW+xUeBnQ0quJsv4iB/4KSfufuIRUd5H9iRzIHrMpB+9foJq7zcCkf5wB1ymKrd8sJv7MhVfLnIM8BUqEwGepKTVeQhC8ru0BYjFK5qdffnFAyabyyrRRQDo+Uu0BxPK/2J/EUUAqVgDxnVbDs+FFvq2Z8RcfaPFAsluB48uYgK9TLPXgY0UEVaW14nUaCxxcbFRc981dlN0HBNQOLf7m7+UeKVSPi6RsVo0UsBnaPecC+0C8UUqGWqDp+kdXPD35xRQGOLX1MGxPGKKAla2hjGrFFAgzH33f3gscUUBsR1iFWKKAejUuYTeFEsmJdcLIb8nUgeR9TFFLDl91V7AnVmsB668NftOg3SSSx4ICve5N3PdlaKKREUfbv+3JPRvEm/9X2mClSKKSI1HvK5e8UUADvKlRs4ooAcUUUUD//Z', '1974-08-24', 'Do you have those TPS reports?', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (4, 'Randy', 'Miller', 198255, 4, 2, NULL, 'data:image/jpeg;base64,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', '1963-08-24', 'Break time is over.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (5, 'Zach', 'Kotterer', 100000, 5, 8, NULL, 'https://marketplace.canva.com/Foblk/MAEItxFoblk/1/tl/canva-happy-man-icon-MAEItxFoblk.png', '1961-07-03', 'One smart cookie.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (6, 'Jamie', 'Patterson', 100000, 6, 8, NULL, 'https://marketplace.canva.com/5sWIg/MAEIt45sWIg/1/tl/canva-flat-style-round-people-avatar-icon-set%2C-yellow-purple-human-face-circle-icon-for-person-in-web-page%2C-flyer%2C-digital-game%2C-presentation-video%2C-account-forum%2C-user-vector-cartoon-illustration-isolated-on-white-background-MAEIt45sWIg.png', '1981-11-24', 'One smart cookie.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (7, 'Daniel', 'Schulenberg', 100000, 7, 8, NULL, 'https://marketplace.canva.com/Foblk/MAEItxFoblk/1/tl/canva-happy-man-icon-MAEItxFoblk.png', '1985-06-16', 'One smart cookie.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (8, 'Guest', 'Guest', 1, 8, 9, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSeTZh5JQUaK4oKl-rnqbpgp0wDOiafD8FiA&usqp=CAU', '1982-02-08', 'Welcome to the site! Create a user to view more!', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (9, 'Michael', 'Scott', 84336, 9, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-michael-scott.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1972-07-06', 'Sometimes I’ll start a sentence and I don’t even know where it’s going. I just hope I find it along the way.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (10, 'Dwight', 'Schrute', 51553, 10, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-dwight-schrute.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1986-01-14', 'I never thought I’d say this, but I think I ate too much bone marrow.”', 2);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (11, 'Pam', 'Beesley', 122978, 11, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-pam-beesly.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1980-11-14', 'And I feel God in this Chili’s tonight.', 2);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (12, 'Jim', 'Halpert', 163173, 12, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-jim-halpert.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1988-12-24', 'Everything I have I owe to this job… this stupid, wonderful, boring, amazing job.', 2);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (13, 'Kelly', 'Kapoor', 95774, 13, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-kelly-kapoor.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1995-08-29', 'I talk a lot, so I’ve learned to tune myself out.', 2);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (14, 'Phyllis', 'Vance', 46627, 14, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-phyllis-vance.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1981-03-29', 'I’m glad Michael’s getting help. He has a lot of issues, and he’s stupid.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (15, 'Andy', 'Bernard', 43319, 15, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-andy-bernard.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1976-01-23', 'It’s true. Around this office, in the past, I have been a little abrupt with people. But the doctor said, if I can’t find a new way to relate more positively to my surroundings, I’m going to die.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (16, 'Darryl', 'Philbin', 124299, 16, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-darryl-philbin.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1979-11-08', 'I meant dressed up compared to normal. You usually dress like a ghostbuster.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (17, 'Angela', 'Martin', 65219, 17, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-angela-martin.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1958-12-24', 'I normally don’t enjoy making people laugh.', 1);
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `address_id`, `department_id`, `supervisor_id`, `employee_photo`, `birthday`, `description`, `request_status_id`) VALUES (18, 'Kevin', 'Malone', 187105, 18, 10, NULL, 'https://roost.nbcuni.com/bin/viewasset.html/content/dam/Peacock/Landing-Pages/2-0-design/the-office/cast-the-office-kevin-malone.jpg/_jcr_content/renditions/original.JPEG?downsize=1200:*&output-quality=70', '1983-06-28', 'Me think, why waste time say lot word, when few word do trick.', 1);

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
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (1, 'Mouse Pad', 150, 1, 'data:image/jpeg;base64,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', 'Carpal Tunnel who?? Not when you have this!', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (2, 'Coffee Maker', 560, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCh5X6_1DVh9nCZtmUI7VZOSPyi-xM1sE8jg&usqp=CAU', 'When energy is low, this can help!', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (3, 'Trip to Mexico', 18000, 3, 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i9EEQ2PmgRmI/v1/600x-1.jpg', 'A magical place where you will find history, routes, gastronomy among many other things about Mexico.', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (4, 'PS4', 4700, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhfSrEDL2SoRRubOaUf5Wkl4IvaISbuaHlMA&usqp=CAU', 'A terrible work distraction, we don\'t recommend this one.', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (5, 'Company T-Shirt', 0, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQIm9YfXgsQj5LOc60e6MGG7RuWgKur9M0FQ&usqp=CAU', 'Everything is fine while working here!', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (6, '28in TV', 5700, 2, 'data:image/jpeg;base64,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', 'A terrible work distraction, we don\'t recommend this one.', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (7, 'Alaska Trip', 21000, 3, 'data:image/jpeg;base64,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', 'It may be cold, but who cares, its free!', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (8, 'Air Fryer', 1700, 2, 'data:image/jpeg;base64,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', 'Quick and easy, which allows you more time to work!', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (9, 'Pots and Pans', 2500, 2, 'https://food.fnr.sndimg.com/content/dam/images/food/products/2021/1/26/rx_rachael-ray-create-delicious-nonstick-cookware-pots-and-pans-set-13-piece.jpeg.rend.hgtvcom.616.616.suffix/1611697745590.jpeg', 'Coverts raw materials into fuel.', 1);
INSERT INTO `prize` (`id`, `name`, `points`, `tier_id`, `prize_url`, `description`, `request_status_id`) VALUES (10, 'Jabra Earbuds', 1500, 2, 'data:image/jpeg;base64,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', 'Relax and enjoy the next 5 hours of meetings!', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_redemption`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (1, 1, 1, '2017-10-18');
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (2, 1, 2, '2016-01-25');
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (3, 2, 2, '2019-06-28');
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (4, 6, 2, '2021-06-06');
INSERT INTO `point_redemption` (`id`, `reward_id`, `employee_id`, `redeemed_date`) VALUES (5, 8, 2, '2016-02-04');

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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (8, 'guest', 'guest', 1, 8);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (9, 'mscott', 'mscott', 1, 9);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (10, 'dschru', 'dschru', 1, 10);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (11, 'phalp', 'phalp', 1, 11);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (12, 'jhalp', 'jhalp', 1, 12);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (13, 'kkapo', 'kkapo', 1, 13);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (14, 'pvanc', 'pvanc', 1, 14);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (15, 'abern', 'abern', 1, 15);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (16, 'dphil', 'dphil', 1, 16);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (17, 'amart', 'amart', 1, 17);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `employee_id`) VALUES (18, 'kmalon', 'kmalon', 1, 18);

COMMIT;


-- -----------------------------------------------------
-- Data for table `point_award`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (1, 200, '2011-10-18', 1, 'Started this program.', 1, 1, 1);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (2, 75, '2010-06-02', 2, 'Took an extra shift.', 1, 1, 2);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (3, 10000, '2022-08-23', 2, 'Project idea for company.', 1, 1, 3);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (4, 125, '2015-11-08', 4, 'Showed up to work early.', 1, 1, 12);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (5, 75, '2010-05-17', 4, 'Finshined a major milestone.', 1, 1, 4);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (6, 100, '2009-01-05', 2, 'Took an extra shift.', 1, 1, 13);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (7, 45, '2006-05-05', 2, 'Finshined a major milestone.', 1, 1, 11);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (8, 160, '2007-02-19', 2, 'Showed up to work early.', 1, 1, 10);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (9, 75, '2004-11-10', 2, 'Took an extra shift.', 1, 1, 9);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (10, 65, '2014-08-29', 2, 'Project idea for company.', 1, 1, 16);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (11, 200, '2022-08-29', 8, 'EVENT: Ice Cream Social in the Park', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (12, 500, '2022-09-12', 8, 'EVENT: Quarterly Company Picnic', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (13, 100, '2022-09-9', 8, 'EVENT: Volunteer Day at the HighWay', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (14, 1000, '2022-09-16', 8, 'EVENT: Happy Hour Drinks', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (15, 200, '2022-10-03', 8, 'EVENT: Coffee with the CEO', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (16, 150, '2022-10-18', 8, 'EVENT: Engineering Department Social', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (17, 250, '2022-10-21', 8, 'EVENT: Bring your dog to work day', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (18, 600, '2022-10-26', 8, 'EVENT: Bring your cat to work day!', 1, 1, 8);
INSERT INTO `point_award` (`id`, `amount`, `issued`, `employee_id`, `description`, `award_status_id`, `judgement`, `requested_id`) VALUES (19, 350, '2022-10-28', 8, 'EVENT: All Hands Lunch in', 1, 1, 8);

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
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (3, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (4, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (5, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (6, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (7, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (8, 3);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (9, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (10, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (11, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (12, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (13, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (14, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (15, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (16, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (17, 2);
INSERT INTO `user_has_role` (`user_id`, `user_role_id`) VALUES (18, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `wishlist` (`prize_id`, `employee_id`) VALUES (6, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `squad`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `squad` (`id`, `name`) VALUES (1, 'Technology');
INSERT INTO `squad` (`id`, `name`) VALUES (2, 'Human Resouces');
INSERT INTO `squad` (`id`, `name`) VALUES (3, 'Engineering');

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_message`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `group_message` (`id`, `message`, `created`, `squad_id`, `user_id`) VALUES (1, 'Is this showing?', NULL, 3, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `message`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `message` (`id`, `message_content`, `created`, `message_from`, `message_to`) VALUES (1, 'Maybe now?', NULL, 6, 1);
INSERT INTO `message` (`id`, `message_content`, `created`, `message_from`, `message_to`) VALUES (2, 'Why?', NULL, 1, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_member`
-- -----------------------------------------------------
START TRANSACTION;
USE `rewardforpaydb`;
INSERT INTO `group_member` (`id`, `user_id`, `squad_id`) VALUES (1, 6, 1);
INSERT INTO `group_member` (`id`, `user_id`, `squad_id`) VALUES (2, 5, 1);
INSERT INTO `group_member` (`id`, `user_id`, `squad_id`) VALUES (3, 7, 1);
INSERT INTO `group_member` (`id`, `user_id`, `squad_id`) VALUES (4, 1, 3);

COMMIT;

