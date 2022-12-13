-- Create employee Database
-----------------------------------------------------------------------------
CREATE DATABASE employee;

-----------------------------------------------------------------------------
-- Create hobby table in employee database
-----------------------------------------------------------------------------
CREATE TABLE `employee`.`hobby` ( 
    `id` INT(100) NOT NULL, 
    `name` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`)
);

-----------------------------------------------------------------------------
-- Create employee table in employee database
-----------------------------------------------------------------------------
CREATE TABLE `employee`.`employee` ( 
    `id` INT(100) NOT NULL, 
    `first_name` VARCHAR(200) NOT NULL, 
    `last_name` VARCHAR(200) NOT NULL, 
    `age` INT(3) NOT NULL, 
    `mobile_number` INT(10) NOT NULL, 
    `address` VARCHAR(500) NOT NULL, 
    PRIMARY KEY (`id`) 
); 

-------------------------------------------------------------------------------
-- Create employee_salary table in employee database
-------------------------------------------------------------------------------
CREATE TABLE `employee`.`employee_salary` ( 
    `id` INT(100) NOT NULL, 
    `salary` INT(100) NOT NULL, 
    `date` DATE NOT NULL, 
    `emp_id` INT(100) NOT NULL, 
    PRIMARY KEY (`id`) , 
    FOREIGN KEY (`emp_id`) REFERENCES `employee`.`employee`(`id`) 
); 

------------------------------------------------------------------------------
-- Create employee_hobby table in employee database
------------------------------------------------------------------------------
CREATE TABLE `employee`.`employee_hobby` ( 
    `id` INT(100) NOT NULL, 
    `emp_id` INT(100) NOT NULL, 
    `hobby_id` INT(100) NOT NULL, 
    PRIMARY KEY (`id`) , 
    FOREIGN KEY (`emp_id`) REFERENCES `employee`.`employee`(`id`), 
    FOREIGN KEY (`hobby_id`) REFERENCES `employee`.`hobby`(`id`) 
); 

------------------------------------------------------------------------------
