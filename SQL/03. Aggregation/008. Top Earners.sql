-- # Problem: https://www.hackerrank.com/challenges/earnings-of-employees/problem
-- # Score: 20


SELECT TOP 1 months * salary, COUNT(*) FROM Employee GROUP BY months * salary ORDER BY months * salary DESC;
