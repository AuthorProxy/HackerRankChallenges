-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-- # Score: 30


-- TSql requires subqueries to use for ordering
SELECT temp1.* FROM (
    SELECT TOP 1 CITY, LEN(CITY) AS CITY_LEN FROM STATION ORDER BY LEN(CITY), CITY
) AS temp1 UNION
SELECT temp2.* FROM (
    SELECT TOP 1 CITY, LEN(CITY) AS CITY_LEN FROM STATION ORDER BY LEN(CITY) DESC, CITY
) AS temp2;


---------------------------------


SELECT temp.CITY, temp.CITY_LEN FROM (
    SELECT
        CITY,
        LEN(CITY) AS CITY_LEN,
        ROW_NUMBER() OVER (ORDER BY LEN(CITY), CITY) ROW_NUM
    FROM STATION
) AS temp
WHERE ROW_NUM = 1 OR ROW_NUM = (SELECT COUNT(*) FROM STATION);
