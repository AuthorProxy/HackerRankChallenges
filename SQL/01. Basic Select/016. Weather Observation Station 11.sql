-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-11/problem
-- # Score: 15


SELECT DISTINCT(CITY) FROM STATION WHERE CITY LIKE '[^aeiou]%' OR CITY LIKE '%[^aeiou]';
