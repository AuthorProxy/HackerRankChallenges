-- # Problem: https://www.hackerrank.com/challenges/draw-the-triangle-2/problem
-- # Score: 25


DECLARE @R int = 20
DECLARE @index int = 1
WHILE @index <= @R
BEGIN
    PRINT replicate('* ', @index)
    SET @index = @index + 1
END;
