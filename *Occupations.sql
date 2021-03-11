-- Solution1 JOIN

WITH D AS (
SELECT Name, ROW_NUMBER()OVER(PARTITION BY Occupation ORDER BY Name) AS ID
FROM OCCUPATIONS
WHERE Occupation = 'Doctor'),
P AS (
SELECT Name, ROW_NUMBER()OVER(PARTITION BY Occupation ORDER BY Name) AS ID
FROM OCCUPATIONS
WHERE Occupation = 'Professor'),
S AS (
SELECT Name, ROW_NUMBER()OVER(PARTITION BY Occupation ORDER BY Name) AS ID
FROM OCCUPATIONS
WHERE Occupation = 'Singer'),
A AS (
SELECT Name, ROW_NUMBER()OVER(PARTITION BY Occupation ORDER BY Name) AS ID
FROM OCCUPATIONS
WHERE Occupation = 'Actor')

SELECT D.Name, P.Name, S.Name, A.Name
FROM D
FULL JOIN P
ON D.ID = P.ID
FULL JOIN S
ON P.ID = S.ID
FULL JOIN A
ON S.ID = A.ID

-- Solution2 
-- The functions MAX, MIN, etc. use the lexicographic order when applied to text columns. 
-- occupations columns contain only a single value for each ranks, so you can reduce null value by MAX or MIN aggregate function with group by rank value.
