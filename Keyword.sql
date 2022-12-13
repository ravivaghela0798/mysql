-- These Queries Performed on city and country table in world database (Default database in mysql)
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Select Keyword retrive data
----------------------------------------------------------------------------------------------------
SELECT * FROM `world`.`city`;

SELECT * FROM `world`.`country`; 


----------------------------------------------------------------------------------------------------
-- Where Keyword use forfiltered retrived data
----------------------------------------------------------------------------------------------------
SELECT * FROM `world`.`city` Where name = 'Patan';

SELECT * FROM `world`.`country` Where name = 'India';


----------------------------------------------------------------------------------------------------
-- And / Or Keyword used to filter records based on more than one condition:
----------------------------------------------------------------------------------------------------
SELECT * FROM `world`.`city` WHERE NAME = 'Patan' AND CountryCode = 'IND';

SELECT * FROM `world`.`country` WHERE NAME = 'India' OR NAME = 'Australia';


----------------------------------------------------------------------------------------------------
-- Group by Keyword groups rows that have the same values into summary rows
----------------------------------------------------------------------------------------------------
SELECT COUNT(NAME), CountryCode  FROM `world`.`city` GROUP BY CountryCode;

SELECT COUNT(NAME), Continent FROM `world`.`country` GROUP BY Continent; 

----------------------------------------------------------------------------------------------------

-- HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
----------------------------------------------------------------------------------------------------
SELECT COUNT(NAME), CountryCode FROM `world`.`city` GROUP BY CountryCode HAVING COUNT(NAME) > 5;

SELECT COUNT(NAME), Continent FROM `world`.`country` GROUP BY Continent HAVING COUNT(NAME) >= 20;


----------------------------------------------------------------------------------------------------
-- LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
----------------------------------------------------------------------------------------------------
SELECT NAME FROM `world`.`city` WHERE NAME LIKE 'A%';

SELECT NAME FROM `world`.`country` WHERE NAME LIKE 'A%';


----------------------------------------------------------------------------------------------------
-- LIMIT clause is used to specify the number of records to return.
----------------------------------------------------------------------------------------------------
SELECT ID, NAME FROM `world`.`city` LIMIT 2000;

SELECT ID, NAME FROM `world`.`country` LIMIT 100;


----------------------------------------------------------------------------------------------------
-- Order by Keyword is used to sort the result-set in ascending or descending order.
----------------------------------------------------------------------------------------------------
SELECT ID, NAME FROM `world`.`city` ORDER BY NAME;

SELECT ID, NAME FROM `world`.`city` ORDER BY NAME DESC;


----------------------------------------------------------------------------------------------------

-- Union / Union All Keyword used to combine the result-set of two or more SELECT statements.
----------------------------------------------------------------------------------------------------
SELECT CountryCode FROM `world`.`city` UNION(SELECT CODE FROM `world`.`country`);

SELECT CountryCode FROM `world`.`city` UNION ALL(SELECT CODE FROM `world`.`country`);


----------------------------------------------------------------------------------------------------
-- BETWEEN operator selects values within a given range. The values can be numbers, text, or dates
----------------------------------------------------------------------------------------------------
SELECT NAME, Population FROM `world`.`city` WHERE Population BETWEEN 5000000 AND 100000000;

SELECT NAME FROM `world`.`country` WHERE NAME BETWEEN 'Australia' AND 'India';


----------------------------------------------------------------------------------------------------
-- Any operators allow you to perform a comparison between a single column value and a range of other values
----------------------------------------------------------------------------------------------------
SELECT NAME FROM `world`.`city` WHERE CountryCode = ANY (
    SELECT CODE FROM `world`.`country` WHERE Population <= 1000000
);

SELECT NAME FROM `world`.`country` WHERE CODE = ANY (
    SELECT CountryCode FROM `world`.`city` WHERE Population <= 1000000
);


----------------------------------------------------------------------------------------------------
-- Distinct statement is used to return only distinct (different) values
----------------------------------------------------------------------------------------------------
SELECT DISTINCT(CountryCode) FROM `world`.`city`;

SELECT DISTINCT(Region) FROM `world`.`country`;


----------------------------------------------------------------------------------------------------