-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-13/problem
-- # Score: 10


SELECT CAST(SUM(LAT_N) AS NUMERIC(12,4)) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;
