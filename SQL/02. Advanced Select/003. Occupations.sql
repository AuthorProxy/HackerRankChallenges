-- # Problem: https://www.hackerrank.com/challenges/occupations/problem
-- # Score: 30


SELECT
MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (SELECT a.Occupation,
         a.Name,
         (SELECT COUNT(*)
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS rank
  FROM Occupations AS a)
AS c GROUP BY c.rank;
