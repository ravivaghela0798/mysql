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
-- Insert multiple data in all tables
------------------------------------------------------------------------------
INSERT INTO employee (`id`, `first_name`, `last_name`, `age`, `mobile_number`, `address`) 
        VALUES ('1', 'ABC', 'DEF', '22', '9632587412', 'DBHJBDHJBD'),
               ('2', 'KJSK', 'DNKD', '23', '4444477787', 'HHFKFFKKFN'),
               ('3', 'NLNFFN', 'BDJBDB', '25', '5588555454', 'KNKJDBDKBFN'),
               ('4', 'LKDND', 'DHUID', '78', '7888544545', 'OUHDUIHDUIH'),
               ('5', 'NHDK', 'KNK', '88', '4646464644', 'DLKNDNDBFK');

INSERT INTO hobby (`id`, `name`) 
        VALUES ('1', 'SBJB'),
               ('2', 'IKHBDDB'),
               ('3', 'KJBDKDBDK'),
               ('4', 'DKJBDKJ'),
               ('5', 'HNFKF');

INSERT INTO employee_hobby (`id`, `fk_employee_id`, `fk_hobby_id`) 
        VALUES ('1', '1', '1'),
               ('2', '2', '2'),
               ('3', '4', '5'),
               ('4', '5', '3'),
               ('5', '3', '4');

INSERT INTO employee_salary (`id`, `salary`, `date`, `fk_employee_id`) 
        VALUES ('1', '45654.85', '2022-11-30', '3'),
               ('2', '75855.56', '2022-10-31', '2'),
               ('3', '85888.55', '2022-12-20', '3'),
               ('4', '56465.44', '2022-11-29', '1'),
               ('5', '46446.545', '2022-12-04', '5');



---------------------------------------------------------------------------------------
-- Update data of all table
---------------------------------------------------------------------------------------

UPDATE employee SET
                    `first_name` = 'Ravi' , 
                    `last_name` = 'Vaghela' , 
                    `age` = '24' , 
                    `address` = 'Kani, Patan, Gujarat, India' 
                WHERE 
                    `id` = '1'; 
--------------------------------------------------------------------------------------

UPDATE employee_hobby SET 
                            `fk_employee_id` = '3' , 
                            `fk_hobby_id` = '3'
                        WHERE 
                            `id` = '3'; 
-------------------------------------------------------------------------------------

UPDATE employee_salary SET 
                            `salary` = '50000.00' , 
                            `date` = '2022-08-31' , 
                            `fk_employee_id` = '5' 
                        WHERE 
                            `id` = '1';
------------------------------------------------------------------------------------

UPDATE hobby SET 
                `name` = 'Playing'
             WHERE 
                `id` = '1'; 

---------------------------------------------------------------------------------------
-- Delete two record of all tables
---------------------------------------------------------------------------------------
DELETE FROM hobby WHERE id in (4,5);
DELETE FROM employee WHERE id in (4,5);
DELETE FROM employee_salary WHERE id in (4,5);
DELETE FROM employee_hobby WHERE id in (4,5);

-----------------------------------------------------------------------------------
-- Truncate all tables
-----------------------------------------------------------------------------------
TRUNCATE TABLE employee_hobby;

TRUNCATE TABLE employee_salary;
-----------------------------------------------------------------------------------
-- disable foriehn key check
-----------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;

TRUNCATE TABLE employee;

TRUNCATE TABLE hobby;

SET FOREIGN_KEY_CHECKS=1;

------------------------------------------------------------------------------------
-- Select Queries for all tables
------------------------------------------------------------------------------------
SELECT * FROM employee;

SELECT * FROM hobby;

SELECT * FROM employee_salary;

SELECT * from employee_hobby;

------------------------------------------------------------------------------------
-- Select single query to get all employee name, all hobby_name in single column
------------------------------------------------------------------------------------
SELECT CONCAT(first_name, ' ', last_name) AS 'Name and Hobbies' FROM employee 
UNION
SELECT NAME FROM hobby;

------------------------------------------------------------------------------------
-- select query to get employee name, his/her employee_salary
------------------------------------------------------------------------------------
SELECT CONCAT(e.first_name, ' ', e.last_name) AS "Employee Name", 
IF(es.salary IS NOT NULL, ROUND(es.salary,3), 0.000) AS "Employee Salary" 
FROM employee AS e 
LEFT JOIN employee_salary AS es ON e.id = es.fk_employee_id;
     
------------------------------------------------------------------------------------
/* Select query to get employee name, total salary of employee, 
*   hobby name(comma-separated - you need to use subquery for hobby name)
*/
------------------------------------------------------------------------------------
SELECT 
	CONCAT(e.first_name, " ", e.last_name) AS "Employee Name", 
	IF(ROUND(SUM(es.salary),3) IS NOT NULL, ROUND(SUM(es.salary),3), 0.000) AS "Total Salary",
	(
		SELECT GROUP_CONCAT(h.name) FROM hobby h
		LEFT JOIN employee_hobby eh ON h.id = eh.fk_hobby_id WHERE e.id = eh.fk_employee_id
	) AS "Hobbies" 
	FROM employee e
	LEFT JOIN employee_salary es ON e.id = es.fk_employee_id
GROUP BY e.id;

------------------------------------------------------------------------------------

