-- # Problem: https://www.hackerrank.com/challenges/binary-search-tree-1/problem
-- # Score: 30


SELECT N, CASE
    WHEN P IS NULL THEN 'Root'
    WHEN (SELECT COUNT(*) FROM BST b WHERE a.N = b.P) > 0 THEN 'Inner'
    ELSE 'Leaf'
END
FROM BST a ORDER BY N;
