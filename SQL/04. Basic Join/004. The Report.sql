-- # Problem: https://www.hackerrank.com/challenges/the-report/problem
-- # Score: 20


SELECT
    IIF(g.Grade < 8, NULL, s.Name),
    g.grade,
    s.Marks
FROM STUDENTS s
JOIN GRADES g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC, s.Name, s.Marks;
