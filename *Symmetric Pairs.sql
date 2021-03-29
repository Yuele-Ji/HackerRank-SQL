--1.
SELECT f1.X, f1.Y FROM Functions AS f1 
WHERE f1.X = f1.Y GROUP BY f1.X, f1.Y HAVING COUNT(*) > 1
UNION
SELECT f1.X, f1.Y FROM Functions AS f1, Functions AS f2
WHERE f1.X <> f1.Y AND f1.X = f2.Y AND f1.Y = f2.X AND f1.X < f2.X
ORDER BY X;

--2.
SELECT f1.X, f1.Y
FROM Functions f1
JOIN Functions f2
ON f1.X = f2.Y AND f2.X = f1.Y
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X)>1 OR f1.X < f1.Y
ORDER BY f1.X
