-- # Problem: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
-- # Score: 10


SELECT country.CONTINENT, FLOOR(AVG(city.POPULATION)) FROM CITY city
JOIN COUNTRY country
ON city.CountryCode = country.Code
GROUP BY country.CONTINENT;
