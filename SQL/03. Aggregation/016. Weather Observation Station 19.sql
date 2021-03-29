-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-19/problem
-- # Score: 30


SELECT CAST(SQRT(
    POWER(MIN(LAT_N) - MAX(LAT_N), 2) + POWER(MIN(LONG_W) - MAX(LONG_W), 2)
) AS NUMERIC(12,4))
FROM STATION;
