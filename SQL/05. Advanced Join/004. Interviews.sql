-- # Problem: https://www.hackerrank.com/challenges/interviews/problem
-- # Score: 50


SELECT
    cont.contest_id,
    cont.hacker_id,
    cont.name,
    SUM(ss.total_submissions),
    SUM(ss.total_accepted_submissions),
    SUM(vs.total_views),
    SUM(vs.total_unique_views)
FROM Contests cont
JOIN Colleges coll ON coll.contest_id = cont.contest_id
JOIN Challenges ch ON ch.college_id = coll.college_id
LEFT JOIN (
    SELECT
        challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) vs ON vs.challenge_id = ch.challenge_id
LEFT JOIN (
    SELECT
        challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) ss ON ss.challenge_id = ch.challenge_id
GROUP BY cont.contest_id, cont.hacker_id, cont.name
HAVING
    SUM(ss.total_submissions) +
    SUM(ss.total_accepted_submissions) +
    SUM(vs.total_views) +
    SUM(vs.total_unique_views) <> 0
ORDER BY cont.contest_id;
