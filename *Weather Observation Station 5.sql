SELECT *
FROM (
SELECT CITY,LENGTH(CITY)
FROM STATION
ORDER BY 2, 1
LIMIT 1) MIN_CITY
UNION
SELECT *
FROM (
SELECT CITY,LENGTH(CITY)
FROM STATION
ORDER BY 2 DESC, 1
LIMIT 1) MAX_CITY
