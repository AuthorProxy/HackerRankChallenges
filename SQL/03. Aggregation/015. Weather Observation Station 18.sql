-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-18/problem
-- # Score: 25


SELECT CAST(
    ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W))
AS NUMERIC(12,4))
FROM STATION;
