-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-17/problem
-- # Score: 15


SELECT TOP 1 CAST(LONG_W AS NUMERIC(12,4)) FROM STATION WHERE LAT_N > 38.7780 ORDER BY LAT_N;
