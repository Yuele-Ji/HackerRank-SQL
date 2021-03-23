WITH calc_max_score AS(
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id)
SELECT c.hacker_id, h.name, SUM(c.max_score)
FROM calc_max_score c
JOIN Hackers h
ON c.hacker_id = h.hacker_id
GROUP BY c.hacker_id, h.name
HAVING SUM(c.max_score) != 0
ORDER BY SUM(c.max_score) DESC, c.hacker_id
