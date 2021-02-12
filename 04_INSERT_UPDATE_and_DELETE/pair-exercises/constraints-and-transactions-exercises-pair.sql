-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The
-- countrycode is 'USA', and population of 45001.
INSERT INTO city (name, countrycode, district, population) 
VALUES ('Smallville', 'USA', 'Kansas', 45001)

-- SELECT *
-- FROM City
-- WHERE name = 'Smallville'

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
--SELECT * 
--FROM countrylanguage

INSERT INTO countrylanguage (countrycode, language, isofficial, percentage)
VALUES ('USA', 'Kryptonese', '0', 0.0001)

--Select *
--FROM countrylanguage
--WHERE language = 'Kryptonese'



-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble." Change
-- the appropriate record accordingly.
UPDATE countrylanguage
SET language = 'Krypto-babble'
WHERE language = 'Kryptonese'

--Select *
--FROM countrylanguage
--WHERE language like 'Kryp%'

-- 4. Set the US capital to Smallville, Kansas in the country table.
--SELECT *
--FROM country
--WHERE code = 'USA'

UPDATE country
SET capital = 4080
WHERE code = 'USA'

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
DELETE FROM city
WHERE name = 'Smallville'
-- It failed because the id code in that line is referenced in the country table as the capital for USA.  

-- 6. Return the US capital to Washington.
--SELECT *
--FROM country
--WHERE code = 'USA'

--SELECT *
--FROM city
--WHERE name = 'Washington'

UPDATE country
SET capital = 3813
WHERE code = 'USA'

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
DELETE FROM city
WHERE name = 'Smallville'
-- Yes, because the table was no longer referenced in other tables/data sets

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972
-- (exclusive).
-- (590 rows affected)


--SELECT *
--FROM countrylanguage
--JOIN country ON countrylanguage.countrycode = country.code
--WHERE country.indepyear BETWEEN 1800 and 1972


UPDATE countrylanguage
SET isofficial = ~isofficial
FROM countrylanguage
JOIN country ON countrylanguage.countrycode = country.code
WHERE country.indepyear BETWEEN 1800 and 1972 



-- 9. Convert population so it's expressed in 1,000s for all cities. (Round up to
-- the nearest integer value.)
-- (4079 rows affected)
--SELECT *
--FROM city
--WHERE name = 'Washington'

--SELECT ROUND(CAST(population AS float) / 1000.00, 0)
--FROM city

UPDATE city
SET population = ROUND(CAST(population AS float) / 1000.00, 0)

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to
-- square meters for all countries where French is spoken by more than 20% of the
-- population.
-- (7 rows affected)

--SELECT country.name, surfacearea
--FROM country
--JOIN countrylanguage ON code = countrylanguage.countrycode
--WHERE ((language = 'French') and (percentage > 20))

Update country
SET surfacearea = surfacearea * 1609.34
FROM country
JOIN countrylanguage ON code = countrylanguage.countrycode
WHERE ((language = 'French') and (percentage > 20))


