-- # Problem: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
-- # Score: 50


/* Most stupid description showing how business customers usually formulate their inquiries */
/* TRANSCRIPT: EVERY RESULT ROW SHOULD CONTAIN:
    1. A submission_date
    2. Number of hackers who have submitted every day so far
    3. Minimal hacker_id of the hackers with the most submits on this day, regardless of which other days they submitted!!!
    4. Their_name
*/

WITH TEMP_CTE AS (
    SELECT
        s.hacker_id,
        h.name AS hacker_name,
        s.submission_date,
        COUNT(s.hacker_id) AS sumbissionsToday,
        COUNT(s.hacker_id) OVER (PARTITION BY s.hacker_id ORDER BY s.submission_date) AS daysSubmitted,
        DENSE_RANK() OVER (ORDER BY s.submission_date) AS dayNumber
    FROM Submissions s
    JOIN Hackers h ON h.hacker_id = s.hacker_id
    WHERE s.submission_date BETWEEN '2016-03-01' AND '2016-03-15'
    GROUP BY s.hacker_id, h.name, s.submission_date
),
SORTED_BY_WINNERS_PER_DAY_CTE AS (
      SELECT
          ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY submission_date, sumbissionsToday DESC, hacker_id) AS dayWinnerRating,
          *
      FROM TEMP_CTE
),
TOTAL_SUBMITTED_PER_DAY_CTE AS (
    SELECT submission_date, COUNT(daysSubmitted) AS totalSubmittedEveryDay
    FROM SORTED_BY_WINNERS_PER_DAY_CTE
    WHERE daysSubmitted = dayNumber
    GROUP BY dayNumber, submission_date, daysSubmitted
)
SELECT
    cte.submission_date,
    subq.totalSubmittedEveryDay,
    cte.hacker_id,
    cte.hacker_name
FROM SORTED_BY_WINNERS_PER_DAY_CTE cte
JOIN TOTAL_SUBMITTED_PER_DAY_CTE subq
ON subq.submission_date = cte.submission_date
WHERE dayWinnerRating = 1
ORDER BY cte.submission_date, cte.sumbissionsToday DESC, cte.hacker_id;
