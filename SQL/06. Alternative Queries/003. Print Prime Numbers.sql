-- # Problem: https://www.hackerrank.com/challenges/print-prime-numbers/problem
-- # Score: 40


WITH cte(num) AS (
    SELECT TOP 1000 (ones.n + 10*tens.n + 100*hundreds.n)
    FROM (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ones(n),
         (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) tens(n),
         (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) hundreds(n)
    WHERE (ones.n + 10*tens.n + 100*hundreds.n) > 1
    ORDER BY 1
), result_cte(num) AS (
    SELECT cte.num FROM cte
    WHERE NOT EXISTS (
      SELECT 1 FROM cte cte2
      WHERE cte.num > cte2.num AND cte.num % cte2.num = 0
    )
)
SELECT STRING_AGG(num, '&') FROM result_cte;
