-- # Problem: https://www.hackerrank.com/challenges/weather-observation-station-20/problem
-- # Score: 40


SELECT CAST(LAT_N AS NUMERIC(12,4)) FROM STATION s WHERE (
    (
        SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N < s.LAT_N
    ) = (
        SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N > s.LAT_N
    )
);


---------------------------------


SELECT temp.lat_n FROM (
    SELECT
        CAST(LAT_N AS NUMERIC(12,4)) AS lat_n,
        PERCENT_RANK() OVER (ORDER BY LAT_N) AS rank
    FROM STATION
) temp
WHERE temp.rank = 0.5
ORDER BY temp.rank;
