-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-2/problem
-- # Score: 15


SELECT CAST(SUM(LAT_N) AS NUMERIC(12,2)), CAST(SUM(LONG_W) AS NUMERIC(12,2)) FROM STATION;
