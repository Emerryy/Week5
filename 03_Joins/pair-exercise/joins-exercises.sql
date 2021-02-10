-- Write queries to return the following:
-- The following queries utilize the "world" database.


-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)
SELECT City.name, country.name, city.population
FROM city
INNER JOIN Country
ON city.countrycode = country.code
WHERE city.population >1000000 and continent = 'Europe';


-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
SELECT City.name, country.name, city.population
FROM city
INNER JOIN Country ON city.countrycode = country.code
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE city.population >1000000 and countrylanguage.language = 'French' and isofficial=1;



-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
SELECT name, continent
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
where countrylanguage.language = 'Javanese'


-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
SELECT country.name
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = 'French' and isofficial=1 and continent = 'Africa';


-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
SELECT AVG(City.population)
FROM city
Join country on city.countrycode = country.code
where continent = 'Europe'

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)

-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)

-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)

-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)

-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
