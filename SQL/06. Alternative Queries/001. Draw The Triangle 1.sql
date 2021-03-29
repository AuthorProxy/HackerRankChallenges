-- # Problem: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem
-- # Score: 25


DECLARE @R int = 20
WHILE @R > 0
BEGIN
    PRINT replicate('* ', @R)
    SET @R = @R - 1
END;
