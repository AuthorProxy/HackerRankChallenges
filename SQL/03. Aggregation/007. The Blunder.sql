-- # Problem: https://www.hackerrank.com/challenges/the-blunder/problem
-- # Score: 15


SELECT CEILING(
    AVG(
        CAST(SALARY AS DECIMAL (12,2))
    ) - AVG(
        CAST(REPLACE(SALARY, '0', '') AS DECIMAL (12,2))
    )
) FROM EMPLOYEES;
