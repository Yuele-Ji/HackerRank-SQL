WITH count_hacker AS(
    SELECT h.hacker_id AS ID, h.name AS NAME, COUNT(c.challenge_id) AS NUM
    FROM Hackers h
    JOIN Challenges c
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name)
SELECT ID, NAME, NUM
FROM count_hacker
WHERE NUM = (SELECT MAX(NUM) FROM count_hacker) /* max num*/
OR NUM IN (SELECT NUM FROM count_hacker GROUP BY NUM HAVING COUNT(NUM)=1) /* or only happended once*/
ORDER BY 3 DESC, 1
