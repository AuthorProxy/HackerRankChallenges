-- # Problem: https://www.hackerrank.com/challenges/the-pads/problem
-- # Score: 30


SELECT Name + '(' + LEFT(Occupation, 1) + ')' FROM OCCUPATIONS ORDER BY Name;
SELECT FORMATMESSAGE('There are a total of %i %ss.', COUNT(Occupation), LOWER(Occupation)) FROM OCCUPATIONS GROUP BY Occupation ORDER BY COUNT(Occupation), Occupation;
