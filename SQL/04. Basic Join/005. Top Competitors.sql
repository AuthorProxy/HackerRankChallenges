-- # Problem: https://www.hackerrank.com/challenges/full-score/problem
-- # Score: 30


SELECT h.hacker_id, h.Name
FROM Hackers h
JOIN Submissions s ON s.hacker_id = h.hacker_id
JOIN Challenges ch ON ch.challenge_id = s.challenge_id
JOIN Difficulty d ON ch.difficulty_level = d.difficulty_level AND s.score = d.score
GROUP BY h.hacker_id, h.Name HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, hacker_id;
