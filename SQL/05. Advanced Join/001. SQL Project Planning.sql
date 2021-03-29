-- # Problem: https://www.hackerrank.com/challenges/sql-projects/problem
-- # Score: 40


WITH CTE AS
(
  SELECT
    Start_Date,
    End_Date,
    DATEDIFF(DAY, ROW_NUMBER() OVER (ORDER BY Start_Date), Start_Date) AS dateDiff
  FROM Projects WITH (NOLOCK)
)
SELECT MIN(Start_Date), MAX(End_Date)
FROM CTE WITH (NOLOCK)
GROUP BY dateDiff
ORDER BY DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)), MIN(Start_Date);


---------------------------------


SELECT Start_Date, MIN(End_Date)
FROM
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
    (SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) b
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(DAY, Start_Date, MIN(End_Date)), Start_Date;
