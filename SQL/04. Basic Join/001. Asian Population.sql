-- # Problem: https://www.hackerrank.com/challenges/asian-population/problem
-- # Score: 10


SELECT SUM(city.POPULATION) FROM CITY city
JOIN COUNTRY country ON country.CODE = city.COUNTRYCODE
WHERE country.CONTINENT = 'Asia';
