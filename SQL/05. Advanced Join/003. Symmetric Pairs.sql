-- # Problem: https://www.hackerrank.com/challenges/symmetric-pairs/problem
-- # Score: 40


SELECT f1.x, f1.y FROM Functions f1
JOIN Functions f2 ON f1.x = f2.y AND f2.x = f1.y
GROUP BY f1.x, f1.y
HAVING COUNT(f1.x) > 1 OR f1.x < f1.y
ORDER BY f1.x;
