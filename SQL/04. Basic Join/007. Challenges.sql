-- # Problem: https://www.hackerrank.com/challenges/challenges/problem
-- # Score: 30


WITH cte(hacker_id, name, challengesPerHacker, totalHackersWithSameRank) AS (
    SELECT
        h.hacker_id,
        h.name,
        COUNT(ch.challenge_id) as challengesPerHacker,
        COUNT(*) OVER (PARTITION BY COUNT(ch.challenge_id)) AS totalHackersWithSameRank
    FROM Challenges ch
    JOIN Hackers h ON h.hacker_id = ch.hacker_id
    GROUP BY h.hacker_id, h.name
)
SELECT hacker_id, name, challengesPerHacker FROM cte
WHERE totalHackersWithSameRank = 1 OR challengesPerHacker = (SELECT MAX(challengesPerHacker) FROM cte)
ORDER BY challengesPerHacker DESC, hacker_id;
