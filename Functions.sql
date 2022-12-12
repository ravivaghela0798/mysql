Functions in MySQL
===========================================================================================

CONCAT() Function -- Combine String in One String
SELECT CONCAT("Indiranagar, ", "Kani, ", "Patan, ", "Gujarat, ", "India") AS Address;

-------------------------------------------------------------------------------------------

COUNT() Function -- Count only number of getting rows 
==========================================================

SELECT COUNT(NAME) AS 'Total City' FROM `world`.`city`;

SELECT COUNT(NAME) AS 'Total City' FROM `world`.`city`;

----------------------------------------------------------

SUM() Function -- Sum of total values in the getting rows
========================================================================================================

SELECT SUM(Population) AS "Total India's Population" FROM  `world`.`city` WHERE CountryCode = "IND";

SELECT SUM(Population) AS 'Total World Population' FROM  `world`.`country`;

--------------------------------------------------------------------------------------------------------

Trim() Function -- Remove leading and trailing spaces from a string
========================================================================================================

SELECT TRIM("     MySQL Functions    ") AS 'Trimed String';

--------------------------------------------------------------------------------------------------------

UPPER() Function -- 
========================================================================================================

SELECT UPPER("ravi vaghela") AS NAME;

--------------------------------------------------------------------------------------------------------

LENGTH() Function -- Get String Length
========================================================================================================

SELECT LENGTH("Ravi Vaghela") AS 'String Length';

-------------------------------------------------------------------------------------------------------

DATE() Function -- Get in Date format
=======================================================================================================

SELECT DATE(payment_date) AS DATE FROM `sakila`.`payment`;

-------------------------------------------------------------------------------------------------------

ROUND() Function -- Get Round(near value) Value from getting value
=======================================================================================================

SELECT ROUND(55.49) AS ROUND;

SELECT ROUND(55.50) AS ROUND;

-------------------------------------------------------------------------------------------------------

POW() FUNCTION -- returns the value of a number raised to the power of another number
=======================================================================================================

SELECT POW(5,8) AS POWER;

-------------------------------------------------------------------------------------------------------

CASE Expression
=======================================================================================================

SELECT ID, NAME, Population,
CASE 
	WHEN Population > 500000 THEN 'Total Population is greater than 500000'
	WHEN Population = 500000 THEN 'Total Population is 500000'
	ELSE 'The Population is under 500000' 
END AS Cities FROM `world`.`city`;

-------------------------------------------------------------------------------------------------------

IF() CONDITION
=======================================================================================================

SELECT ID, Population, IF(Population > 500000, "MORE", "LESS") FROM `world`.`city`;

------------------------------------------------------------------------------------------------------

VERSION() FUNCTION 
======================================================================================================

SELECT VERSION();




