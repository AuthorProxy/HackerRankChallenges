-- # Problem: https://www.hackerrank.com/challenges/placements/problem
-- # Score: 40


SELECT s.Name FROM Students s
JOIN Packages sp ON sp.ID = s.ID
JOIN Friends f ON f.ID = s.ID
JOIN Packages fp ON fp.ID = f.Friend_ID
WHERE fp.Salary > sp.Salary
ORDER BY fp.Salary;
