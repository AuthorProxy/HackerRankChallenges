-- # Problem: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
-- # Score: 30


SELECT id, age, coins_needed, power FROM (
    SELECT
        w.id,
        wp.code,
        wp.age,
        w.power,
        w.coins_needed,
        MIN(w.coins_needed) OVER (PARTITION BY wp.code, wp.age, w.power ORDER BY w.coins_needed) min_coins_needed
    FROM Wands w
    JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
) gr
WHERE coins_needed - min_coins_needed = 0
ORDER BY power DESC, age DESC;


---------------------------------


SELECT id, age, coins_needed, power FROM (
    SELECT
        w.id,
        wp.code,
        wp.age,
        w.power,
        w.coins_needed,
        ROW_NUMBER() OVER (PARTITION BY wp.code, wp.age, w.power ORDER BY w.coins_needed) RowNumber
    FROM Wands w
    JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
) gr
WHERE RowNumber = 1
ORDER BY power DESC, age DESC;



---------------------------------


WITH CTE(code, age, coins_needed, power) AS (
    SELECT wp.code, wp.age, MIN(w.coins_needed), w.power FROM Wands w
    JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY wp.code, wp.age, w.power
)
SELECT w.id, cte.age, cte.coins_needed, cte.power
FROM CTE cte JOIN Wands w ON cte.code = w.code
WHERE cte.coins_needed = w.coins_needed
ORDER BY power DESC, age DESC;
