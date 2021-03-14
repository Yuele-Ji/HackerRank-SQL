SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s
ON h.hacker_id =s.hacker_id
JOIN Challenges c
ON s.challenge_id = c.challenge_id
JOIN Difficulty d
ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY 1,2
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, 1
