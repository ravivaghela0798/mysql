-- Create employee Database
-----------------------------------------------------------------------------
CREATE DATABASE employee;

-----------------------------------------------------------------------------
-- Create hobby table in employee database
-----------------------------------------------------------------------------
CREATE TABLE hobby ( 
    `id` INT(10) NOT NULL, 
    `name` VARCHAR(100) NOT NULL, 
    PRIMARY KEY (`id`) 
);

-----------------------------------------------------------------------------
-- Create employee table in employee database
-----------------------------------------------------------------------------
CREATE TABLE employee ( 
    `id` INT(10) NOT NULL, 
    `first_name` VARCHAR(50) NOT NULL, 
    `last_name` VARCHAR(50) NOT NULL, 
    `age` TINYINT NOT NULL, 
    `mobile_number` VARCHAR(17) NOT NULL, 
    `address` VARCHAR(200) NOT NULL, 
    PRIMARY KEY (`id`) 
); 

-------------------------------------------------------------------------------
-- Create employee_salary table in employee database
-------------------------------------------------------------------------------
CREATE TABLE employee_salary ( 
    `id` INT(10) NOT NULL, 
    `salary` DECIMAL(10,5) NOT NULL, 
    `date` DATE NOT NULL, 
    `fk_employee_id` INT(10) NOT NULL, 
    PRIMARY KEY (`id`) , 
    FOREIGN KEY (`fk_employee_id`) REFERENCES `employee`(`id`) 
);

------------------------------------------------------------------------------
-- Create employee_hobby table in employee database
------------------------------------------------------------------------------
CREATE TABLE employee_hobby ( 
    `id` INT(10) NOT NULL, 
    `fk_employee_id` INT(10) NOT NULL, 
    `fk_hobby_id` INT(10) NOT NULL, 
    PRIMARY KEY (`id`) , 
    FOREIGN KEY (`fk_employee_id`) REFERENCES `employee`(`id`), 
    FOREIGN KEY (`fk_hobby_id`) REFERENCES `hobby`(`id`) 
); 

------------------------------------------------------------------------------
