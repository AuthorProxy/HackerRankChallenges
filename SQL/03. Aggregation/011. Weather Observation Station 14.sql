-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-14/problem
-- # Score: 10


SELECT CAST(MAX(LAT_N) AS NUMERIC(12,4)) FROM STATION WHERE LAT_N < 137.2345;
