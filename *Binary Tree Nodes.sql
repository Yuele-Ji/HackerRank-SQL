-- Solution1
-- For each N, once a condition is true, it will stop reading and return the result
SELECT N,
       CASE WHEN P IS NULL THEN 'Root'
            WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
        ELSE 'Leaf'
        END
FROM BST
ORDER BY 1

--Solution2
SELECT A.N,
       CASE WHEN A.P IS NULL THEN 'Root'
            WHEN A.P IS NOT NULL AND B.P IS NOT NULL THEN 'Inner'
        ELSE 'Leaf'
        END
FROM BST A
LEFT JOIN
(SELECT DISTINCT P FROM BST) B
ON A.N = B.P
ORDER BY A.N
