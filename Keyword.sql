-- These Queries Performed on city and country table in world database (Default database in mysql)

========================================================================================================
Select Keyword
====================================

SELECT * FROM `world`.`city`;

SELECT * FROM `world`.`country`; 

------------------------------------

Where Keyword
=======================================================

SELECT * FROM `world`.`city` Where name = 'Patan';

SELECT * FROM `world`.`country` Where name = 'India';

-------------------------------------------------------

And / Or Keyword
============================================================================

SELECT * FROM `world`.`city` WHERE NAME = 'Patan' AND CountryCode = 'IND';

SELECT * FROM `world`.`country` WHERE NAME = 'India' OR NAME = 'Australia';

----------------------------------------------------------------------------

Group by Keyword 
============================================================================

SELECT COUNT(NAME), CountryCode  FROM `world`.`city` GROUP BY CountryCode;

SELECT COUNT(NAME), Continent FROM `world`.`country` GROUP BY Continent; 

----------------------------------------------------------------------------

Having Keyword
===================================================================================================

SELECT COUNT(NAME), CountryCode FROM `world`.`city` GROUP BY CountryCode HAVING COUNT(NAME) > 5;

SELECT COUNT(NAME), Continent FROM `world`.`country` GROUP BY Continent HAVING COUNT(NAME) >= 20;

---------------------------------------------------------------------------------------------------

Like Keyword
================================================================

SELECT NAME FROM `world`.`city` WHERE NAME LIKE 'A%';

SELECT NAME FROM `world`.`country` WHERE NAME LIKE 'A%';

----------------------------------------------------------------

Limit Keyword
================================================================

SELECT ID, NAME FROM `world`.`city` LIMIT 2000;

SELECT ID, NAME FROM `world`.`country` LIMIT 100;

----------------------------------------------------------------

Order by Keyword
================================================================

SELECT ID, NAME FROM `world`.`city` ORDER BY NAME;

SELECT ID, NAME FROM `world`.`city` ORDER BY NAME DESC;

----------------------------------------------------------------

Union / Union All Keyword
=======================================================================================

SELECT CountryCode FROM `world`.`city` UNION(SELECT CODE FROM `world`.`country`);

SELECT CountryCode FROM `world`.`city` UNION ALL(SELECT CODE FROM `world`.`country`);

---------------------------------------------------------------------------------------

Between Keyword
===============================================================================================

SELECT NAME, Population FROM `world`.`city` WHERE Population BETWEEN 5000000 AND 100000000;

SELECT NAME FROM `world`.`country` WHERE NAME BETWEEN 'Australia' AND 'India';

-----------------------------------------------------------------------------------------------

Any Keyword
============================================================================================================================

SELECT NAME FROM `world`.`city` WHERE CountryCode = ANY (SELECT CODE FROM `world`.`country` WHERE Population <= 1000000);

SELECT NAME FROM `world`.`country` WHERE CODE = ANY (SELECT CountryCode FROM `world`.`city` WHERE Population <= 1000000);

----------------------------------------------------------------------------------------------------------------------------

Distinct Keyword
==============================================================================

SELECT DISTINCT(CountryCode) FROM `world`.`city`;

SELECT DISTINCT(Region) FROM `world`.`country`;

------------------------------------------------------------------------------   
