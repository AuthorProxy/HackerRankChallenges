-- # Problem: https://www.hackerrank.com/challenges/contest-leaderboard/problem
-- # Score: 30


WITH cte(hacker_id, name, score, rowNumber) AS (
    SELECT
        h.hacker_id,
        h.name,
        s.score,
        ROW_NUMBER() OVER (PARTITION BY h.hacker_id, s.challenge_id ORDER BY s.score DESC) AS rowNumber
    FROM Submissions s
    JOIN Hackers h ON h.hacker_id = s.hacker_id
)
SELECT hacker_id, name, SUM(score) AS totalScore FROM cte
WHERE rowNumber = 1
GROUP BY hacker_id, name
HAVING SUM(score) <> 0
ORDER BY totalScore DESC, hacker_id;
