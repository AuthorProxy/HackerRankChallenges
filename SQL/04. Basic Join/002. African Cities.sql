-- # Problem: https://www.hackerrank.com/challenges/african-cities/problem
-- # Score: 10


SELECT city.NAME FROM CITY city
JOIN COUNTRY country
ON city.CountryCode = country.Code
WHERE country.CONTINENT = 'Africa';
